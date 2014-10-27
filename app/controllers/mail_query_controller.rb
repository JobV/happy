class MailQueryController < ApplicationController

  def happiness
    Person.all.each do |p|
      begin
        QuestionMailer.happiness(p).deliver_later
      rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
        flash[:error] << "Something went wrong with #{p.first_name}"
      end
    end
    respond_to do |f|
      f.js {}
      f.html { redirect_to root_path }
    end
  end
end
