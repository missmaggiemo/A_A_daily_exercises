# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title { Faker::Internet.domain_name }
    url { Faker::Internet.url }
    user_id { User.all.ids.sample }
  end
end
