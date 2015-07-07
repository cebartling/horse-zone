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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :lockable,
         :timeoutable

  has_and_belongs_to_many :tenants

  def generate_auth_token
    payload = {user_id: id}
    AuthToken.encode(payload)
  end
end
