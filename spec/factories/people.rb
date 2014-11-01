# == Schema Information
#
# Table name: people
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  birthdate       :datetime
#  email           :string
#  phone           :string
#  created_at      :datetime
#  updated_at      :datetime
#  organisation_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    first_name "MyString"
    last_name "MyString"
    birthdate "2014-10-12 01:15:32"
    email "pete@example.com"
    phone "MyString"
  end
end
