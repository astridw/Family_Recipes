class AddUserIdToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :user_id, :integer
  end
end
