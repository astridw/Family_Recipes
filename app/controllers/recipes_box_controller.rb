class RecipesBoxController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "Your new reciepe was created successfully!"
      render :new
    end
  end

  private
  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description)
  end
end
