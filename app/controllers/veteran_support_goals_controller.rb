class VeteranSupportGoalsController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  private

  def veteran_support_goal_params
    params.require(:veteran_support_goal).permit(:description)
  end
end

