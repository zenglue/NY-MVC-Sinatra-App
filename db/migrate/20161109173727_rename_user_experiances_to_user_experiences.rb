class RenameUserExperiancesToUserExperiences < ActiveRecord::Migration[5.0]
  def change
    rename_table :user_experiances, :user_experiences
  end
end
