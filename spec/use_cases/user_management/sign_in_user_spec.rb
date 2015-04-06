require 'rails_helper'

RSpec.describe UserManagement::SignInUser do

  describe '#execute' do
    let(:use_case) { UserManagement::SignInUser.new }
    let(:existing_user) { FactoryGirl.create(:user) }
    let(:outcome) { use_case.execute(params) }

    context 'authentication' do
      let(:params) { {email_address: existing_user.email_address, password: 'Pa$$w0rd'} }

      it 'should execute successfully' do
        expect(outcome.success?).to be_truthy
      end

      it 'result should be the authenticated user' do
        expect(outcome.result).to be_instance_of User
      end

      it 'the sign in count on the user should be 1' do
        expect(outcome.result.sign_in_count).to eq 1
      end
    end

    context 'invalid parameters' do
      context 'invalid email address' do
        let(:params) { {email_address: 'jane.wrong@mycompany.com', password: 'Pa$$w0rd'} }

        it 'should fail execution' do
          expect(outcome.success?).to be_falsey
        end

        it 'should fail pre-condition' do
          expect(outcome.pre_condition_failed).to be_truthy
        end
      end

      context 'invalid password' do
        let(:params) { {email_address: existing_user.email_address, password: 'Pa$$w0rdxyzzz'} }

        it 'should fail execution' do
          expect(outcome.success?).to be_falsey
        end

        it 'should pass pre-condition' do
          expect(outcome.pre_condition_failed).to be_truthy
        end
      end

      context 'missing email address' do
        let(:params) { {email_address: nil, password: 'Pa$$w0rd'} }

        it 'should fail execution' do
          expect(outcome.success?).to be_falsey
        end

        it 'should fail pre-condition' do
          expect(outcome.pre_condition_failed).to be_truthy
        end
      end

      context 'missing password' do
        let(:params) { {email_address: existing_user.email_address, password: nil} }

        it 'should fail execution' do
          expect(outcome.success?).to be_falsey
        end

        it 'should pass pre-condition' do
          expect(outcome.pre_condition_failed).to be_truthy
        end
      end
    end
  end
end
