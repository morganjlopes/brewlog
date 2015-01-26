class CreateBreweryUsers < ActiveRecord::Migration
  def change
    create_table :brewery_users do |t|
      t.integer  :user_id
      t.integer  :brewery_id

      t.timestamps null: false
    end
  end
end
