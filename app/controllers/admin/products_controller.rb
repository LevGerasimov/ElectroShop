module Admin
  class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :set_categories, only: [:index, :new, :edit, :create, :update]

    def index
      @products = Product.includes(:category).all
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_product_path(@product), notice: "Товар успешно создан"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      if @product.update(product_params)
        redirect_to admin_product_path(@product), notice: "Товар успешно обновлен"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_url, notice: "Товар успешно удален"
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    def product_params
      params.require(:product).permit(:name, :price, :quantity, :description, :category_id, :image)
    end
  end
end
