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

require 'rails_helper'

RSpec.describe Person, :type => :model do
  let(:person) { create(:person) }
  before { 6.times { |n| create(:response, person: person, grade: 1+n) } }

  describe '#average_grade' do
    it 'returns the average grade' do
      expect(person.average_grade).to eq 3.5
    end
  end

  describe '#average_grade_last_3_responses' do
    it 'returns the average of the last 3 responses' do
      expect(person.responses.last.grade).to eq 6
      expect(person.average_grade_last_3_responses).to eq 5
    end
  end
end
