module Api
  class ResponseController < ApplicationController

    def create
      result = Response.create_from_node_interaction(params)
      if result["status"] == "success"
        render json: "success!", status: 200
      else
        render json: "fail", status: 402
      end
    end

  end
end
