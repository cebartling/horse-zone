require 'rails_helper'

RSpec.describe UserManagement::RetrieveUsers do

  describe '#execute' do
    let(:use_case) { UserManagement::RetrieveUsers.new }
    let!(:users) { FactoryGirl.create_list(:user, 25) }
    let(:params) { {} }

    before :each do
      @outcome = use_case.execute(params)
    end

    context 'happy path' do
      it 'should execute successfully' do
        expect(@outcome.success?).to be_truthy
      end

      it 'should be all of the users' do
        expect(@outcome.result).to eq users
      end
    end
  end
end
