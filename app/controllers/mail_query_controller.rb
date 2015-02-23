class MailQueryController < ApplicationController
  def settings
  end

  def happiness
    people.each do |p|
      email_person(p)
    end
    Question.create(user: current_user,
                    organisation: current_user.organisation)

    # if dev, immediately everyone respond
    dev_behavior

    respond_to do |f|
      f.js {}
      f.html { redirect_to root_path }
    end
  end

  private

  def people
    current_user.organisation.people
  end

  def dev_behavior
    if Rails.env == 'development'
      people.each do |p|
        Response.create(
          body: "it's alright",
          raw_html: "it's alright",
          email: p.email,
          grade: Random.rand(10),
          person: p)
      end
    end
  end

  def email_person(p)
    QuestionMailer.happiness(p).deliver_later
    rescue Net::SMTPAuthenticationError,
           Net::SMTPServerBusy,
           Net::SMTPSyntaxError,
           Net::SMTPFatalError,
           Net::SMTPUnknownError
      flash[:error] << "Something went wrong with #{p.first_name}"
  end
end
