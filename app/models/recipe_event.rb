class RecipeEvent < ActiveRecord::Base
  belongs_to :recipe

  def self.event_options
    {
      "start" => "Start Boil",
      "add" => "Add",
      "boil" => "Boil",
      "remove" => "Remove",
      "terminate" => "Terminate Boil"
    }
  end
end
