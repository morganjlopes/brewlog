class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.decimal  :quantity
      t.integer  :standard_unit
      t.string   :item
      t.integer  :ingredient_type
      t.integer  :recipe_id

      t.timestamps null: false
    end
  end
end
