class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :uid, :string
    add_column :users, :token, :string
    add_column :users, :admin, :boolean, default:false
    add_column :users, :staff, :boolean, default:false
    add_column :users, :active, :boolean, default:true
  end
end
