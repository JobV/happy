# == Schema Information
#
# Table name: organisations
#
#  id                 :integer          not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  query_frequency    :integer          default("0")
#  subscription_until :datetime
#

class Organisation < ActiveRecord::Base
  has_many :users
  has_many :people
  has_many :responses
  has_many :messages
  has_many :questions

  enum query_frequency: [:weekly, :every_two_weeks, :monthly]

  def subscribed?
    true
  end

  def send_out_query
    return false unless subscribed?

    people.each do |p|
      email_person(p)
    end

    questions.create(user: users.first)
  end

  def should_query?
    # yes if there are no questions
    return true unless last_question_created_at

    # if the last_question is further in time (smaller), return true
    last_question_created_at < query_frequency_time_ago
  end

  private

  def last_question_created_at
    questions.last.created_at if questions.any?
  end

  def query_frequency_time_ago
    case query_frequency
    when 'weekly'            then 1.week.ago
    when 'every_two_weeks'   then 2.weeks.ago
    when 'monthly'           then 1.month.ago
    else
      fail "Invalid Query Frequency: #{query_frequency}"
    end
  end

  def email_person(p)
    QuestionMailer.happiness(p).deliver_later
    rescue Net::SMTPAuthenticationError,
           Net::SMTPServerBusy,
           Net::SMTPSyntaxError,
           Net::SMTPFatalError,
           Net::SMTPUnknownError
      flash[:error] << "Something went wrong with #{p.first_name}"
  end
end
