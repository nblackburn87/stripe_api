class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def show
    @organization = Organization.find params[:id]
  end

  def edit
    @organization = Organization.find params[:id]
  end

  def update
    @organization = Organization.find params[:id]
     if @organization.update organization_params
      flash[:notice] = "Organization details updated!"
      redirect_to organization_path(@organization)
    else
      render 'edit'
    end
  end

  def destroy
    @organization = Organization.find params[:id]
    @organization.delete
    redirect_to root_url
  end

  def create
    @organization = Organization.new organization_params
    if @organization.save
      flash[:notice] = "Non profit added to database"
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
