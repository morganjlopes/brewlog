class AddInternationalBitteringUnitsToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :actual_international_bittering_units,    :integer
    add_column :batches, :projected_international_bittering_units, :integer
  end
end
