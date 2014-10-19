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

class Response < ActiveRecord::Base
  belongs_to :person
end
