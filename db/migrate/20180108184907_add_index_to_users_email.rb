class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	#add the next line after generating the migration
  	add_index :users, :email, unique: true
  end
end
