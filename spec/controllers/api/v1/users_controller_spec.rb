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
    let(:params) {
      {
        email: 'tester001@example.com',
        password: 'p4SSw0rd5689',
        format: :json
      }
    }
    context 'user signed in' do
      before :each do
        sign_in user if user
        post :create, params
      end

      it 'return an HTTP status code of 201 (Created)' do
        expect(response).to be_success
        expect(response).to have_http_status(:created)
      end

      it 'return the Location header with a hyperlink to this new user' do
        user = User.find_by_email(params[:email])
        expect(response.header['Location']).to eq api_v1_user_path(user)
      end
    end
  end

  describe '#update' do

  end

  describe '#destroy' do

  end

end
