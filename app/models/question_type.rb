class QuestionType < ActiveRecord::Base
  has_many :questions
  has_many :decision_points
end
