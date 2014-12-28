class Instructor < ActiveRecord::Base

  belongs_to :stable
  belongs_to :user

end
