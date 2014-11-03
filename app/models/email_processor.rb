# Processes _all_ incoming email
#
class EmailProcessor
  def initialize(email)
    @email = email
    @from = @email.from[:email]
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

  def raw_body
    @email.raw_body ? @email.raw_body : ''
  end

  def raw_text
    @email.raw_text ? @email.raw_text : ''
  end

  def raw_html
    @email.raw_html ? @email.raw_html : ''
  end

  def create_response
    Response.create(
      body: body,
      raw_text: raw_text,
      raw_body: raw_body,
      raw_html: raw_html,
      email: @from,
      grade: grade[0].to_i,
      person: @person)
  end

  def grade
    body.match(/\d{1,2}/)
  end

  def person
    person = Person.find_by(email: @from)
    if person
      return person
    else
      # Do not warn in tests, to keep clean
      warn "Can't find person by #{@from}" unless Rails.env == 'test'
    end
  end

  def outstanding_query?
    @person.outstanding_query?
  end

  def add_to_last_conversation
    @person.responses.last.messages.create(
      body: body,
      person_id: @person.id,
      raw_text: raw_text,
      raw_body: raw_body,
      raw_html: raw_html
    )
  end
end
