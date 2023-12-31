class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  before_action :find_user, only: %i(show destroy)
  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    render json: user, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { user_name: user.user_name, email: user.email }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :service_unavailable
    end
  end

  def update
    user = User.find(params[:id])

    if user.update!(auth_credentials: params[:auth_credentials], payout_rate: params[:payout_rate],
                    password: user.password_digest)
      render json: { message: "Successful update user payment info" }, status: :created
    else
      render :edit, status: :unprocessable_entity
    end
  end

  delegate :destroy, to: :user

  private

    def user_params
      params.permit(:user_name, :email, :password, :auth_credentials, :payout_rate)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
