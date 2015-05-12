class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :favorite_id
      t.text :business_name
      t.integer :business_id

      t.timestamps null: false
    end
  end
end
