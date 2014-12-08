class QuestionsController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  custom_actions resource: [:answer]

  def index
    @answers = current_user.answers

    @answers_by_question_id = @answers.reduce({}) do |h, a|
      h[a.question_id] = a
      h
    end
  end

  def show
    @answer = Answer.for_question_and_user(@question, current_user) || Answer.new
  end
end
