require 'rails_helper'

RSpec.describe UserManagement::UpdateExistingUser do

  describe '#execute' do
    let(:use_case) { UserManagement::UpdateExistingUser.new }
    let(:existing_user) { FactoryGirl.create(:user) }

    before :each do
      @outcome = use_case.execute(params)
    end

    context 'happy path' do
      let(:params) {
        {
          :email_address => 'joe.smith001@mycompany.com',
          :first_name => 'Joseph',
          :last_name => 'Smith',
          :id => existing_user.id
        }
      }

      it 'should execute successfully' do
        expect(@outcome.success?).to be_truthy
      end

      it 'result should be the existing user' do
        expect(@outcome.result).to be_instance_of User
        expect(@outcome.result.id).to eq existing_user.id
      end

      it 'should have email address set on the existing user' do
        expect(@outcome.result.email_address).to eq params[:email_address]
      end

      it 'should have first name set on the existing user' do
        expect(@outcome.result.first_name).to eq params[:first_name]
      end

      it 'should have last name set on the existing user' do
        expect(@outcome.result.last_name).to eq params[:last_name]
      end
    end

    context 'invalid parameters' do
      context 'missing id' do
        let(:params) {
          {
            :email_address => 'joe.smith001@mycompany.com',
            :first_name => 'Joseph',
            :last_name => 'Smith'
          }
        }

        it 'should fail execution' do
          expect(@outcome.success?).to be_falsey
        end

        it 'pre-condition failed' do
          expect(@outcome.pre_condition_failed).to be_truthy
        end
      end
    end
  end
end
