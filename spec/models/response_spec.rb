# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  body       :text
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  person_id  :integer
#

require 'rails_helper'

RSpec.describe Response, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
