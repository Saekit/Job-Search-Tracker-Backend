class ApplicationController < ActionController::API
  before_action :authorized

  def issue_token(payload)
    JWT.encode(payload, '50m3th1ng')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header
      begin
        JWT.decode(token, '50m3th1ng', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      email = decoded_token[0]['email']
      @user = User.find_by(email: email)
    else
      nil
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    if !logged_in?
      render json: { message: 'Please log in' }, status: :unauthorized
      unless logged_in?
    end
  end
end
