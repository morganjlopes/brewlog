class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string   :name
      t.text     :description
      t.string   :color
      t.integer  :difficulty,                                       :default => 1
      t.integer  :recipe_type
      t.integer  :beer_style_id
      t.decimal  :projected_volume_in_gallons
      t.decimal  :projected_original_gravity
      t.decimal  :projected_final_gravity
      t.decimal  :projected_alcohol_by_volume
      t.decimal  :projected_international_bittering_units
      t.integer  :total_boil_duration_in_minutes
      t.integer  :primary_fermenting_duration_in_days,              :default => 7
      t.integer  :secondary_fermenting_duration_in_days
      t.integer  :recommended_fermenting_temperature_in_fahrenheit, :default => 70
      t.integer  :author_id
      t.text     :additional_notes

      t.timestamps null: false
    end
  end
end
