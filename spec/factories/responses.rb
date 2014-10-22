# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  body       :text
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  person_id  :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :response do
    body "MyText"
    email "MyString"
    grade 3
    person
  end
end
