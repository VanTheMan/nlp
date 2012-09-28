class CreateSlangs < ActiveRecord::Migration
  def change
    create_table :slangs do |t|
      t.string :e_word
      t.string :v_word

      t.timestamps
    end
    add_index :slangs, [created_at]
  end
end
