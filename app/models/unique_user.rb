class UniqueUser < ActiveRecord::Base
  has_many :respondents

  def self.get_or_create_by_identifier(browser_identifier)
    user = UniqueUser.find_by_browser_identifier(browser_identifier) ||
      UniqueUser.create(browser_identifier: browser_identifier)
    return { user_id: user.id, gameplay_number: user.respondents.count + 1 }
  end
end
