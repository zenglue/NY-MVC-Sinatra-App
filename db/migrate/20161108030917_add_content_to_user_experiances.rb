class AddContentToUserExperiances < ActiveRecord::Migration[5.0]
  def change
    add_column :user_experiances, :content, :string
  end
end
