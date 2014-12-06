require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do

  describe 'GET index' do
    let!(:users) { create_list(:user, 25) }

    context 'user signed in' do
      let(:user) { create(:user) }

      before :each do
        sign_in user if user
        get :index
      end

      it "assigns @users" do
        expect(assigns(:users)).not_to be_nil
      end
    end

    # context 'user not signed in' do
    #   before :each do
    #     get :index
    #   end
    #
    #   it "status to be unauthorized" do
    #     expect(response).to have_http_status(:unauthorized)
    #   end
    # end

  end

  describe '#show' do
    let!(:users) { create_list(:user, 2) }

    context 'user signed in' do
      let(:user) { create(:user) }

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

  end

  describe '#update' do

  end

  describe '#destroy' do

  end

end
