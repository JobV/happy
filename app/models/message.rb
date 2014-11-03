# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  body            :text
#  person_id       :integer
#  user_id         :integer
#  response_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_author     :boolean          default("false")
#  organisation_id :integer
#  raw_body        :text             default("")
#  raw_html        :text             default("")
#  raw_text        :text             default("")
#

# Message is a followup to a response
class Message < ActiveRecord::Base
  belongs_to :person
  belongs_to :user
  belongs_to :response
  belongs_to :organisation

  def body
    if !user_author || !raw_html.empty?
      ActionView::Base.full_sanitizer.sanitize(raw_html)
    else
      attribute('body')
    end
  end
end
