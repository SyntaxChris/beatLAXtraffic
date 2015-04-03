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
    ).order(:respondent_id, :created_at)
    respond_to do |format|
      format.html do
        render 'response_index'
      end
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"response-list-#{file_timestamp}.csv\""
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
    ).order(:respondent_id)
    respond_to do |format|
      format.html do
        render 'responses_with_variables'
      end
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"responses-with-variables-#{file_timestamp}.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def respondents_index
    @respondents = Respondent.all.order(:unique_user_id)
    respond_to do |format|
      format.html do
        render 'respondents_index'
      end
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"respondents-#{file_timestamp}.csv\""
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
    ).order(:respondent_id, :created_at)
    respond_to do |format|
      format.html do
        render 'codified_response_index'
      end
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"codified-response-list-#{file_timestamp}.csv\""
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
        headers['Content-Disposition'] = "attachment; filename=\"codebook-reference-#{file_timestamp}.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  private

  def file_timestamp
    Time.now.strftime('%Y%m%d_%H%M%S')
  end

end
