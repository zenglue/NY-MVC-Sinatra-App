class FixColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_experiences, :overall_experiance_rating, :overall_experience_rating
    rename_column :user_experiences, :experiance_content, :experience_content
  end
end
