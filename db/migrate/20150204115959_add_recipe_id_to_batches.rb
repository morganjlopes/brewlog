class AddRecipeIdToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :recipe_id, :integer
  end
end
