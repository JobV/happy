# == Schema Information
#
# Table name: responses
#
#  id              :integer          not null, primary key
#  body            :text
#  email           :string
#  created_at      :datetime
#  updated_at      :datetime
#  person_id       :integer
#  grade           :integer          default("0")
#  organisation_id :integer
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
