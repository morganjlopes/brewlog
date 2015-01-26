class BreweryUser < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :user

  validates_uniqueness_of :user, scope: :brewery
end
