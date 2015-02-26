module Api
  class ResponseController < ApplicationController
    before_filter :set_respondent

    def create
      if @respondent
        result = Response.create_all_from_node_interaction(response_params, @respondent)
        if result[:status] == "success"
          render json: result, status: 200
        else
          render json: result, status: 422
        end
      else
        render json: {error: "no respondent present"}, status: 422
      end
    end

    private
    def response_params
      params[:response][:answers] ||= [] if params[:response].has_key?(:answers)
      params.require(:response).permit(
        :is_decision,
        :node_id,
        :respondent_id,
        :decision_id,
        :next_node_id,
        freeform_response: [:response, :answer_id],
        answers: [[:id, :rank]]
      )
    end

    def set_respondent
      @respondent = Respondent.find_by_id(response_params[:respondent_id])
    end

  end
end
