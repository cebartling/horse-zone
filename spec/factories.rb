FactoryGirl.define do

  factory :stable, class: Stable do
    sequence(:name) {|n| "Happy Trails ##{n} Stables" }
  end


  factory :user, class: User do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'paSSw0rd'
  end

end
