class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  check_authorization unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    # log the error
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"

    # render access denied
    @message = exception.message
    respond_to do |format|
      format.html { render 'shared/access_denied' }
      format.json { render :json => {:error => @message} }
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.has_role? :admin
      questions_path
    else
      if current_user.profile_complete
        # they've already completed their profile, see if they've answered questions already
        if current_user.answered_questions?
          # they've already answered questions, so just show them their profile
          profile_path
        else
          # they haven't answered questions yet so have them answer them
          # TODO: Change this answers_path when that is a thing
          #answers_path
          questions_path
        end
      else
        # if they have never saved their profile before, have them do that
        edit_user_path current_user
      end
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
