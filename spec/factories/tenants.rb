# == Schema Information
#
# Table name: tenants
#
# *id*::         <tt>integer, not null, primary key</tt>
# *name*::       <tt>string, not null</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
#
# Indexes
#
#  index_tenants_on_name  (name) UNIQUE
#--
# == Schema Information End
#++

FactoryGirl.define do
  factory :tenant do
    
  end

end
