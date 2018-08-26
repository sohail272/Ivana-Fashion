class Product < ApplicationRecord

  mount_uploader :image, ProductImageUploader

  def self.filter_by(brands, colors)
    @products = Product.all
    @products = @products.where(product_brand: brands) if brands.present?
    @products = @products.where(product_color: colors) if colors.present?
    @products
  end

end
