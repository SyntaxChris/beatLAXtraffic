class Question < ActiveRecord::Base
  belongs_to :node
  belongs_to :question_type
  has_many :answers
end
