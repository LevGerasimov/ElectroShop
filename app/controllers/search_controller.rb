class SearchController < ApplicationController
  def index
    @query = params[:q].to_s.strip
    
    if @query.present?
      search_products
      search_categories
    else
      @products = []
      @categories = []
    end
  end

  private

  def search_products
    @products = Product.where(
      "name LIKE ? OR description LIKE ?",
      "%#{@query}%",
      "%#{@query}%"
    ).includes(:category).limit(20)
  end

  def search_categories
    @categories = Category.where(
      "name LIKE ?",
      "%#{@query}%"
    ).limit(10)
  end
end
