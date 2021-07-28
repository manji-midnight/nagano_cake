class Admin::ProductsController < ApplicationController
  
  def index
<<<<<<< HEAD
    @products = Product.all.page(params[:page]).per(10)
=======
>>>>>>> 8affcfd854fc6bc220b8b745150afb732a40f124
  end

  def new
  end

  def create
<<<<<<< HEAD
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
=======
>>>>>>> 8affcfd854fc6bc220b8b745150afb732a40f124
  end

  def show
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admin_product_path(product)
  end
<<<<<<< HEAD
  
  private

  def product_params
    params.require(:product).permit(:name, :image, :description, :price, :genre_id, :is_active)
  end
  
=======
>>>>>>> 8affcfd854fc6bc220b8b745150afb732a40f124
end
