class Public::OrdersController < ApplicationController

  def create
    @order = Order.new(order_params)
    if @order.save
      create_order_details(@order)
      CartItem.destroy_all
      redirect_to complete_public_orders_path
    else
      render :new
    end
  end

  def new
    @order = Order.new
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
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
