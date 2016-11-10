class RemoveOrganizationIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :organization_id
  end
end
