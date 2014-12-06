require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do

  describe 'GET index' do
    let!(:users) { create_list(:user, 25) }

    before :each do
      get :index
    end

    it "assigns @users" do
      expect(assigns(:users)).not_to be_nil
    end

  end

  describe '#show' do

  end

  describe '#create' do

  end

  describe '#update' do

  end

  describe '#destroy' do

  end

end
