class Response < ActiveRecord::Base
  belongs_to :respondent
  belongs_to :node
  belongs_to :answer
  belongs_to :decision
  has_one :freeform_response

  def self.create_from_node_interaction(node_interaction_params)
    if node_interaction_params[:is_decision]
      # for decisions
      # deal with time remaining
    else
      if node_interaction_params[:answers].count == 0
        # question was skipped
      elsif node_interaction_params[:answers].count == 1
      # for non-MP questions
        previous = Response.find_by_node_id(node_interaction_params[:node_id])
        response = Response.new(
          respondent_id: node_interaction_params[:respondent_id],
          answer_id: node_interaction_params[:answer_id],
          node_id: node_interaction_params[:node_id]
        )
        if previous
          response.times_seen = previous.times_seen + 1
        end
      else
      # for MP-questions
      # separate responses per multiple choice
      end
    # decide on times_seen
    # decide on skipped (answer_id nil and not a decision)
    end

  end
end
