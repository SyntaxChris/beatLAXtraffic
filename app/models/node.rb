class Node < ActiveRecord::Base
  has_one :question
  has_one :decision_point
  has_many :responses
  belongs_to :branch
end
