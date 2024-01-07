class AddUniqueConstraintToUsersEmail < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :email, unique: true unless index_exists?(:users, :email)
  end
end
