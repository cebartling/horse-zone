require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  let(:users) { create_list :user, 25 }
  let(:current_user) { create :user }

  describe 'GET #index' do

    context 'routing' do
      it 'is configured correctly' do
        request.host = "api.example.com"
        expect({:get => "http://#{request.host}/api/users"}).to route_to(controller: 'api/users', action: 'index')
      end
    end

    # before :each do
    #
    #   get :index, {}
    # end

  end

  describe 'POST #create' do

    context 'routing' do
      it 'is configured correctly' do
        request.host = "api.example.com"
        expect({:post => "http://#{request.host}/api/users"}).to route_to(controller: 'api/users', action: 'create')
      end
    end

  end

  describe 'PUT #update' do

    context 'routing' do
      it 'is configured correctly' do
        request.host = "api.example.com"
        expect({:put => "http://#{request.host}/api/users/1"}).to route_to(controller: 'api/users',
                                                                           action: 'update',
                                                                           id: '1')
      end
    end

  end

  describe 'DELETE #destroy' do

    context 'routing' do
      it 'is configured correctly' do
        request.host = "api.example.com"
        expect({:delete => "http://#{request.host}/api/users/1"}).to route_to(controller: 'api/users',
                                                                              action: 'destroy',
                                                                              id: '1')
      end
    end

  end


end
