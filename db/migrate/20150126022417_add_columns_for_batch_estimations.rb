class AddColumnsForBatchEstimations < ActiveRecord::Migration
  def change
    rename_column :batches, :target_volume_in_gallons,  :projected_volume_in_gallons
    rename_column :batches, :alcohol_by_volume,         :projected_alcohol_by_volume
    rename_column :batches, :original_gravity,          :projected_original_gravity
    rename_column :batches, :final_gravity,             :projected_final_gravity
    rename_column :batches, :brew_date,                 :actual_brew_date
    rename_column :batches, :secondary_transition_date, :projected_secondary_transition_date
    rename_column :batches, :bottle_date,               :projected_bottle_date
    rename_column :batches, :condition_date,            :projected_condition_date
    add_column    :batches, :actual_original_gravity,            :decimal
    add_column    :batches, :actual_final_gravity,               :decimal
    add_column    :batches, :actual_alcohol_by_volume,           :decimal
    add_column    :batches, :actual_secondary_transition_date,   :date
    add_column    :batches, :actual_bottle_date,                 :date
    add_column    :batches, :actual_condition_date,              :date
  end
end
