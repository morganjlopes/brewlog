class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe

  STANDARD_UNIT_FLUID_OUNCES = 1
  STANDARD_UNIT_CUPS         = 2
  STANDARD_UNIT_PINTS        = 3
  STANDARD_UNIT_QUARTS       = 4
  STANDARD_UNIT_GALLONS      = 5
  STANDARD_UNIT_OUNCES       = 6
  STANDARD_UNIT_POUNDS       = 7
  STANDARD_UNIT_PACKAGES     = 8

  INGREDIENT_TYPE_FERMENTABLE   = 1
  INGREDIENT_TYPE_HOPS          = 2
  INGREDIENT_TYPE_YEAST         = 3
  INGREDIENT_TYPE_GRAIN         = 4
  INGREDIENT_TYPE_OTHER         = 5

  def self.standard_unit_options
    {
      STANDARD_UNIT_FLUID_OUNCES => "fl ounce",
      STANDARD_UNIT_CUPS         => "cup",
      STANDARD_UNIT_PINTS        => "pint",
      STANDARD_UNIT_QUARTS       => "quart",
      STANDARD_UNIT_GALLONS      => "gallon",
      STANDARD_UNIT_OUNCES       => "ounce",
      STANDARD_UNIT_POUNDS       => "pound",
      STANDARD_UNIT_PACKAGES     => "package"
    }
  end

  def standard_unit_as_string
    case standard_unit
      when STANDARD_UNIT_FLUID_OUNCES
        "fluid ounce"
      when STANDARD_UNIT_CUPS
        "cup"
      when STANDARD_UNIT_PINTS
        "pint"
      when STANDARD_UNIT_QUARTS
        "quart"
      when STANDARD_UNIT_GALLONS
        "gallon"
      when STANDARD_UNIT_OUNCES
        "ounce"
      when STANDARD_UNIT_POUNDS
        "pound"
      when STANDARD_UNIT_PACKAGES
        "package"
    end
  end

  def self.ingredient_types
    {
      INGREDIENT_TYPE_FERMENTABLE   => "Fermentable",
      INGREDIENT_TYPE_HOPS          => "Hops",
      INGREDIENT_TYPE_YEAST         => "Yeast",
      INGREDIENT_TYPE_GRAIN         => "Grain",
      INGREDIENT_TYPE_OTHER         => "Other"
    }
  end

  def ingredient_type_as_string
    case ingredient_type
      when INGREDIENT_TYPE_FERMENTABLE
        "fermentable"
      when INGREDIENT_TYPE_HOPS
        "hops"
      when INGREDIENT_TYPE_YEAST
        "yeast"
      when INGREDIENT_TYPE_GRAIN
        "grain"
      when INGREDIENT_TYPE_OTHER
        "other"
    end
  end
end
