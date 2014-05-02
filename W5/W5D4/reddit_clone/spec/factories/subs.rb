# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    name { Faker::Lorem.word }
    sequence(:user_id) {|num| num }

  end
end

