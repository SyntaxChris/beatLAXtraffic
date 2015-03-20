class ExportController < ApplicationController
  before_action :authenticate_admin!

  def home
  end

  def response_index
    @responses = Response.includes(
      { :respondent => :unique_user },
      :answer,
      :decision,
      { :node => :question },
      { :node => :decision_point }
    )
    respond_to do |format|
      format.html do
        render 'response_index'
      end
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"response-list.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

end
