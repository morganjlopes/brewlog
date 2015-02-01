json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :description, :color, :difficulty, :recipe_type, :beer_style_id, :projected_volume_in_gallons, :projected_original_gravity, :projected_final_gravity, :projected_alcohol_by_volume, :projected_international_bittering_units, :total_boil_duration_in_minutes, :primary_fermenting_duration_in_days, :secondary_fermenting_duration_in_days, :recommended_fermenting_temperature_in_fahrenheit, :author_id, :additional_notes
  json.url recipe_url(recipe, format: :json)
end
