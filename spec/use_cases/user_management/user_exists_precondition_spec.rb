require 'rails_helper'

RSpec.describe UserManagement::CreateNewUser do

  class TestInput
    include Virtus.model

    attribute :id, Integer
  end


  describe '#satisfied?' do
    let(:pre_condition) { UserManagement::UserExistsPrecondition.new }
    let(:existing_user) { FactoryGirl.create(:user) }

    before :each do
      @outcome = pre_condition.satisfied?(input)
    end

    context 'pre-existing user id parameter' do
      let(:input) { TestInput.new({id: existing_user.id.to_s}) }

      it 'causes pre-condition to pass' do
        expect(@outcome).to be_truthy
      end
    end

    context 'non-existent user id parameter' do
      let(:input) { TestInput.new({id: 231276.to_s}) }

      it 'causes pre-condition fails' do
        expect(@outcome).to be_falsey
      end
    end
  end
end
