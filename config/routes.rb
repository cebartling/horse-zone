Rails.application.routes.draw do

  root 'welcome#index'

  post 'authenticate' => 'authentication#authenticate'

  namespace :api do
    # Directs /api/users/* to Api::UsersController
    # (app/controllers/api/users_controller.rb)
    resources :users
  end
end

# == Route Map
#
#        Prefix Verb   URI Pattern                   Controller#Action
#          root GET    /                             welcome#index
#  authenticate POST   /authenticate(.:format)       authentication#authenticate
#     api_users GET    /api/users(.:format)          api/users#index
#               POST   /api/users(.:format)          api/users#create
#  new_api_user GET    /api/users/new(.:format)      api/users#new
# edit_api_user GET    /api/users/:id/edit(.:format) api/users#edit
#      api_user GET    /api/users/:id(.:format)      api/users#show
#               PATCH  /api/users/:id(.:format)      api/users#update
#               PUT    /api/users/:id(.:format)      api/users#update
#               DELETE /api/users/:id(.:format)      api/users#destroy
#
