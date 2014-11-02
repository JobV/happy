class QuestionMailer < ActionMailer::Base
  default from: "reply@2me.io"

  def happiness(person)
    @person = person
    mail(to: @person.email, subject: '[2me.io] Happiness')
  end

  def reply(message)
    mail(to: message.person.email,
         subject: '[2me.io] Reply to your message',
         body: message.body)
  end
end
