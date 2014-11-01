class Message < ActiveRecord::Base
  belongs_to :person
  belongs_to :user
  belongs_to :response
end
