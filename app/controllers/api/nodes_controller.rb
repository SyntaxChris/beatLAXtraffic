module Api
  class NodesController < ApplicationController

    def index
      @nodes = Node.all_with_content
      expires_in 1.minute, public: true
      fresh_when etag: @nodes
    end

    def show
      node = Node.find(params[:id])
      render json: node, status: 200
    end

    private
  end
end
