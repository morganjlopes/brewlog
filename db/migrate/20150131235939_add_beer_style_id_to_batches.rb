class AddBeerStyleIdToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :beer_style_id, :integer
  end
end
