class MessagesController < ApplicationController
  def create
    @message = Message.new(response_params)

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
    params.require(:message).permit(:body, :person_id, :user_id, :response_id)
  end
end
