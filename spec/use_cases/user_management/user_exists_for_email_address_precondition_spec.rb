require 'rails_helper'

RSpec.describe UserManagement::UserExistsForEmailAddressPrecondition do

  describe '#satisfied?' do
    let(:pre_condition) { UserManagement::UserExistsForEmailAddressPrecondition.new }
    let(:existing_user) { FactoryGirl.create(:user) }

    before :each do
      @outcome = pre_condition.satisfied?(input)
    end

    context 'pre-existing user email address parameter' do
      let(:input) { UserManagement::SignInUserInput.new({email_address: existing_user.email_address}) }

      it 'causes pre-condition to pass' do
        expect(@outcome).to be_truthy
      end
    end

    context 'non-existent user email address parameter' do
      let(:input) { UserManagement::SignInUserInput.new({email_address: 'janie.wrong@gmail.com'}) }

      it 'causes pre-condition fails' do
        expect(@outcome).to be_falsey
      end
    end
  end

  describe 'self.symbol' do
    it "should be equal to :" do
      expect(UserManagement::UserExistsForEmailAddressPrecondition.symbol).to eq :user_exists_for_email_address
    end
  end
end
