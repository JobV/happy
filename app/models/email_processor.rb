class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    if outstanding_query?
      create_response
    else
      add_to_last_conversation
    end
  end

  def body
    @email.body
  end

  def create_response
    response = Response.create(
      body: body,
      email: from_email,
      grade: grade[0].to_i,
      person: person)
  end

  def from_email
    @email.from[:email]
  end

  def grade
    grade = body.match /\d{1,2}/
  end

  def person
    Person.find_by(email: from_email)
  end

  def outstanding_query?
    person.outstanding_question? if person
  end

  def add_to_last_conversation
    person.responses.last.messages.create(
      body: body,
      person: person
    )
  end
end
