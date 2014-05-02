# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do

    body {Faker::Lorem.paragraph(sentence_count = 2)}
    user_id { User.all.ids.sample }
    link_id { Link.all.ids.sample }
    parent_comment_id { ([nil]+(0..10).to_a).sample }

  end
end
