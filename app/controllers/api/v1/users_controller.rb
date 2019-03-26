class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update, :destroy]
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    render json: @user
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
    @users = User.all
    @user.destroy
    render json: @users
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
