class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :member_of_organisation
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def member_of_organisation
    if current_user
      unless current_user.organisation || controller_name == 'OrganisationController'
        redirect_to new_organisation_path
      end
    end
  end
end
