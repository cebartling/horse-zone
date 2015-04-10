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
        email_address: 'chris.bartling@horsezone.net',
        password: 'p4$$w0rd',
        first_name: 'Chris',
        last_name: 'Bartling',
        format: :json
      }
    end
    let(:newly_created_user) { FactoryGirl.create(:user) }

    let!(:use_case_mock) { double(UserManagement::CreateNewUser) }
    let!(:successful_outcome) { UseCase::SuccessfulOutcome.new(newly_created_user) }
    let!(:failed_outcome) { UseCase::FailedOutcome.new }

    context 'user is authenticated to the system' do
      before :each do
        authenticate current_user
        allow(UserManagement::CreateNewUser).to receive(:new).and_return use_case_mock
      end

      context 'successful outcome' do
        before :each do
          allow(use_case_mock).to receive(:execute).and_return successful_outcome
        end

        it 'creates a UserManagement::CreateNewUser use case' do
          expect(UserManagement::CreateNewUser).to receive(:new)
          post :create, params
        end

        it 'executes the UserManagement::CreateNewUser use case instance' do
          expect(use_case_mock).to receive(:execute)
          post :create, params
        end

        it 'status code should be 204 (Created)' do
          post :create, params
          expect(response.status).to eq Rack::Utils.status_code(:created)
        end

        it 'sets the Location header to new user URI' do
          post :create, params
          expect(response.headers['Location']).to eq api_user_path(newly_created_user)
        end

        it 'should not have an entity-body' do
          post :create, params
          expect(response.body).to eq ''
        end
      end

      context 'failed outcome' do
        before :each do
          allow(use_case_mock).to receive(:execute).and_return failed_outcome
        end

        it 'status code should be 422 (Unprocessable Entity)' do
          post :create, params
          expect(response.status).to eq Rack::Utils.status_code(:unprocessable_entity)
        end
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
    let(:existing_user) { FactoryGirl.create(:user) }
    let(:params) do
      {
        id: existing_user.id.to_s,
        email_address: 'chris.bartling@horsezone.net',
        password: 'p4$$w0rd',
        first_name: 'Christopher',
        last_name: 'Bartling',
        format: :json
      }
    end

    let!(:use_case_mock) { double(UserManagement::UpdateExistingUser) }
    let!(:successful_outcome) { UseCase::SuccessfulOutcome.new(existing_user) }
    let!(:failed_outcome) { UseCase::FailedOutcome.new }

    context 'user is authenticated to the system' do
      before :each do
        authenticate current_user
        allow(UserManagement::UpdateExistingUser).to receive(:new).and_return use_case_mock
      end

      context 'successful outcome' do
        before :each do
          allow(use_case_mock).to receive(:execute).and_return successful_outcome
        end

        it 'creates a UserManagement::UpdateExistingUser use case' do
          expect(UserManagement::UpdateExistingUser).to receive(:new)
          put :update, params
        end

        it 'executes the UserManagement::UpdateExistingUser use case instance' do
          expect(use_case_mock).to receive(:execute)
          put :update, params
        end

        it 'status code should be 204 (No Content)' do
          put :update, params
          expect(response.status).to eq Rack::Utils.status_code(:no_content)
        end

        it 'should not have an entity-body' do
          put :update, params
          expect(response.body).to eq ''
        end
      end

      context 'failed outcome' do
        before :each do
          allow(use_case_mock).to receive(:execute).and_return failed_outcome
        end

        it 'status code should be 422 (Unprocessable Entity)' do
          put :update, params
          expect(response.status).to eq Rack::Utils.status_code(:unprocessable_entity)
        end
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
    let(:existing_user) { FactoryGirl.create(:user) }
    let(:params) do
      {
        id: existing_user.id.to_s,
        format: :json
      }
    end

    let!(:use_case_mock) { double(UserManagement::DeleteExistingUser) }
    let!(:successful_outcome) { UseCase::SuccessfulOutcome.new(existing_user) }
    let!(:failed_outcome) { UseCase::FailedOutcome.new }

    context 'user is authenticated to the system' do
      before :each do
        authenticate current_user
        allow(UserManagement::DeleteExistingUser).to receive(:new).and_return use_case_mock
      end

      context 'successful outcome' do
        before :each do
          allow(use_case_mock).to receive(:execute).and_return successful_outcome
        end

        it 'creates a UserManagement::DeleteExistingUser use case' do
          expect(UserManagement::DeleteExistingUser).to receive(:new)
          delete :destroy, params
        end

        it 'executes the UserManagement::DeleteExistingUser use case instance' do
          expect(use_case_mock).to receive(:execute)
          delete :destroy, params
        end

        it 'returns a status code of 204 (No Content)' do
          delete :destroy, params
          expect(response.status).to eq Rack::Utils.status_code(:no_content)
        end

        it 'should not have an entity-body' do
          delete :destroy, params
          expect(response.body).to eq ''
        end
      end

      context 'failed outcome' do
        before :each do
          allow(use_case_mock).to receive(:execute).and_return failed_outcome
        end

        it 'returns a status code of 422 (Unprocessable Entity)' do
          delete :destroy, params
          expect(response.status).to eq Rack::Utils.status_code(:unprocessable_entity)
        end
      end
    end

    context 'user is not authenticated to the system' do
      before :each do
        delete :destroy, params
      end

      it 'returns a status code of 401 (Unauthorized)' do
        expect(response.status).to eq Rack::Utils.status_code(:unauthorized)
      end
    end
  end
end
