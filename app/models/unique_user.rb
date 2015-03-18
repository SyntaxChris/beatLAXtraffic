class UniqueUser < ActiveRecord::Base
  has_many :respondents
end
