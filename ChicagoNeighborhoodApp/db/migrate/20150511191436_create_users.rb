class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :primary_key_id
      t.string :username
      t.string :password_digest
      t.string :email

      t.timestamps null: false
    end
  end
end
