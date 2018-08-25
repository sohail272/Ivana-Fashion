class Admins::ProductsController < AdminsController

  before_action :set_product, only: [:show, :edit, :update]

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save!
      redirect_to admin_product_path(current_admin, product)
    else
      redirect_to :back
    end 
  end

  def index
    @products = Product.all
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def search_params
    params.permit(:page)
  end

  def product_params
    params.require(:product).permit(:image, :name, :description, :price, :new_productl, :product_sale, :giftable, :product_color, :product_brand, :product_size, :_destroy)
  end

end
