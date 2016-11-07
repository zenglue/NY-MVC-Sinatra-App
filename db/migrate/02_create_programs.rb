class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :organization_name
      t.string :url
      t.string :address
      t.string :telephone_number
    end
  end
end
