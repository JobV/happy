require 'rails_helper'

RSpec.describe EmailProcessor, :type => :model do

  context 'user emails after happiness query' do
    before do
      create(:question)
    end

    it 'parses the number from the body of the email' do
      email = build(:email, body: "9 this is an email", from: Person.first.email )
      processor = EmailProcessor.new(email)
      processor.process
      expect(Response.last.grade).to eq 9
    end
  end

  context 'unknown users emails' do
    let(:email) { build(:email) }
    it 'does nothing' do
      processor = EmailProcessor.new(email)
      expect { processor.process }.to_not raise_error
    end
  end
end
