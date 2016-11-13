class RemoveColumnsFromUserExperiences < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_experiences, :needs_met_rating
    remove_column :user_experiences, :accessibility_rating
    remove_column :user_experiences, :organization_response_rating
    remove_column :user_experiences, :overall_experience_rating
  end
end
