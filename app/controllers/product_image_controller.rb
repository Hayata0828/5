class ProductImageController < ApplicationController
  def create
    @product_image = ProductImage.create(product_image_params)
  end

  private

  def product_image_params
    params.require(:product_image).permit(:image, :product_id)
  end
end