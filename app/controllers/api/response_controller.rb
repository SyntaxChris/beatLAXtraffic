module Api
  class ResponseController < ApplicationController

    def create
      result = Response.create_all_from_node_interaction(response_params)
      if result[:status] == "success"
        render json: result, status: 200
      else
        render json: result, status: 422
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
        answers: [[:id, :rank]]
      )
    end

  end
end
