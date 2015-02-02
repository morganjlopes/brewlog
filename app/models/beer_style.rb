class BeerStyle < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]
  
  validates_uniqueness_of :name

  has_many :batches
  has_many :recipes
end
