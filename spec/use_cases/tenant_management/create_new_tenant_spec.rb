require 'rails_helper'

RSpec.describe TenantManagement::CreateNewTenant do

  describe '#execute' do
    let(:use_case) { TenantManagement::CreateNewTenant.new }

    before :each do
      @outcome = use_case.execute(params)
    end

    context 'happy path' do
      let(:params) {
        {:name => 'Big Barn Horses'}
      }

      it 'should execute successfully' do
        expect(@outcome.success?).to be_truthy
      end

      it 'result should be new tenant' do
        expect(@outcome.result).to be_instance_of Tenant
      end

      it 'new tenant should have name set' do
        expect(@outcome.result.name).to eq params[:name]
      end
    end

    context 'invalid parameters' do
      context 'missing name' do
        let(:params) {
          {}
        }
        let(:expected_messages) {
          {name: ["can't be blank"]}
        }

        it 'should fail execution' do
          expect(@outcome.success?).to be_falsey
        end

        it 'contains message about missing name' do
          expect(@outcome.failure.errors.messages).to eq expected_messages
        end
      end
    end
  end
end
