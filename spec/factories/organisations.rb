# == Schema Information
#
# Table name: organisations
#
#  id              :integer          not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  query_frequency :integer          default("0")
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organisation do
    name "MyString"
    after(:create) do |organisation|
      create_list(:user, 1, organisation: organisation)
    end
  end
end
