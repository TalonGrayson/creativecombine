class AddDescAndOwnerColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :description, :string, default: ''
    add_column :users, :owner, :boolean, default: false
  end
end
