class Question < ActiveRecord::Base
  belongs_to :node
  has_many :answers
end
