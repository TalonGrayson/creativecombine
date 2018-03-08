class AddBroadcasterTypeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :broadcaster_type, :string, default: ''
  end
end
