# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    body "MyText"
    person_id 1
    user_id 1
    response_id 1
  end
end
