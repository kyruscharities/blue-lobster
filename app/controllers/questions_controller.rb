class QuestionsController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  custom_actions collection: :answer

  def answer
    @unanswered_questions = Question.unanswered_by(current_user)
    @answered_questions = Question.answered_by(current_user)
  end

  def show
    @answer = Answer.for_question_and_user(@question, current_user) ||
        Answer.new(score: 1)
  end

  private

  def question_params
    params.require(:question).permit(:question, skill_ids: [])
  end
end
