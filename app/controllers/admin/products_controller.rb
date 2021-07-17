class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(post_image_params)
    @product.user_id = current_user.id
    @product.save
    redirect_to admin_product_path
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
    params.require(:product).permit(:name, :image_id, :description, :price, :genre_id)
  end
  
end
