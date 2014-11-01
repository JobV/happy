class MessagesController < ApplicationController
  def create
    @message = Message.new(response_params)
    @message.person = @message.response.person
    @message.user = current_user

    respond_to do |format|
      if @message.save
        format.js {}
      else
        format.js {}
      end
    end
  end

  private

  def response_params
    params.require(:message).permit(:body, :response_id, :user_author)
  end
end
