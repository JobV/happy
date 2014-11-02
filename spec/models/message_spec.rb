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

require 'rails_helper'

RSpec.describe Message, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
