class RemoveColumnMakeRecipeDate < ActiveRecord::Migration
  def change
    remove_column :recipes, :make_recipe_date, :text
  end
end
