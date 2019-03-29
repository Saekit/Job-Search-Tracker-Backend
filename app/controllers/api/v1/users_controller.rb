class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update, :destroy]
  def index
    @users = User.all
    render json: @users
  end

  # def profile
  #   render json: { user: }, status: :accepted
  # end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = JWT.encode({ email: @user.email }, '50m3th1ng')
      render json: @user
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  def destroy
    @user.destroy
    render json: { message: 'removed' }, status: :ok
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
