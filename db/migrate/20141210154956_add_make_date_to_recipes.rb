class AddMakeDateToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :make_recipe_date, :text
  end
end
