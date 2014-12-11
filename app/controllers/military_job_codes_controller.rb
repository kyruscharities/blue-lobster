class MilitaryJobCodesController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  protected
  def collection
    set_collection_ivar(end_of_association_chain.paginate(:page => params[:page], per_page: 250))
  end

  private

  def military_job_code_params
    params.require(:military_job_code).permit(:service, :mpc, :status, :code, :title, :onetcode, :onettitle, skill_ids: [])
  end
end

