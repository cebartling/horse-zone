require 'rails_helper'

RSpec.describe UserManagement::CreateNewUser do
  describe '#execute' do
    let(:use_case) { UserManagement::CreateNewUser.new }

    before :each do
      @outcome = use_case.execute(params)
    end

    context 'happy path' do
      let(:params) {
        {:email_address => 'joe.smith@mycompany.com', :password => 'MyP4$$w0rD'}
      }

      it 'should execute successfully' do
        expect(@outcome.success?).to be_truthy
      end

      it 'result should be new user' do
        expect(@outcome.result).to be_instance_of User
      end

      it 'new user should have email address set' do
        expect(@outcome.result.email_address).to eq params[:email_address]
      end

      it 'new user should have digested password set' do
        expect(@outcome.result.password_digest).not_to be_nil
      end
    end

    context 'invalid parameters' do
      context 'missing email address' do
        let(:params) {
          {:password => 'MyP4$$w0rD'}
        }
        let(:expected_messages) {
          {email_address: ["can't be blank"]}
        }

        it 'should fail execution' do
          expect(@outcome.success?).to be_falsey
        end

        it 'contains message about missing email address' do
          expect(@outcome.failure.errors.messages).to eq expected_messages
        end
      end

      context 'missing password' do
        let(:params) {
          {:email_address => 'joe.smith@mycompany.com'}
        }
        let(:expected_messages) {
          {password: ["can't be blank"]}
        }

        it 'should fail execution' do
          expect(@outcome.success?).to be_falsey
        end

        it 'contains message about missing password' do
          expect(@outcome.failure.errors.messages).to eq expected_messages
        end
      end
    end
  end
end
