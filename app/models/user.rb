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
# *created_at*::         <tt>datetime</tt>
# *updated_at*::         <tt>datetime</tt>
#
# Indexes
#
#  index_users_on_email_address  (email_address) UNIQUE
#--
# == Schema Information End
#++

class User < ActiveRecord::Base
  has_secure_password

  def generate_auth_token
    payload = { user_id: self.id }
    AuthToken.encode(payload)
  end
end
