module Api
  class NodesController < ApplicationController

    def index
      @nodes = Node.all_with_content
    end

    def show
      node = Node.find(params[:id])
      render json: node, status: 200
    end

  end
end
