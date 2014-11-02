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

require 'rails_helper'

RSpec.describe Response, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
