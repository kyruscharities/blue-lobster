class AnswersController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  #def update
    #answer = Answer.find(answer_params[:id])
    #answer.score = answer_params[:score]
    #answer.save!

    #redirect_to questions_path
  #end

  private

  def answer_params
    params.require(:answer).permit(:id, :question_id, :user_id, :score)
    #parms[:score] = parms[:score].to_i
    #parms
  end
end
