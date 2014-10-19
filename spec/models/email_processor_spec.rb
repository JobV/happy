require 'rails_helper'

RSpec.describe EmailProcessor, :type => :model do
  it 'parses the number from the body of the email' do
    email = build(:email, body: "9 this is an email" )
    processor = EmailProcessor.new(email)
    processor.process
    expect(Response.last.grade).to eq 9
  end
end
