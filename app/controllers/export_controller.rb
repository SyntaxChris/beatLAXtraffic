class ExportController < ApplicationController
  before_action :authenticate_admin!, except: :login

  def login
  end

  def home
  end

  def response_index
    @responses = Response.includes(
      { :respondent => :unique_user },
      :freeform_response,
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

  def responses_with_variables
    @responses = Response.includes(
      { :respondent => :unique_user },
      :freeform_response,
      :answer,
      :decision,
      { :node => :question },
      { :node => :decision_point }
    )
    respond_to do |format|
      format.html do
        render 'responses_with_variables'
      end
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"responses-with-variables.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def codified_response_index
    @responses = Response.includes(
      { :respondent => :unique_user },
      :freeform_response,
      :answer,
      :decision,
      { :node => :question },
      { :node => :decision_point }
    )
    respond_to do |format|
      format.html do
        render 'codified_response_index'
      end
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"codified-response-list.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def codebook_reference
    @nodes = Node.all_with_content
    respond_to do |format|
      format.html do
        render 'codebook_reference'
      end
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"codebook-reference.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

end
