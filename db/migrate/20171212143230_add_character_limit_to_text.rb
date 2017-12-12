class AddCharacterLimitToText < ActiveRecord::Migration[5.2]
  def change
    change_column :texts, :text, :text, :limit => 140, :null => false
  end
end
