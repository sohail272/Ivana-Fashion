class Product < ApplicationRecord

  def self.filter_by(brands, colors)
    @products = Product.all
    @products = @products.where(product_brand: brands)
    @products = @products.where(product_color: colors)
    @products
  end

end
