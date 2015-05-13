class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.text :description
      t.integer :zipcode

      t.timestamps null: false
    end
  end
end
