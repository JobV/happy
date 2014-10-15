class AdminController < ApplicationController
  def index
  end

  def test_email
    Response.create!(body: "this is the body of the email", email: 'job@awesomeness.com' )
    respond_to do |f|
      f.js {}
      f.html { redirect_to root_path }
    end
  end
end
