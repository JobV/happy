class QuestionMailer < ActionMailer::Base
  default from: "reply@2me.io"

  def happiness(person)
    @person = person
    mail(to: @person.email, subject: 'Happiness')
  end
end
