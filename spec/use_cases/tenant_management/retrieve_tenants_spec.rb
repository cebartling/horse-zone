require 'rails_helper'

RSpec.describe TenantManagement::RetrieveTenants do

  describe '#execute' do
    let(:use_case) { TenantManagement::RetrieveTenants.new }
    let!(:tenants) { FactoryGirl.create_list(:tenant, 25) }
    let(:params) { {} }

    before :each do
      @outcome = use_case.execute(params)
    end

    context 'happy path' do
      it 'should execute successfully' do
        expect(@outcome.success?).to be_truthy
      end

      it 'should be all of the tenants' do
        expect(@outcome.result).to eq tenants
      end
    end
  end
end
