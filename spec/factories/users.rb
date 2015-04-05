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

FactoryGirl.define do
  factory :user, class: User do
    sequence(:email_address) { |n| "joe.smith#{n}@horselover.org" }
    password 'Pa$$w0rd'
  end
end
