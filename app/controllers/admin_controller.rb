class AdminController < ApplicationController
  def index
  end

  def test_email
    Response.create!(body: 'test email' + Time.now.to_s, email: 'job@awesomeness.com' )
    respond_to do |f|
      f.js {}
      f.html { redirect_to root_path }
    end
  end
end
