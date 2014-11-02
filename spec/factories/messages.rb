# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  body            :text
#  person_id       :integer
#  user_id         :integer
#  response_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_author     :boolean          default("false")
#  organisation_id :integer
#  raw_body        :text             default("")
#  raw_html        :text             default("")
#  raw_text        :text             default("")
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    body "MyText"
    person_id 1
    user_id 1
    response_id 1
  end
end
