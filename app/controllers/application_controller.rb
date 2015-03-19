class ApplicationController < ActionController::Base
  require 'csv'
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
    # if user has a survey cookie already, use it (continuing)
    # otherwise, give them a new random one
    @survey_session_id ||= cookies[:survey_session_id] ||= new_random_id
    # similarly, give them a unique identifier if they don't have one.
    # this wont change with every game session
    @user_identifier ||= cookies[:user_identifier] ||= new_random_id
  end

  def new_random_id
    return SecureRandom.hex
  end

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end
end
