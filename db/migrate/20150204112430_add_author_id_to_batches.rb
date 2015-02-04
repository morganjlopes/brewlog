class AddAuthorIdToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :author_id, :integer
  end
end
