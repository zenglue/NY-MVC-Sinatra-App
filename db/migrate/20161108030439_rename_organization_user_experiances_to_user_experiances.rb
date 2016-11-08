class RenameOrganizationUserExperiancesToUserExperiances < ActiveRecord::Migration[5.0]
  def change
    rename_table :organization_user_experiances, :user_experiances
  end
end
