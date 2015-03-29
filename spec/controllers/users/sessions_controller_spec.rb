require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do

  let!(:current_user) { FactoryGirl.create(:user) }

  describe 'POST #create' do
    let(:params) {
      {
        format: :json
      }
    }

    before :each do
      post :create, params
    end

    it 'response status code should be 200 (OK)' do
      expect(response.status).to eq Rack::Utils.status_code(:ok)
    end
  end
end
