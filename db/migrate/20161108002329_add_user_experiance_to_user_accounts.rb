class AddUserExperianceToUserAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :user_accounts, :user_experiance, :string
  end
end
