class SkillsController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  private

  def skill_params
    params.require(:skill).permit(:name)
  end
end