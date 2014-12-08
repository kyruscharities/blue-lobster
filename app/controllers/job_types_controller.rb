class JobTypesController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  private

  def job_type_params
    params.require(:job_type).permit(:name, :description, skill_ids: [])
  end
end
