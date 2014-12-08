class AnswersController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  belongs_to :question

  def new
    @answer.user = current_user
    new!
  end

  private

  def answer_params
    params.require(:answer).permit(:id, :question_id, :user_id, :score)
  end
end
