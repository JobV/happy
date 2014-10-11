class ResponsesController < ApplicationController
  # before_action :authenticate_user! 

  def index
    @responses = Response.all
  end
end
