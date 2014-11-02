class EmailProcessor
  def initialize(email)
    @email = email
    @person = person
  end

  # This gets hit with every received email.
  # Raise was not used with unknown emails, as this is expected to happen.
  # Raise is a little heavy. Warn is a better option.
  def process
    if @person && outstanding_query?
      create_response
    elsif @person && @person.responses.any?
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
    if person = Person.find_by(email: from_email)
      return person
    else
      warn "Can't find person by #{from_email}"
    end
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
