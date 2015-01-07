module Api
  class ResponseController < ApplicationController

    def create
      result = Response.create_all_from_node_interaction(response_params)
      if result["status"] == "success"
        render json: {
          status: result["status"]
        }, status: 200
      else
        render json: {
          status: result["status"],
          messages: result["message"]
        }, status: 402
      end
    end

    private
    def response_params
      params.require(:response).permit(
        :is_decision,
        :node_id,
        :respondent_id,
        :decision_id,
        :answers => [:answer_id, :rank]
      )
    end

  end
end
