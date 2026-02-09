class ProductsController < ApplicationController

    before_action :authenticate_user!

    def index
        @categories = Category.all
        @products = if params[:category_id].present?
                      Product.where(category_id: params[:category_id]).includes(:category)
                    else
                      Product.includes(:category)
                    end
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description)
  end
end
