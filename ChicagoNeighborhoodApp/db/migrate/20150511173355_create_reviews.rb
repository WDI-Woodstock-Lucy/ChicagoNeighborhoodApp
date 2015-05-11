class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.integer 'user_id'
      t.text 'review_body'
      t.integer 'rating'
      t.integer 'zip'
      t.text 'neighborhood_name'
      t.text 'business_name'
      t.integer 'business_id'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
  end
end
