class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admin_items_path(@item)
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Itme.find(params[:id])
  end

  def edit
    @item = Itme.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_active)
  end

end
