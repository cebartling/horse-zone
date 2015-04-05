require 'rails_helper'

RSpec.describe TenantManagement::UpdateExistingTenant do

  describe '#execute' do
    let(:use_case) { TenantManagement::UpdateExistingTenant.new }
    let(:existing_tenant) { FactoryGirl.create(:tenant) }

    before :each do
      @outcome = use_case.execute(params)
    end

    context 'happy path' do
      let(:params) {
        {
          :name => 'Hidden Meadow Horse Farm',
          :id => existing_tenant.id
        }
      }

      it 'should execute successfully' do
        expect(@outcome.success?).to be_truthy
      end

      it 'result should be the existing tenant' do
        expect(@outcome.result).to be_instance_of Tenant
        expect(@outcome.result.id).to eq existing_tenant.id
      end

      it 'should have name set on the existing tenant' do
        expect(@outcome.result.name).to eq params[:name]
      end
    end

    context 'invalid parameters' do
      context 'missing id' do
        let(:params) {
          {
            :name => 'Hidden Meadow Horse Farm'
          }
        }
        let(:expected_message) { "Tenant identifier '' does not point to a valid tenant record in the database." }

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
