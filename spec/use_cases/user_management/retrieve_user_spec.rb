require 'rails_helper'

RSpec.describe UserManagement::RetrieveUser do

  describe '#execute' do
    let(:use_case) { UserManagement::RetrieveUser.new }
    let(:existing_user) { FactoryGirl.create(:user) }

    before :each do
      @outcome = use_case.execute(params)
    end

    context 'happy path' do
      let(:params) {
        {
          :id => existing_user.id
        }
      }

      it 'should execute successfully' do
        expect(@outcome.success?).to be_truthy
      end
    end

    context 'invalid parameters' do
      context 'missing id' do
        let(:params) {
          {}
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
