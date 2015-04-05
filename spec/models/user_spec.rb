# == Schema Information
#
# Table name: users
#
# *id*::                 <tt>integer, not null, primary key</tt>
# *email_address*::      <tt>string, default(""), not null</tt>
# *password_digest*::    <tt>string, default(""), not null</tt>
# *first_name*::         <tt>string</tt>
# *last_name*::          <tt>string</tt>
# *sign_in_count*::      <tt>integer, default(0), not null</tt>
# *current_sign_in_at*:: <tt>datetime</tt>
# *last_sign_in_at*::    <tt>datetime</tt>
# *current_sign_in_ip*:: <tt>string</tt>
# *last_sign_in_ip*::    <tt>string</tt>
# *created_at*::         <tt>datetime, not null</tt>
# *updated_at*::         <tt>datetime, not null</tt>
#
# Indexes
#
#  index_users_on_email_address  (email_address) UNIQUE
#--
# == Schema Information End
#++

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create new user' do
    let(:user) do
      described_class.new(email_address: 'joe.smith001@gmailsnail.co',
                          password: 'p4$$w0rD',
                          password_confirmation: 'p4$$w0rD')
    end

    it 'is successful' do
      expect(user.save).to be_truthy
    end

    context 'authentication' do
      before :each do
        user.save!
      end

      it 'is successful when password matches the password set on the user record' do
        expect(user.authenticate('p4$$w0rD')).to be_truthy
      end

      it 'is unsuccessful when password does not match the password set on the user record' do
        expect(user.authenticate('notR1ghtP4$$worD')).to be_falsey
      end
    end
  end
end
