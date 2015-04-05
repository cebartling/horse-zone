class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  respond_to :json

  def authenticate
    user = User.find_by_email_address(params[:email_address])

    if user && user.authenticate(params[:password])
      render json: { auth_token: user.generate_auth_token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end
end
