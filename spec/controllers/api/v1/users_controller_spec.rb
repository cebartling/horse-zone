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

  describe '#show' do
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

  describe '#create' do
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

  describe '#update' do

  end

  describe '#destroy' do

  end

end
