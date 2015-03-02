module Api
  class RespondentsController < ApplicationController
    respond_to :json

    def get_or_create
      @respondent = Respondent.get_or_create_by_session(@survey_session_id)
      # render json: @respondent_result, status: 200
    end

    def restart
      new_respondent = Respondent.get_or_create_by_session(new_survey_session_id)
      new_respondent.update(current_node_id: Node.find_by_template_name('sq-2-2').id)

      cookies[:survey_session_id] = new_respondent.session_id
      redirect_to root_path
    end

    def update
      get_current_respondent
      if @respondent.update(session_params)
        render json: {}, status: 200
      else
        render json: @respondent.errors, status: 402
      end
    end

    private

    def get_current_respondent
      @respondent = Respondent.find_by_session_id(cookies[:survey_session_id])
    end

    def session_params
      params.permit(:time_elapsed, :flight_time_remaining, :times_circled)
    end

  end
end
