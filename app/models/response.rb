# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  body       :text
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#  person_id  :integer
#  grade      :integer          default("0")
#

class Response < ActiveRecord::Base
  belongs_to :person
  belongs_to :organisation

  has_many :messages
end
