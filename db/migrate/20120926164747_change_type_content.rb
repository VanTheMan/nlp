class ChangeTypeContent < ActiveRecord::Migration
  def up
  	change_column :scripts, :e_content, :text
  	change_column :scripts, :v_content, :text
  end

  def down
  end
end
