class Public::CartitemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(params_cart_item)
    @cart_item = CartItem.find_by(item: @cart_item.item)
    if @cart_item.save
      flash[:notice] = "#{@cart_item.item.name}をカートに追加しました。"
      redirect_to public_cartitems_path
    else
      flash[:alert] = "個数を選択してください。"
      render "public/items/show"
    end
  end

  def update
  end

  def destroy
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました。。"
    redirect_to public_cartitems_path
  end

  private
  def cartitem_params
      params.require(:cartitem).permit(:item_id, :amount)
  end
end
