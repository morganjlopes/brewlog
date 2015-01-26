class Brewery < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]

  has_many :batches
end
