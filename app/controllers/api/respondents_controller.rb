module Api
  class RespondentsController < ApplicationController
    respond_to :json

    def get_or_create
      @respondent_result = Respondent.get_or_create_by_session(@survey_session_id)
      render json: @respondent_result, status: 200
    end

  end
end
