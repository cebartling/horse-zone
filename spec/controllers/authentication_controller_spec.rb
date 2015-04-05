require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  let!(:current_user) { FactoryGirl.create(:user) }

  describe 'POST #authenticate' do
    before :each do
      post :authenticate, params
    end

    context 'when credentials will successfully authenticate' do
      let(:params) do
        {
          email_address: current_user.email_address,
          password: 'Pa$$w0rd',
          format: :json
        }
      end

      describe 'response' do
        it 'status code should be 200 (OK)' do
          expect(response.status).to eq Rack::Utils.status_code(:ok)
        end

        context 'JWT' do
          let(:json) { Yajl::Parser.parse(response.body) }
          let(:decoded_auth_token) { AuthToken.decode(json['auth_token']) }

          it "contains the authenticated user's id" do
            expect(decoded_auth_token[:user_id]).to eq current_user.id
          end

          it 'contains an expiration timestamp' do
            expect(decoded_auth_token[:exp]).not_to be_nil
          end
        end
      end
    end

    context 'when credentials will fail to authenticate' do
      let(:params) do
        {
          email_address: current_user.email_address,
          password: 'B4dP4%%word',
          format: :json
        }
      end

      describe 'response' do
        it 'status code should be 401 (Unauthorized)' do
          expect(response.status).to eq Rack::Utils.status_code(:unauthorized)
        end

        context 'JSON' do
          let(:json) { Yajl::Parser.parse(response.body) }
          let(:error_message) { json['error'] }

          it 'contains an error message' do
            expect(error_message).to eq 'Invalid username or password'
          end
        end
      end
    end
  end
end
