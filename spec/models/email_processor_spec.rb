require 'rails_helper'

RSpec.describe EmailProcessor, :type => :model do

  context 'User emails after happiness query' do
    before do
      create(:question)
      create(:person, email: 'user@email.com')
      email = build(:email, body: "9 this is an email")
      @processor = EmailProcessor.new(email)
    end

    it 'recognizes that there is an outstanding query' do
      expect(@processor.outstanding_query?).to eq true
    end

    it 'creates a new Response on reception of the email' do
      expect{ @processor.process }.to change{ Response.count }.by(1)
    end

    it 'the parser parses the number from the body of the email' do
      @processor.process
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
