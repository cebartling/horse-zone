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

class Tenant < ActiveRecord::Base
  has_and_belongs_to_many :users
end
