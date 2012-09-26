class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :e_content
      t.string :v_content
      t.integer :script_number

      t.timestamps
    end
    add_index :scripts, [:created_at]
  end
end
