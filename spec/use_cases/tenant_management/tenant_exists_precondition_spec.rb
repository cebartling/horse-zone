require 'rails_helper'

RSpec.describe TenantManagement::TenantExistsPrecondition do

  class TestInput
    include Virtus.model

    attribute :id, Integer
  end


  describe '#satisfied?' do
    let(:pre_condition) { TenantManagement::TenantExistsPrecondition.new }
    let(:existing_tenant) { FactoryGirl.create(:tenant) }

    before :each do
      @outcome = pre_condition.satisfied?(input)
    end

    context 'pre-existing tenant id parameter' do
      let(:input) { TestInput.new({id: existing_tenant.id.to_s}) }

      it 'causes pre-condition to pass' do
        expect(@outcome).to be_truthy
      end
    end

    context 'non-existent tenant id parameter' do
      let(:input) { TestInput.new({id: 231276.to_s}) }

      it 'causes pre-condition fails' do
        expect(@outcome).to be_falsey
      end
    end
  end
end
