# == Schema Information
#
# Table name: questions
#
#  id              :integer          not null, primary key
#  title           :string
#  body            :text
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organisation_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "MyString"
    body "MyText"
    user
    organisation
  end
end
