require 'digest/md5'

class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def index
    hash = Digest::MD5.hexdigest(current_user.email.downcase)
    profile_image_src = "http://www.gravatar.com/avatar/#{hash}?size=60"
    render view: 'index',
           layout: 'authenticated-application',
           locals: { profile_image_src: profile_image_src }
  end

end
