class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :soft_sign_in

  private

  def soft_sign_in
    @survey_session_id ||= cookies[:survey_session_id] ||= new_survey_session_id
  end

  def new_survey_session_id
    return SecureRandom.hex
  end
end
