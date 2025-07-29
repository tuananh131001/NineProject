class BrandsController < ApplicationController
  before_action :set_brand, only: %i[show status update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  rescue_from ActiveRecord::RecordInvalid, ActiveRecord::NotNullViolation, with: :handle_validation_error

  def index
    brands = Brand.all
    render json: brands, status: :ok
  end

  def show
    render json: @brand, status: :ok
  end

  def create
    brand = Brand.new(brand_params)
    if brand.save
      render json: brand, status: :created
    else
      render_error(brand.errors.full_messages)
    end
  end

  def status
    new_status = @brand.active? ? :inactive : :active
    if @brand.update(status: new_status)
      render json: @brand, status: :ok
    else
      render_error(@brand.errors.full_messages)
    end
  end

  def update
    if @brand.update(update_params)
      render json: @brand, status: 200
    else
      render_error(@brand.errors.full_messages)
    end
  end

  def destroy
    if @brand.destroy
      render json: { message: 'Brand deleted successfully' }, status: :ok
    else
      render_error(@brand.errors.full_messages)
    end
  end

  private

  def brand_params
    params.permit(:name, :rate, :headquarters, :industry, :founder, :website, :status)
  end

  def update_params
  params.require(:brand).permit(:name, :rate, :headquarters, :industry, :founder, :website, :status)
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def handle_not_found
    render json: { error: ['Brand not found'] }, status: :not_found
  end

  def handle_validation_error(exception)
    message = exception.is_a?(ActiveRecord::RecordInvalid) ? 
      exception.record.errors.full_messages : 
      "Invalid parameters: #{exception.message}"
    render_error(message)
  end

  def render_error(message)
    render json: { error: [message] }, status: :unprocessable_entity
  end
end
