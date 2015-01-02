# == Schema Information
#
# Table name: stables
#
# *id*::         <tt>true, primary key</tt>
# *name*::       <tt>true</tt>
# *active*::     <tt>true, default(TRUE)</tt>
# *created_at*:: <tt>true</tt>
# *updated_at*:: <tt>true</tt>
#
# Indexes
#
#  index_stables_on_name  (name) UNIQUE
#--
# == Schema Information End
#++

require 'rails_helper'

RSpec.describe Stable, :type => :model do


end
