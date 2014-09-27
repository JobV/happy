class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    Response.create!(body: @email.body, email: @email.from[:email] )
  end
end
