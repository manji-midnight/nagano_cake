class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :image, :description, :price, :genre_id)
  end
  
end
