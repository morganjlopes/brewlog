class Batch < ActiveRecord::Base

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
