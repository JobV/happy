class MailQueryController < ApplicationController

  def happiness
    QuestionMailer.happiness(Person.first).deliver
    respond_to do |f|
      f.js {}
      f.html { redirect_to root_path }
    end
  end
end
