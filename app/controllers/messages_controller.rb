class MessagesController < ApplicationController
  def create
    @message = Message.new(response_params)
    @message.person = @message.response.person
    @message.user = current_user

    @message.save
    email_person(@message) if @message.user_author
    redirect_to @message.person
  end

  private

  def response_params
    params.require(:message).permit(:body, :response_id, :user_author)
  end

  def email_person(message)
    begin
      QuestionMailer.reply(message).deliver_later
    rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError,
      Net::SMTPFatalError, Net::SMTPUnknownError => e
      flash[:error] << "Something went wrong with #{p.first_name}"
    end
  end
end
