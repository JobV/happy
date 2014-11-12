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

class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :organisation
  has_and_belongs_to_many :people
end
