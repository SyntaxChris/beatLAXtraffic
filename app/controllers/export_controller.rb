class ExportController < ApplicationController
  def home
  end

  def response_index
    @responses = Response.all
    respond_to do |format|
      format.html { render 'response_index' }
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"response-list\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

end
