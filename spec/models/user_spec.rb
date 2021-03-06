# == Schema Information
#
# Table name: users
#
# *id*::            <tt>integer, not null, primary key</tt>
# *first_name*::    <tt>string(30), not null</tt>
# *last_name*::     <tt>string(40), not null</tt>
# *email_address*:: <tt>string(200), not null</tt>
# *created_at*::    <tt>datetime, not null</tt>
# *updated_at*::    <tt>datetime, not null</tt>
#--
# == Schema Information End
#++

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
