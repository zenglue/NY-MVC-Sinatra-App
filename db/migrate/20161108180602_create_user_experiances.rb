class CreateUserExperiances < ActiveRecord::Migration[5.0]
  def change
    create_table :user_experiances do |t|
      t.integer :needs_met_rating
      t.integer :accessibility_rating
      t.integer :organization_response_rating
      t.integer :overall_experiance_rating
      t.string :experiance_content
      t.string :advice_content
    end
  end
end
