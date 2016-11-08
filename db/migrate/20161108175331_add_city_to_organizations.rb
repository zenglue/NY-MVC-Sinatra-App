class AddCityToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :city, :string
  end
end
