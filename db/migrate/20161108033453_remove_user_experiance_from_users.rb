class RemoveUserExperianceFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :user_experiance
  end
end
