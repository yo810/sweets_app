class Public::HomesController < ApplicationController

  def top
    @items = Item.page(params[:page]).per(4)
  end

  def about
    @customer = current_customer
  end
end
