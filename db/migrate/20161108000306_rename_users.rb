class RenameUsers < ActiveRecord::Migration[5.0]
  def up
    rename_table :users, :user_accounts
  end

  def down
    rename_table :user_accounts, :users
  end
end
