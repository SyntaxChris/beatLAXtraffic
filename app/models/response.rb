class Response < ActiveRecord::Base
  belongs_to :respondent
  belongs_to :node
  belongs_to :answer
  belongs_to :decision
  has_one :freeform_response
  accepts_nested_attributes_for :freeform_response

  validates :node_id, presence: true
  validates :respondent_id, presence: true

  def self.create_from_options!(response_params, answers_array = [], respondent)
    response = Response.new(response_params.except(:next_node_id, :freeform_response))
    if answers_array.empty? || answers_array.nil?
      response.skipped = true unless response_params[:decision_id].present?
    else
      # a single freeform response?
      if response_params[:freeform_response].present?
        response.create_freeform_response(
          response_text: response_params[:freeform_response][:response]
        )
      #elsif answers_array.first[:custom_answer].present?
      #  binding.pry
      #  response.answer_id = answers_array.first[:id]
      #  response.answer.answer = answers_array.first[:custom_answer]
      end
      response.answer_id = answers_array.first[:id]
    end
    response.calculate_seen_before

    if response.save
      respondent.update_node_history(response_params)
      return {status: "success"}
    else
      return {status: "fail", message: response.errors.messages}
    end
  end

  def self.create_multi_from_options!(response_params, answers_array, respondent)
    previous = Response.where(
      respondent_id: response_params[:respondent_id]
    ).where(
      node_id: response_params[:node_id]
    ).sort_by(&:created_at)
    if previous.count > 0
      multi_times_seen = previous.last.times_seen + 1
    else
      multi_times_seen = 1
    end

    successes = 0
    answers_array.each do |answer_hash|
      if response_params[:freeform_response].present? && answer_hash[:id] == response_params[:freeform_response][:answer_id]
        # one of these is a freeform response
        response = Response.new(response_params.except(:next_node_id, :freeform_response))
        response.create_freeform_response(
          response_text: response_params[:freeform_response][:response]
        )
        response.answer_id = answer_hash[:id]
        response.times_seen = multi_times_seen
      else
        response = Response.new(response_params.except(:next_node_id, :freeform_response))
        response.answer_id = answer_hash[:id]
        response.rank = answer_hash[:rank]
        response.times_seen = multi_times_seen
      end

      if response.save
        successes += 1
      end
    end
    if successes == answers_array.count
      respondent.update_node_history(response_params)
      return {status: "success"}
    else
      return {status: "fail", message: "one of the multiple choice anwers had a problem"}
    end
  end

  def calculate_seen_before
    previous = Response.where(
      respondent_id: self.respondent_id
    ).where(
      node_id: self.node_id
    ).sort_by(&:created_at)

    if previous.count > 0
      self.times_seen = previous.last.times_seen + 1
    end
  end

  def self.create_all_from_node_interaction(node_interaction_params, respondent)
    is_decision = node_interaction_params[:is_decision]
    answers_array = node_interaction_params[:answers]
    time_elapsed = node_interaction_params[:time_elapsed]
    response_params = node_interaction_params.except(:is_decision, :answers, :time_elapsed)

    if answers_array && answers_array.count < 2 # single choice
      Response.create_from_options!(response_params, answers_array, respondent)
    elsif answers_array && answers_array.count > 1 # multiple choice
      Response.create_multi_from_options!(response_params, answers_array, respondent)
    else # no answers, a decision point
      Response.create_from_options!(response_params, respondent)
    end

  end

end
