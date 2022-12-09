class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def create
    # binding.pry
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
    current_customer.cart_items.destroy_all
    # binding.pry
    @cart_items.each do |cart_item|
      @order_details = @order.order_details.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_detail.price = cart_item.item.price
      @order_details.amount = cart_item.amount
      @order_details.save
    end
    current_customer.cart_items.destroy_all
    render :complete
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.shipping_cost = 500
    @order.total = @order.shipping_cost+@total
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    # @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(
      :customer_id,
      :postal_code,
      :address,
      :name,
      :payment_method,
      :total,
      :shipping_cost,
      :status,
      )
  end

end
