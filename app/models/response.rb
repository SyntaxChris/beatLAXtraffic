class Response < ActiveRecord::Base
  belongs_to :respondent
  belongs_to :node
  belongs_to :answer
  belongs_to :decision
  has_one :freeform_response
end
