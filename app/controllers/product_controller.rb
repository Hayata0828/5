class ProductController < ApplicationController
  add_breadcrumb '商品一覧', :root_path
  def index
    @products = Product.page(params[:page]).per(50)
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.create(product_params)
    redirect_to("/")
  end

  def show
    @product = Product.find_by(id: params[:id])
    add_breadcrumb @product.title
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(product_params)
    redirect_to('/mypage')
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to("/mypage")
  end

  private
  def product_params
    params.require(:product).permit(:title, :price, :description, :manager_id, product_images_attributes: [:image, :product_id])
  end

  def product_images_params
    params.require(:product_images).map do |param|
      ActionController::Parameters.new(param.to_hash).permit(:id, :enable)
    end
  end


end

def hoges_params
    params.require(:hoges).map do |param|
      ActionController::Parameters.new(param.to_hash).permit(:id, :enable)
    end
  end