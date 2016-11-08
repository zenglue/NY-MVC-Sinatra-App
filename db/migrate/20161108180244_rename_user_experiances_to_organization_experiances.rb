class RenameUserExperiancesToOrganizationExperiances < ActiveRecord::Migration[5.0]
  def change
    rename_table :user_experiances, :organization_experiances
  end
end
