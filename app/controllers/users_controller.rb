class UsersController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  before_filter :authenticate_user!
  before_filter :check_current_user, only: [:show, :edit, :recommendations, :delete, :update]

  def profile
    @user = current_user
    render 'show'
  end

  private

  # TODO: I DONT THINK THIS IS NEEDED WITH THE ABILITY CHECK
  def check_current_user
    unless @user == current_user or current_user.has_role?(:admin)  # Only allow access to this page for the current user.
      redirect_to :back, :alert => "Access denied."
    end
  end

  def user_params
    params.require(:user).permit(:name, :city, :state, :zip, :age_range, :status, :support_goals_freeform, services: [],
                                 support_goals: [])
  end
end
