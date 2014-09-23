class EmailProcessor
  def self.process(email)
    Response.create!({ body: email.body, email: email.from })
  end
end
