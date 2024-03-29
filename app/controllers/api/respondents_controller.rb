module Api
  class RespondentsController < ApplicationController
    respond_to :json

    def get_or_create
      result = Respondent.get_or_create_by_session(@survey_session_id, @user_identifier)
      @respondent = result[:respondent]
      @seen_nodes = result[:seen_nodes]
    end

    def restart
      get_current_user
      new_respondent = Respondent.get_or_create_by_session(new_random_id, @user.browser_identifier, true)
      cookies[:survey_session_id] = new_respondent[:respondent].session_id
      redirect_to root_path
    end

    def update
      get_current_respondent
      if @respondent.update(session_params)
        render json: @respondent, status: 200
      else
        @respondent.try(:mark_as_corrupted!)
        render json: @respondent.errors, status: 402
      end
    end

    private

    def get_current_respondent
      @respondent = Respondent.find_by_session_id(cookies[:survey_session_id])
    end

    def get_current_user
      @user = UniqueUser.find_by_browser_identifier(cookies[:user_identifier])
    end

    def session_params
      params.permit(
        :time_elapsed,
        :flight_time_remaining,
        :times_circled,
        :first_path_chosen
      )
    end

  end
end
