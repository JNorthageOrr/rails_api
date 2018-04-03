class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
  	#add the next line after generating the migration
  	add_index :users, :email, unique: true
  end
end
