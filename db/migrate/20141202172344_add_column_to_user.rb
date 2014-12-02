class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_change_password, :boolean, default: true
  end
end
