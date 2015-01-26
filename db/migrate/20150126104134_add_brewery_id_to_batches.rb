class AddBreweryIdToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :brewery_id, :integer
  end
end
