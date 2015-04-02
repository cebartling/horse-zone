require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  let!(:current_user) { FactoryGirl.create(:user) }

  describe 'routing configuration' do
    it 'GET #index' do
      request.host = "api.example.com"
      expect({:get => "http://#{request.host}/api/users.json"}).to route_to(controller: 'api/users',
                                                                            action: 'index',
                                                                            format: 'json')
    end

    it 'POST #create' do
      request.host = "api.example.com"
      expect({:post => "http://#{request.host}/api/users.json"}).to route_to(controller: 'api/users',
                                                                             action: 'create',
                                                                             format: 'json')
    end

    it 'PUT #update' do
      request.host = "api.example.com"
      expect({:put => "http://#{request.host}/api/users/1.json"}).to route_to(controller: 'api/users',
                                                                              action: 'update',
                                                                              id: '1',
                                                                              format: 'json')
    end

    it 'DELETE #destroy' do
      request.host = "api.example.com"
      expect({:delete => "http://#{request.host}/api/users/1.json"}).to route_to(controller: 'api/users',
                                                                                 action: 'destroy',
                                                                                 id: '1',
                                                                                 format: 'json')
    end
  end

  describe 'GET #index' do
    let!(:users) { FactoryGirl.create_list(:user, 25) }

    let(:params) {
      {
        format: :json
      }
    }

    context 'user is authenticated to the system' do
      before :each do
        authenticate current_user
        get :index, params
      end

      it 'status code should be 200 (OK)' do
        expect(response.status).to eq Rack::Utils.status_code(:ok)
      end
    end

    context 'user is not authenticated to the system' do
      before :each do
        get :index, params
      end

      it 'status code should be 401 (Unauthorized)' do
        expect(response.status).to eq Rack::Utils.status_code(:unauthorized)
      end
    end
  end

  describe 'POST #create' do
    let(:params) {
      {
        format: :json
      }
    }

    context 'user is authenticated to the system' do
      before :each do
        authenticate current_user
        post :create, params
      end

      it 'status code should be 204 (Created)' do
        expect(response.status).to eq Rack::Utils.status_code(:created)
      end
    end

    context 'user is not authenticated to the system' do
      before :each do
        post :create, params
      end

      it 'status code should be 401 (Unauthorized)' do
        expect(response.status).to eq Rack::Utils.status_code(:unauthorized)
      end
    end
  end

  describe 'PUT #update' do
    let(:params) {
      {
        format: :json,
        id: '1'
      }
    }

    context 'user is authenticated to the system' do
      before :each do
        authenticate current_user
        put :update, params
      end

      it 'status code should be 204 (No Content)' do
        expect(response.status).to eq Rack::Utils.status_code(:no_content)
      end
    end

    context 'user is not authenticated to the system' do
      before :each do
        put :update, params
      end

      it 'status code should be 401 (Unauthorized)' do
        expect(response.status).to eq Rack::Utils.status_code(:unauthorized)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:params) {
      {
        format: :json,
        id: '1'
      }
    }

    context 'user is authenticated to the system' do
      before :each do
        authenticate current_user
        delete :destroy, params
      end

      it 'status code should be 204 (No Content)' do
        expect(response.status).to eq Rack::Utils.status_code(:no_content)
      end
    end

    context 'user is not authenticated to the system' do
      before :each do
        delete :destroy, params
      end

      it 'status code should be 401 (Unauthorized)' do
        expect(response.status).to eq Rack::Utils.status_code(:unauthorized)
      end
    end
  end
end
