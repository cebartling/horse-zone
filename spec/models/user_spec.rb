# == Schema Information
#
# Table name: users
#
# *id*::                     <tt>integer, not null, primary key</tt>
# *first_name*::             <tt>string</tt>
# *last_name*::              <tt>string</tt>
# *sign_in_count*::          <tt>integer, default(0), not null</tt>
# *current_sign_in_at*::     <tt>datetime</tt>
# *last_sign_in_at*::        <tt>datetime</tt>
# *current_sign_in_ip*::     <tt>string</tt>
# *last_sign_in_ip*::        <tt>string</tt>
# *created_at*::             <tt>datetime, not null</tt>
# *updated_at*::             <tt>datetime, not null</tt>
# *email*::                  <tt>string, not null</tt>
# *encrypted_password*::     <tt>string, default(""), not null</tt>
# *reset_password_token*::   <tt>string</tt>
# *reset_password_sent_at*:: <tt>datetime</tt>
# *remember_created_at*::    <tt>datetime</tt>
# *confirmation_token*::     <tt>string</tt>
# *confirmed_at*::           <tt>datetime</tt>
# *confirmation_sent_at*::   <tt>datetime</tt>
# *unconfirmed_email*::      <tt>string</tt>
# *failed_attempts*::        <tt>integer, default(0), not null</tt>
# *unlock_token*::           <tt>string</tt>
# *locked_at*::              <tt>datetime</tt>
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#--
# == Schema Information End
#++

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create new user' do
    let(:user) do
      described_class.new(email: 'joe.smith001@gmailsnail.co',
                          password: 'p4$$w0rD',
                          password_confirmation: 'p4$$w0rD')
    end

    it 'is successful' do
      expect(user.save).to be_truthy
    end

    # context 'authentication' do
    #   before :each do
    #     user.save!
    #   end
    #
    #   it 'is successful when password matches the password set on the user record' do
    #     expect(user.authenticate('p4$$w0rD')).to be_truthy
    #   end
    #
    #   it 'is unsuccessful when password does not match the password set on the user record' do
    #     expect(user.authenticate('notR1ghtP4$$worD')).to be_falsey
    #   end
    # end
  end
end
