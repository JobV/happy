class MailQueryController < ApplicationController
  def settings
  end

  def happiness
    people = current_user.organisation.people

    people.each do |p|
      begin
        QuestionMailer.happiness(p).deliver_later
      rescue Net::SMTPAuthenticationError,
             Net::SMTPServerBusy,
             Net::SMTPSyntaxError,
             Net::SMTPFatalError,
             Net::SMTPUnknownError
        flash[:error] << "Something went wrong with #{p.first_name}"
      end
    end

    Question.create(user: current_user)

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

    respond_to do |f|
      f.js {}
      f.html { redirect_to root_path }
    end
  end
end
