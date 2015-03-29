FactoryGirl.define do

  factory :user, class: User do
    sequence(:email_address) { |n| "joe.smith#{n}@horselover.org" }
    password 'Pa$$w0rd'
  end

end
