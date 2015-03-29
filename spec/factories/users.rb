FactoryGirl.define do

  factory :user, class: User do
    sequence(:email) { |n| "joe.smith#{n}@horselover.org" }
    password 'Pa$$w0rd'
  end

end
