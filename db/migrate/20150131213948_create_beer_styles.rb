class CreateBeerStyles < ActiveRecord::Migration
  def change
    create_table :beer_styles do |t|
      t.string   :name
      t.text     :description
      t.string   :alternative_names
      t.string   :examples
      t.string   :slug

      t.timestamps null: false
    end
  end
end
