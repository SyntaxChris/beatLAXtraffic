module Api
  class RespondentsController < ApplicationController
    respond_to :json

    def get_or_create
      @respondent = Respondent.get_or_create_by_session(@survey_session_id)
      # render json: @respondent_result, status: 200
    end

    def update
      @respondent = Respondent.find_by_session_id(cookies[:survey_session_id])
      if @respondent.update(session_params)
        render json: {}, status: 200
      else
        render json: @resopndent.errors, status: 402
      end
    end

    private
    def session_params
      params.permit(:time_elapsed, :flight_time_remaining, :times_circled)
    end

  end
end
