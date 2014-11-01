# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  body        :text
#  person_id   :integer
#  user_id     :integer
#  response_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Message < ActiveRecord::Base
  belongs_to :person
  belongs_to :user
  belongs_to :response
end
