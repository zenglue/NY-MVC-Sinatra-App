class OrganizationUserExperiances < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_user_experiances do |t|
      t.integer :oganization_id
      t.integer :user_id
    end
  end
end
