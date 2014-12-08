class AnswersController < ApplicationController
  def create
    Answer.create!(params.merge({
      question_id: params[:question_id],
      user_id: current_user.id
    }))

    redirect_to question_path(params[:question_id])
  end

  def update
    answer = Answer.find(params[:id])
    answer.score = params[:id]
    answer.save!

    redirect_to questions_path
  end

  private

  def params
    super.require(:answer).permit(:id, :question_id, :score)
  end
end
