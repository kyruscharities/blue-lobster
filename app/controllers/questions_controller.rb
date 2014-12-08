class QuestionsController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  def index
    @answers = current_user.answers

    @answers_by_question_id = {}
    @answers.map do |a|
      @answers_by_question_id[a.question_id] = a
    end
  end
end
