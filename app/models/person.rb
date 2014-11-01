# == Schema Information
#
# Table name: people
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  birthdate       :datetime
#  email           :string
#  phone           :string
#  created_at      :datetime
#  updated_at      :datetime
#  organisation_id :integer
#

class Person < ActiveRecord::Base
  validates :email,
           :first_name,
           :last_name,
           presence: true

  has_many :responses
  has_many :messages
  has_and_belongs_to_many :questions
  belongs_to :organisation

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

  # if the last response from the person is before the last question,
  # there is an outstanding query
  def outstanding_query?
    if Question.any? && responses.any?
      responses.last.created_at < Question.last.created_at
    end
  end
  alias_method :has_outstanding_query?, :outstanding_query?
end
