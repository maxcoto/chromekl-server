class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :token
      t.boolean :enabled, default: true

      t.timestamps null: false
    end
  end
end
