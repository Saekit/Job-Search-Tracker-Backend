class Api::V1::AuthController < ApplicationController
  skip_before_action :aithorized, only: [:create]

  def create
    @user = User.find_by(email: user_login_params[:email])
    if @user && @user.authenticate(user_login_params[:password])
      @token = JWT.encode({ email: @user.email }, '50m3th1ng')
      render json: { user: UserSerializer.new(@user), jwt: @token },
      status: :accepted
    else
      render json: { message: 'Invaild email or password' }, status: :unauthorized
    end
  end

  private
  def user_login_params
    params.require(:auth).permit(:email, :password)
  end
end
