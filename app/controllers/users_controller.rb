class UsersController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  before_filter :authenticate_user!
  before_filter :check_current_user, only: [:show, :edit, :recommendations, :delete, :update]
  after_filter :set_profile_complete, only: :update

  def profile
    @user = current_user
    @unanswered_questions = Question.unanswered_by(current_user)
    @answered_questions = Question.answered_by(current_user)
    render 'show'
  end

  def profile_card
    @user = current_user
    @unanswered_questions = Question.unanswered_by(current_user)
    @answered_questions = Question.answered_by(current_user)
    render '_profile_card', layout: false
  end

  def update
    update! do |success, failure|
      success.html do
        @user.update! profile_complete: true

        if @user.answered_questions?
          redirect_to profile_path
        else
          # TODO: Change this to answers_path when it's a thing
          redirect_to questions_path
        end
      end
    end
  end

  private

  # TODO: I DONT THINK THIS IS NEEDED WITH THE ABILITY CHECK
  def check_current_user
    unless @user == current_user or current_user.has_role?(:admin) # Only allow access to this page for the current user.
      redirect_to :back, :alert => "Access denied."
    end
  end

  def user_params
    params.require(:user).permit(:name, :city, :state, :zip, :age_range, :status, :gender, :support_goals_freeform,
                                 :certifications, :military_job_codes, services: [], support_goals: [])
  end

  def set_profile_complete

  end
end
