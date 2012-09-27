class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :num_translate

      t.timestamps
    end
    add_index :users, [:created_at]
  end
end
