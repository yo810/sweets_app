class Admin::OrderdetailsController < ApplicationController
  def show
    @orderdetails = Orderdetails.find(params[:id])
  end
end
