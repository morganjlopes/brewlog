class Recipe < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]

  belongs_to :author, :class_name => "User"
  belongs_to :beer_style

  has_many :recipe_ingredients
  has_many :recipe_events
  
  accepts_nested_attributes_for :recipe_ingredients
  accepts_nested_attributes_for :recipe_events
  
  DIFFICULTY_EASY       = 1
  DIFFICULTY_MEDIUM     = 2
  DIFFICULTY_DIFFICULT  = 3

  RECIPE_TYPE_ALL_GRAIN     = 1
  RECIPE_TYPE_EXTRACT       = 2
  RECIPE_TYPE_PARTIAL_MASH  = 3
  RECIPE_TYPE_OTHER         = 4

  def self.difficulty_options
    {
      DIFFICULTY_EASY      => "easy",
      DIFFICULTY_MEDIUM    => "medium",
      DIFFICULTY_DIFFICULT => "difficult"
    }
  end

  def self.recipe_types
    {
      RECIPE_TYPE_ALL_GRAIN     => "All Grain",
      RECIPE_TYPE_EXTRACT       => "Extract",
      RECIPE_TYPE_PARTIAL_MASH  => "Partial Mash",
      RECIPE_TYPE_OTHER         => "Other"
    }
  end

  def recipe_type_as_string
    case recipe_type
      when RECIPE_TYPE_ALL_GRAIN
        "all grain"
      when RECIPE_TYPE_EXTRACT
        "extract"
      when RECIPE_TYPE_PARTIAL_MASH
        "partial mash"
      when RECIPE_TYPE_OTHER
        "other"
    end
  end
end
