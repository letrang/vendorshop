class HomesController < ApplicationController
  protect_from_forgery with: :exception

  def list
    @categories = Category.order('name asc')
    @products_new = Product.products_new
    @products_price = Product.products_price
  end
  def products_category
  	  @products = []
      @categories = Category.order('name asc')
    if params[:id].present?
      @category = Category.find_by(id: params[:id])
      @products = @category.product
    end
  end

  def product_detail
    if params[:id].present?
      @categories = Category.order('name asc')
      @product = Product.find_by(id: params[:id])
      @category = @product.category
    end
  end

  def search
    @categories = Category.order('name asc')
    @search = Product.search do
      fulltext params['search']
    end
    @products = @search.results
  end
end
