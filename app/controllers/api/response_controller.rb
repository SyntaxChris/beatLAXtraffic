module Api
  class ResponseController < ApplicationController

    def create
      result = Response.create_all_from_node_interaction(params)
      if result["status"] == "success"
        render json: {status: result["status"]}, status: 200
      else
        render json: {status: result["status"], messages: result["messages"]}, status: 402
      end
    end

  end
end
