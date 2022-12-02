class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @item_all = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :price)
  end
end
