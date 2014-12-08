class SkillValuesController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  private

  def skill_value_params
    params.require(:skill_value).permit(:weight, :skill_id, :question_id)
  end
end
