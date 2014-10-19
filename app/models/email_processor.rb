class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    grade       = body.match /\d{1,2}/
    response = Response.create(
      body: body,
      email: from_email,
      grade: grade[0].to_i)
  end

  def body
    @email.body
  end

  def from_email
    @email.from[:email]
  end
end
