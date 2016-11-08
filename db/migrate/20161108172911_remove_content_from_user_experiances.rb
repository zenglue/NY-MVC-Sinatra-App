class RemoveContentFromUserExperiances < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_experiances, :content 
  end
end
