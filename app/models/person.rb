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

# Person is someone being emailed
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
    responses.last ? responses.last.grade : '-'
  end

  def average_grade
    responses.average(:grade)
  end

  def average_grade_last_3_responses
    responses.order('id desc').limit(3).map(&:grade).sum / 3
  end

  def outstanding_query?
    last_question = organisation.questions.last

    # return false unless the last question was more recent that this person
    return false unless last_question && last_question.created_at > created_at

    # and the last question was more recent than the last response, then YES
    responses.last.created_at < last_question.created_at
  end
  alias_method :has_outstanding_query?, :outstanding_query?
end
