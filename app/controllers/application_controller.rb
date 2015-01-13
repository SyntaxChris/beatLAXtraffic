class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
# Turn on request forgery protection
  protect_from_forgery

  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  before_filter :soft_sign_in

  private

  def soft_sign_in
    @survey_session_id ||= cookies[:survey_session_id] ||= new_survey_session_id
  end

  def new_survey_session_id
    return SecureRandom.hex
  end

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end
end
