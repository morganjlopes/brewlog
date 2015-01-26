json.array!(@batches) do |batch|
  json.extract! batch, :id, :name, :description, :target_volume_in_gallons, :actual_volume_in_gallons, :original_gravity, :final_gravity, :alcohol_by_volume, :color, :difficulty, :brew_date, :secondary_transition_date, :bottle_date, :condition_date, :slug
  json.url batch_url(batch, format: :json)
end
