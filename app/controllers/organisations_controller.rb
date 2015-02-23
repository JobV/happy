class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin!, except: [:new, :create, :edit, :update]
  skip_before_action :member_of_organisation
  respond_to :html

  def index
    @organisations = Organisation.all
    respond_with(@organisations)
  end

  def show
    respond_with(@organisation)
  end

  def new
    redirect_to root_path if current_user.organisation
    @organisation = Organisation.new
    respond_with(@organisation)
  end

  def edit
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.users << current_user
    @organisation.save
    respond_with(@organisation)
  end

  def update
    @organisation.update(organisation_params)
    respond_with(@organisation)
  end

  def destroy
    @organisation.destroy
    respond_with(@organisation)
  end

  private
    def set_organisation
      @organisation = Organisation.find(params[:id])
    end

    def organisation_params
      params.require(:organisation).permit(:name, :query_frequency)
    end

    def ensure_admin!
      unless current_user.admin
        redirect_to root_path
      end
    end
end
