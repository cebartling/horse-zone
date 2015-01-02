# == Schema Information
#
# Table name: instructors
#
# *id*::         <tt>true, primary key</tt>
# *stable_id*::  <tt>true</tt>
# *user_id*::    <tt>true</tt>
# *active*::     <tt>true, default(TRUE)</tt>
# *created_at*:: <tt>true</tt>
# *updated_at*:: <tt>true</tt>
#
# Indexes
#
#  index_instructors_on_stable_id  (stable_id)
#  index_instructors_on_user_id    (user_id)
#--
# == Schema Information End
#++

class Instructor < ActiveRecord::Base

  belongs_to :stable
  belongs_to :user

end
