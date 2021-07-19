class Public::OrdersController < ApplicationController
  def new
  end

  def create
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def thankyou
  end

  def comfirm
  end
end
