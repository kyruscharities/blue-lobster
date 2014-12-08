class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!

  def show
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def recommendations
    unless @user == current_user  # Only allow access to this page for the current user.
      redirect_to :back, :alert => "Access denied."
    end
  end
end
