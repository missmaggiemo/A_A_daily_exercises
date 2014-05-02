
FactoryGirl.define do
  factory :user do
    sequence(:email) { |num| "test_#{num}@test.com"}
    password "testtest"

  end
end

