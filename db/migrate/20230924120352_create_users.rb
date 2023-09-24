class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :twitter_id, null: false
      t.string :nickname
      t.string :name
      t.string :token
      t.string :image
      t.datetime :expires_at

      t.timestamps null: false
    end
  end
end
