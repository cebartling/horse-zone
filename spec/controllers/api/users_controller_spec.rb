require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  let!(:current_user) { FactoryGirl.create(:user) }

  describe 'routing configuration' do

    before :each do
      request.host = 'api.example.com'
    end

    it 'GET #index' do
      expect(get: "http://#{request.host}/api/users.json").to route_to(controller: 'api/users',
                                                                       action: 'index',
                                                                       format: 'json')
    end

    it 'POST #create' do
      expect(post: "http://#{request.host}/api/users.json").to route_to(controller: 'api/users',
                                                                        action: 'create',
                                                                        format: 'json')
    end

    it 'PUT #update' do
      expect(put: "http://#{request.host}/api/users/1.json").to route_to(controller: 'api/users',
                                                                         action: 'update',
                                                                         id: '1',
                                                                         format: 'json')
    end

    it 'DELETE #destroy' do
      expect(delete: "http://#{request.host}/api/users/1.json").to route_to(controller: 'api/users',
                                                                            action: 'destroy',
                                                                            id: '1',
                                                                            format: 'json')
    end
  end

  describe 'GET #index' do
    let!(:users) { FactoryGirl.create_list(:user, 25) }

    let(:params) do
      {
        format: :json
      }
    end

    context 'user is authenticated to the system' do
      let(:use_case_mock) { double(UserManagement::RetrieveUsers) }
      let(:successful_outcome) { UseCase::SuccessfulOutcome.new(users) }
      let(:failed_outcome) { UseCase::FailedOutcome.new }

      before :each do
        authenticate current_user
        allow(UserManagement::RetrieveUsers).to receive(:new).and_return use_case_mock
      end

      context 'successful outcome' do
        before :each do
          allow(use_case_mock).to receive(:execute).and_return successful_outcome
        end

        it 'creates a UserManagement::RetrieveUsers use case' do
          expect(UserManagement::RetrieveUsers).to receive(:new)
          get :index, params
        end

        it 'executes the UserManagement::RetrieveUsers use case instance' do
          expect(use_case_mock).to receive(:execute)
          get :index, params
        end

        it 'status code should be 200 (OK)' do
          get :index, params
          expect(response.status).to eq Rack::Utils.status_code(:ok)
        end

        it 'assigns users' do
          get :index, params
          expect(assigns(:users)).to eq users
        end
      end

      context 'failed outcome' do
        before :each do
          allow(use_case_mock).to receive(:execute).and_return failed_outcome
        end

        it 'status code should be 422 (Unprocessable Entity)' do
          get :index, params
          expect(response.status).to eq Rack::Utils.status_code(:unprocessable_entity)
        end
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
    let(:params) do
      {
        format: :json
      }
    end

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
    let(:params) do
      {
        format: :json,
        id: '1'
      }
    end

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
    let(:params) do
      {
        format: :json,
        id: '1'
      }
    end

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
