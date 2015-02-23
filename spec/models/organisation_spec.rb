# == Schema Information
#
# Table name: organisations
#
#  id              :integer          not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  query_frequency :integer          default("0")
#

require 'rails_helper'

RSpec.describe Organisation, :type => :model do
  let(:org) { create(:organisation) }
  describe '#send_out_query' do
    it 'creates a new question' do
      expect(org.send_out_query).to change {
        Question.count
      }.by 1
    end
  end

  describe '#should_query?' do
    it 'returns true if no questions' do
      expect(org.should_query?).to eq true
    end

    it 'returns false if recent question' do
      create(:question, organisation: org)
      expect(org.questions.count).to eq 1
      expect(org.should_query?).to eq false
    end

    it 'returns true if recent question is too old' do
      travel_to(2.weeks.ago) { create(:question, organisation: org) }
      expect(org.should_query?).to eq true
    end

    it 'returns true if recent question is old with weekly query setting' do
      org = create(:organisation, query_frequency: 0)
      travel_to(8.days.ago) { create(:question, organisation: org) }
      expect(org.should_query?).to eq true
    end

    it 'returns false if question is 1w old with two_weekly query setting' do
      org = create(:organisation, query_frequency: 'every_two_weeks')
      travel_to(8.days.ago) { create(:question, organisation: org) }
      expect(org.should_query?).to eq false
    end
  end
end
