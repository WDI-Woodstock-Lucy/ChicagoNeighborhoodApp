class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :primary_key_id
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email, null: false
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
