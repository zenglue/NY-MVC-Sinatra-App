class AddUserIdToUserExperiances < ActiveRecord::Migration[5.0]
  def change
    add_column :user_experiances, :user_id, :integer
  end
end
