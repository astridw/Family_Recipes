class AddFamilyIdToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :family_id, :integer
  end
end
