class Batch < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders, :scoped], :scope => :brewery

  has_many :activities, as: :trackable
  
  belongs_to :brewery
  belongs_to :beer_style

  validates_presence_of :name,
                        :projected_volume_in_gallons,
                        :projected_alcohol_by_volume

  DIFFICULTY_EASY       = 1
  DIFFICULTY_MEDIUM     = 2
  DIFFICULTY_DIFFICULT  = 3

  def self.difficulty_options
    {
      DIFFICULTY_EASY      => "easy",
      DIFFICULTY_MEDIUM    => "medium",
      DIFFICULTY_DIFFICULT => "difficult"
    }
  end
end
