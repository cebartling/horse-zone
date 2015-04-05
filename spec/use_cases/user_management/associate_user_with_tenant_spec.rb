require 'rails_helper'

RSpec.describe UserManagement::AssociateUserWithTenant do

  describe '#execute' do
    let(:use_case) { UserManagement::AssociateUserWithTenant.new }
    let(:existing_user) { FactoryGirl.create(:user) }
    let(:existing_tenant) { FactoryGirl.create(:tenant) }
    let(:outcome) {use_case.execute(params)}

    context 'happy path' do
      let(:params) {
        {id: existing_user.id, tenant_id: existing_tenant.id}
      }

      it 'should execute successfully' do
        expect(outcome.success?).to be_truthy
      end
    end

    context 'invalid parameters' do
      context 'missing user id' do
        let(:params) {
          {tenant_id: existing_tenant.id}
        }

        it 'should fail execution' do
          expect(outcome.success?).to be_falsey
        end

        it 'pre-condition failed' do
          expect(outcome.pre_condition_failed).to be_truthy
        end
      end

      context 'missing tenant id' do
        let(:params) {
          {id: existing_user.id}
        }

        it 'should fail execution' do
          expect(outcome.success?).to be_falsey
        end

        it 'pre-condition failed' do
          expect(outcome.pre_condition_failed).to be_truthy
        end
      end
    end
  end
end
