class ProductsController < ApplicationController

  before_action :check_login
  def index
      @products = Product.all
  end

  def search
    @products = Product.where("name LIKE ?", "%#{params[:query]}%")
  end

  def new
    if(@current_user.is_admin)
      @product = Product.new
    else
      render plain: '401 Unauthorized', status: :unauthorized
    end
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end