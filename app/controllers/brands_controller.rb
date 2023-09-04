class BrandsController < ApplicationController
  before_action :find_brand, only: %i(show destroy)

  def index
    brands = Brand.all
    render json: brands, status: :ok
  end

  def show
    render json: Brand.find(params[:id]), status: :ok
  end

  def create
    brand = Brand.create(brand_params)
    if brand.valid?
      render json: brand, status: :created
    else
      render json: { errors: brand.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::NotNullViolation => e
    render json: { errors: "Invalid params #{e}" }, status: :unprocessable_entity
  end

  def status
    brand = Brand.find(params[:id])
    status = brand.status == Brand.statuses[:active] ? brand.update(status: Brand.statuses[:inactive]) : brand.update(status: Brand.statuses[:active])

    if status
      render json: brand, status: :created
    else
      render json: { errors: brand }, status: :service_unavailable
    end
  end

  def update
    brand = Brand.find(params[:id])
    brand.update!(brand_params)

    if brand
      render json: brand, status: :created
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @brand.destroy
    render json: { message: 'Brand deleted successfully' }, status: :ok
  end

  private

    def brand_params
      params.permit(:name, :rate, :headquarters, :industry, :founder, :website, :status)
    end

    def find_brand
      @brand = Brand.find(params[:id])
    end
end
