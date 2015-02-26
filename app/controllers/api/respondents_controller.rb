module Api
  class RespondentsController < ApplicationController
    respond_to :json

    def get_or_create
      result = Respondent.get_or_create_by_session(@survey_session_id)
      @respondent = result[:respondent]
      @seen_nodes = result[:seen_nodes]
      # render json: @respondent_result, status: 200
    end

    def update
      @respondent = Respondent.find_by_session_id(cookies[:survey_session_id])
      if @respondent.update(session_params)
        render json: @respondent, status: 200
      else
        render json: @respondent.errors, status: 402
      end
    end

    private
    def session_params
      params.permit(:time_elapsed, :flight_time_remaining, :times_circled)
    end

  end
end
