# == Schema Information
#
# Table name: users
#
# *id*::                     <tt>true, primary key</tt>
# *email*::                  <tt>true, default("")</tt>
# *reset_password_token*::   <tt>true</tt>
# *reset_password_sent_at*:: <tt>true</tt>
# *remember_created_at*::    <tt>true</tt>
# *sign_in_count*::          <tt>true, default("0")</tt>
# *current_sign_in_at*::     <tt>true</tt>
# *last_sign_in_at*::        <tt>true</tt>
# *current_sign_in_ip*::     <tt>true</tt>
# *last_sign_in_ip*::        <tt>true</tt>
# *created_at*::             <tt>true</tt>
# *updated_at*::             <tt>true</tt>
# *password_digest*::        <tt>true</tt>
# *first_name*::             <tt>true</tt>
# *last_name*::              <tt>true</tt>
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#--
# == Schema Information End
#++

class User < ActiveRecord::Base
  has_secure_password
end
