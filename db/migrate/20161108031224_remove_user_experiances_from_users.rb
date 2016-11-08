class RemoveUserExperiancesFromUsers < ActiveRecord::Migration[5.0]
  def down
    remove_column :users, :user_experiances
  end
end
