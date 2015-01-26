class Batch < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]

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
