class ProductsController < ApplicationController
  before_action :find_product, only: %i(show destroy)

  def index
    products = Product.all
    render json: products, status: :ok
  end

  def show
    render json: @product, status: :ok
  end

  # Create with brand
  def create
    brand = Brand.find(params[:brand_id])
    product = brand.products.create(product_params)

    if product
      render json: product, status: :created
    else
      render json: { errors: product }, status: :service_unavailable
    end
  end

  def status
    product = Product.find(params[:id])
    status = product.status == Brand.statuses[:active] ? product.update(status: Brand.statuses[:inactive]) : product.update(status: Brand.statuses[:active])

    if status
      render json: product, status: :created
    else
      render json: { errors: product }, status: :service_unavailable
    end
  end

  def update
    product = Product.find(params[:id])
    product.update!(product_params)

    if product
      render json: product, status: :created
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      render json: { message: 'Product deleted successfully' }, status: :no_content
    else
      render json: { error: 'Failed to delete product' }, status: :unprocessable_entity
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :currency, :weight, :sku, :description, :manufacturing_date, :status,
                                      :brand_id)
    end

    def find_product
      @product = Product.find(params[:id])
    end
end
