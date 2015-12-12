class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :page
      t.text :track, default: ''

      t.timestamps null: false
    end
  end
end
