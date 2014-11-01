# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  birthdate  :datetime
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Person < ActiveRecord::Base
  validates :email,
           :first_name,
           :last_name,
           presence: true

  has_many :responses
  has_many :messages

  def full_name
    "#{first_name} #{last_name}"
  end

  def last_response_grade
    responses.last ? responses.last.grade : 'x'
  end

  def average_grade
    responses.average(:grade)
  end

  def average_grade_last_3_responses
    responses.order('id desc').limit(3).map { |c| c.grade }.sum / 3
  end
end
