class UniqueUser < ActiveRecord::Base
  has_many :respondents

  def self.get_or_create_by_identifier(browser_identifier)
    UniqueUser.find_by_browser_identifier(browser_identifier) ||
      UniqueUser.create(browser_identifier: browser_identifier)
  end
end
