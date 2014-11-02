# == Schema Information
#
# Table name: responses
#
#  id              :integer          not null, primary key
#  body            :text
#  email           :string
#  created_at      :datetime
#  updated_at      :datetime
#  person_id       :integer
#  grade           :integer          default("0")
#  organisation_id :integer
#  raw_body        :text             default("")
#  raw_html        :text             default("")
#  raw_text        :text             default("")
#

class Response < ActiveRecord::Base
  belongs_to :person
  belongs_to :organisation

  has_many :messages

  def body
    ActionView::Base.full_sanitizer.sanitize(raw_html)
  end
end
