# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    first_name "MyString"
    last_name "MyString"
    birthdate "2014-10-12 01:15:32"
    email "MyString"
    phone "MyString"
  end
end
