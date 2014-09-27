class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    # Response.create!(body: @email.body, email: @email.from )
    Response.create!(body: 'test', email: 'test@job.com')
  end
end
