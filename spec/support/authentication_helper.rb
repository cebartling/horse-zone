module AuthenticationHelper

  def authenticate(user)
    request.env['HTTP_AUTHORIZATION'] = "Bearer #{user.generate_auth_token}"
  end

end
