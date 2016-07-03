# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  resources :tenant_locations
  resources :lessons
  resources :schedules
  resources :tenant_user_roles
  resources :roles
  resources :tenants
  scope '/api/v1' do
    resources :users
  end
end

# == Route Map
#
# Prefix Verb   URI Pattern                 Controller#Action
#  users GET    /api/v1/users(.:format)     users#index
#        POST   /api/v1/users(.:format)     users#create
#   user GET    /api/v1/users/:id(.:format) users#show
#        PATCH  /api/v1/users/:id(.:format) users#update
#        PUT    /api/v1/users/:id(.:format) users#update
#        DELETE /api/v1/users/:id(.:format) users#destroy
#
