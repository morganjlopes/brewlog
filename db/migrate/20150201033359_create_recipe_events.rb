class CreateRecipeEvents < ActiveRecord::Migration
  def change
    create_table :recipe_events do |t|
      t.string   :action
      t.string   :subject
      t.integer  :position
      t.integer  :recipe_id

      t.timestamps null: false
    end
  end
end
