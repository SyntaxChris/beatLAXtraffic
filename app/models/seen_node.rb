class SeenNode < ActiveRecord::Base
  belongs_to :node
  belongs_to :respondent
end
