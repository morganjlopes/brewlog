class Brewery < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]

  has_many :brewery_users
  has_many :users, through: :brewery_users

  has_many :batches
end
