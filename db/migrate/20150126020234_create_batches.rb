class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string   :name
      t.text     :description
      t.decimal  :target_volume_in_gallons
      t.decimal  :actual_volume_in_gallons
      t.decimal  :original_gravity
      t.decimal  :final_gravity
      t.decimal  :alcohol_by_volume
      t.string   :color
      t.integer  :difficulty
      t.date     :brew_date
      t.date     :secondary_transition_date
      t.date     :bottle_date
      t.date     :condition_date
      t.string   :slug

      t.timestamps null: false
    end
  end
end
