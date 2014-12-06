FactoryGirl.define do

  factory :user, class: User do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'paSSw0rd'
  end

end
