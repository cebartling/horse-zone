require 'rails_helper'

RSpec.describe UserManagement::UserAuthenticatesSuccessfullyPrecondition do

  describe '#satisfied?' do
    let(:pre_condition) { UserManagement::UserAuthenticatesSuccessfullyPrecondition.new }
    let(:existing_user) { FactoryGirl.create(:user) }
    let(:outcome) {pre_condition.satisfied?(input)}

    context 'pre-existing user email address parameter' do
      let(:input) do
        UserManagement::SignInUserInput.new({email_address: existing_user.email,
                                             password: 'Pa$$w0rd'})
      end

      it 'causes pre-condition to pass' do
        expect(outcome).to be_truthy
      end
    end

    context 'non-existent user email address parameter' do
      let(:input) do
        UserManagement::SignInUserInput.new({email_address: existing_user.email,
                                             password: 'Pa$$w0rdxdfjsldh'})
      end

      it 'causes pre-condition fails' do
        expect(outcome).to be_falsey
      end
    end
  end

  describe 'self.symbol' do
    it "should be equal to :user_authenticates_successfully" do
      expect(UserManagement::UserAuthenticatesSuccessfullyPrecondition.symbol).to eq :user_authenticates_successfully
    end
  end
end