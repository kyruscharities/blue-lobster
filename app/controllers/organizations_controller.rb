class OrganizationsController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :address, :url, :phone)
  end
end