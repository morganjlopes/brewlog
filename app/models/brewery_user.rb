class BreweryUser < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :user
end
