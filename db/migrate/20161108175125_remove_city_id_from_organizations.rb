class RemoveCityIdFromOrganizations < ActiveRecord::Migration[5.0]
  def change
    remove_column :organizations, :city_id
  end
end
