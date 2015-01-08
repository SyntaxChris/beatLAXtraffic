class Response < ActiveRecord::Base
  belongs_to :respondent
  belongs_to :node
  belongs_to :answer
  belongs_to :decision
  has_one :freeform_response

  validates :node_id, presence: true
  validates :respondent_id, presence: true

  def self.create_from_options!(response_params, answers_array = [])
    response = Response.new(response_params)
    if answers_array.empty?
      response.skipped = true unless response_params[:decision_id].present?
    else
      response.answer_id = answers_array.first[:id]
    end
    response.calculate_seen_before

    # return result
    if response.save
      return {status: "success"}
    else
      return {status: "fail", message: response.errors.messages}
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

  def self.create_all_from_node_interaction(node_interaction_params)
    is_decision = node_interaction_params[:is_decision]
    answers_array = node_interaction_params[:answers]
    time_elapsed = node_interaction_params[:time_elapsed]
    response_params = node_interaction_params.except(:is_decision, :answers, :time_elapsed)

    if answers_array.count < 2
      Response.create_from_options!(response_params, answers_array)
    else # multiple choice
      previous = Response.where(
        respondent_id: node_interaction_params[:respondent_id]
      ).where(
        node_id: node_interaction_params[:node_id]
      ).sort_by(&:created_at)
      if previous.count > 0
        multi_times_seen = previous.last.times_seen + 1
      else
        multi_times_seen = 1
      end

      successes = 0
      answers_array.each do |answer_hash|
        response = Response.new(response_params)
        response.answer_id = answer_hash[:id]
        response.rank = answer_hash[:rank]
        response.times_seen = multi_times_seen

        if response.save
          successes += 1
        end
      end

      if successes == node_interaction_params[:answers].count
        return {status: "success"}
      else
        return {status: "fail", message: "one of the multiple choice anwers had a problem"}
      end
    end
  end

end
