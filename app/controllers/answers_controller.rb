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
    params.require(:answer).permit(:id, :score).merge({
      question_id: @question.id,
      user_id: current_user.id
    })
  end
end
