class UsersController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  before_filter :authenticate_user!
  before_filter :check_current_user, only: [:show, :edit, :recommendations, :delete, :update]

  private

  def check_current_user
    unless @user == current_user or current_user.has_role?(:admin)  # Only allow access to this page for the current user.
      redirect_to :back, :alert => "Access denied."
    end
  end
end
