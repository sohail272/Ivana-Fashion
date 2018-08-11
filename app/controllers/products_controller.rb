class ProductsController < ApplicationController

  before_action :set_product, only: [:show]

  def index
    brands = search_params[:brands]
    colors = search_params[:colors]
    @products = Product.filter_by(brands, colors)
    @products = @products.paginate(:page => search_params[:page], :per_page => 6) if @products
    @brands = Brand.all
    @colors = Color.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def search_params
    params.permit(:page, brands: [], colors: [])
  end

end
