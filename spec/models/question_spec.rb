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

require 'rails_helper'

RSpec.describe Question, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
