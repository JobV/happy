class DashboardController < ApplicationController
  def index
    @people = Person.where(organisation: current_user.organisation)
  end

  def subscription
    @org = current_user.organisation
  end
end
