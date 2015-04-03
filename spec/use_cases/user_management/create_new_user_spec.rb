require 'rails_helper'

RSpec.describe UserManagement::CreateNewUser do

  describe '#execute' do
    let(:use_case) {UserManagement::CreateNewUser.new}

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
    end

    context 'invalid parameters' do
      context 'missing email address' do
        let(:params) {
          {:password => 'MyP4$$w0rD'}
        }

        it 'should fail execution' do
          expect(@outcome.success?).to be_falsey
        end
      end

      context 'missing password' do
        let(:params) {
          {:email_address => 'joe.smith@mycompany.com'}
        }

        it 'should fail execution' do
          expect(@outcome.success?).to be_falsey
        end
      end
    end
  end
end
