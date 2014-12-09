class MilitaryJobCodesController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  private

  def military_job_code_params
    params.require(:military_job_code).permit(:service, :mpc, :status, :code, :title, :onetcode, :onettitle, skill_ids: [])
  end
end

