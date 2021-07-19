class Public::ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = Product.page(params[:page]).per(8)
  end

  def show
  end
end
