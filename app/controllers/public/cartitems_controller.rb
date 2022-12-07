class Public::CartitemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to public_cartitems_path
    else
      @cart_item.save
      redirect_to public_cartitems_path
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.customer_id = current_customer.id
    cart_item.update(cart_item_params)
    redirect_to public_cartitems_path(cart_item.id)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.customer_id = current_customer.id
    cart_item.destroy
    redirect_to public_cartitems_path(cart_item.id)
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました。。"
    redirect_to public_cartitems_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end
end
