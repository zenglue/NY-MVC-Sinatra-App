class DropOrganizationExperiancesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :organization_experiances
  end
end
