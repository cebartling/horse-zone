require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do

  let(:user) { create(:user) }

  describe 'GET index' do
    let!(:users) { create_list(:user, 25) }

    context 'user signed in' do
      before :each do
        sign_in user if user
        get :index
      end

      it "assigns @users" do
        expect(assigns(:users)).not_to be_nil
      end
    end
  end

  describe 'GET show' do
    let!(:users) { create_list(:user, 2) }

    context 'user signed in' do
      before :each do
        sign_in user if user
        get :show, {id: users[0].id.to_s, format: :json}
      end

      it "assigns @user" do
        expect(assigns(:user)).to eq users[0]
      end
    end
  end

  describe 'POST create' do
    context 'user signed in' do
      before :each do
        sign_in user if user
        post :create, params
      end

      context 'valid parameters' do
        let(:params) { {email: 'tester001@example.com', password: 'p4SSw0rd5689', format: :json} }

        it 'return an HTTP status code of 201 (Created)' do
          expect(response).to be_success
          expect(response).to have_http_status(:created)
        end

        it 'return the Location header with a hyperlink to this new user' do
          user = User.find_by_email(params[:email])
          expect(response.header['Location']).to eq api_v1_user_path(user)
        end
      end

      context 'invalid parameters: missing password' do
        let(:params) { {email: 'tester001@example.com', format: :json} }

        it 'return an HTTP status code of 400 (Bad Request)' do
          expect(response).to have_http_status(:bad_request)
        end

        context 'errors JSON' do
          subject(:json) { JSON.parse(response.body.to_s) }

          it 'will render the errors in JSON' do
            expect(json.has_key? 'errors').to be_truthy
            expect(json['errors'][0].has_key? 'password').to be_truthy
            expect(json['errors'][0]['password'].include? "can't be blank").to be_truthy
          end
        end
      end

      context 'invalid parameters: missing username' do
        let(:params) { {password: 'p4SSw0rd5689', format: :json} }

        it 'return an HTTP status code of 400 (Bad Request)' do
          expect(response).to have_http_status(:bad_request)
        end

        context 'errors JSON' do
          subject(:json) { JSON.parse(response.body.to_s) }

          it 'will render the errors in JSON' do
            expect(json.has_key? 'errors').to be_truthy
            expect(json['errors'][0].has_key? 'email').to be_truthy
            expect(json['errors'][0]['email'].include? "can't be blank").to be_truthy
          end
        end
      end

      context 'invalid parameters: missing username and password' do
        let(:params) { {format: :json} }

        it 'return an HTTP status code of 400 (Bad Request)' do
          expect(response).to have_http_status(:bad_request)
        end

        context 'errors JSON' do
          subject(:json) { JSON.parse(response.body.to_s) }

          it 'will render the errors in JSON' do
            expect(json.has_key? 'errors').to be_truthy
            expect(json['errors'][0].has_key? 'email').to be_truthy
            expect(json['errors'][0]['email'].include? "can't be blank").to be_truthy
            expect(json['errors'][0].has_key? 'password').to be_truthy
            expect(json['errors'][0]['password'].include? "can't be blank").to be_truthy
          end
        end
      end
    end
  end

  describe ' PUT update' do
    let!(:user_to_update) { create(:user) }
    let!(:original_encrypted_password) { user_to_update.encrypted_password }
    let!(:original_email) { user_to_update.email }
    let!(:new_email) { 'tester002@example.com' }
    let!(:new_password) { 'P4ssW0rd9876' }

    context 'user signed in' do
      before :each do
        sign_in user if user
        put :update, params
      end

      context 'valid parameters' do
        context 'update email and password' do
          let(:params) { {id: user_to_update.id, email: new_email, password: new_password, format: :json} }

          it 'return an HTTP status code of 204 (No Content)' do
            expect(response).to be_success
            expect(response).to have_http_status(:no_content)
          end

          it 'updates the user\'s email address' do
            expect(User.find(user_to_update.id).email).to eq new_email
          end

          it 'updates the user\'s password' do
            expect(User.find(user_to_update.id).encrypted_password).not_to eq original_encrypted_password
          end
        end

        context 'update password' do
          let(:params) { {id: user_to_update.id, password: new_password, format: :json} }

          it 'return an HTTP status code of 204 (No Content)' do
            expect(response).to be_success
            expect(response).to have_http_status(:no_content)
          end

          it 'leaves the user\'s email address untouched' do
            expect(User.find(user_to_update.id).email).to eq original_email
          end

          it 'updates the user\'s password' do
            expect(User.find(user_to_update.id).encrypted_password).not_to eq original_encrypted_password
          end
        end

        context 'update email only' do
          let(:params) { {id: user_to_update.id, email: new_email, format: :json} }

          it 'return an HTTP status code of 204 (No Content)' do
            expect(response).to be_success
            expect(response).to have_http_status(:no_content)
          end

          it 'updates the user\'s email address' do
            expect(User.find(user_to_update.id).email).to eq new_email
          end

          it 'user\'s password is left untouched' do
            expect(User.find(user_to_update.id).encrypted_password).to eq original_encrypted_password
          end
        end
      end

      context 'invalid parameters' do
        let(:params) { {id: -347238, email: new_email, password: new_password, format: :json} }

        it 'return an HTTP status code of 400 (Bad Request)' do
          expect(response).to have_http_status(:bad_request)
        end

        it 'leaves the user\'s email address unchanged' do
          expect(User.find(user_to_update.id).email).to eq original_email
        end

        it 'leaves the user\'s password changed' do
          expect(User.find(user_to_update.id).encrypted_password).to eq original_encrypted_password
        end
      end
    end
  end

  describe '#destroy' do
    let!(:user_to_delete) { create(:user) }

    context 'user signed in' do
      before :each do
        sign_in user if user
        delete :destroy, params
      end

      context 'valid parameters' do
        context 'update email and password' do
          let(:params) { {id: user_to_delete.id, format: :json} }

          it 'return an HTTP status code of 204 (No Content)' do
            expect(response).to be_success
            expect(response).to have_http_status(:no_content)
          end

          it 'removes the user from the database' do
            expect(User.where(id: user_to_delete.id).count).to eq 0
          end
        end

        context 'invalid parameters' do
          let(:params) { {id: -347238, format: :json} }

          it 'return an HTTP status code of 400 (Bad Request)' do
            expect(response).to have_http_status(:bad_request)
          end

          it 'leaves the user unchanged' do
            expect(User.where(id: user_to_delete.id).count).to eq 1
          end
        end
      end
    end

  end
end
