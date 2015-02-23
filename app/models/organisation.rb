# == Schema Information
#
# Table name: organisations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organisation < ActiveRecord::Base
  has_many :users
  has_many :people
  has_many :responses
  has_many :messages
  has_many :questions

  enum query_frequency: [:weekly, :two_weekly, :monthly]
end
