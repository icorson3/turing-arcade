class AddColumnToUser2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :user_id
    add_reference :users, :game, index: true, foreign_key: true
  end
end
