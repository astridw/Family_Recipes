class AddColumnMakeRecipeDate < ActiveRecord::Migration
  def change
      add_column :recipes, :make_recipe_date, :date
  end
end
