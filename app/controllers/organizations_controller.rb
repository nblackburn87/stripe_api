class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new organization_params
    if @organization.save
      flash[:notice] = "Non Profit added to database."
      redirect_to organizations_path
    else
      render 'new'
    end
  end

private
  def organization_params
    params.require(:organization).permit(:name, :description)
  end
end
