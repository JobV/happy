class EmailProcessor
  def initialize(email)
    @email = email
    @person = person
  end

  def process
    if @person && outstanding_query?
      create_response
    elsif @person
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
      person: @person)
  end

  def from_email
    @email.from
  end

  def grade
    grade = body.match /\d{1,2}/
  end

  def person
    Person.find_by(email: from_email)
  end

  def outstanding_query?
    @person.outstanding_query?
  end

  def add_to_last_conversation
    @person.responses.last.messages.create(
      body: body,
      person_id: @person.id
    )
  end
end
