class QuestionsController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  def index
    @answers = current_user.answers

    @answers_by_question_id = @answers.reduce({}) do |h, a|
      h[a.question_id] = a
      h
    end
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
