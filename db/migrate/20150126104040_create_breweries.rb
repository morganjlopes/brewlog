class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string   :name
      t.string   :slogan
      t.string   :slug

      t.timestamps null: false
    end
  end
end
