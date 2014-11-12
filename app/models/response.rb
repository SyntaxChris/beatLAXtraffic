class Response < ActiveRecord::Base
  belongs_to :respondent
  belongs_to :node
end
