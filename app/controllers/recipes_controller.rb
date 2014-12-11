class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action do
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def index
    @recipe = Recipe.all.order("created_at desc")
    @recipe_by_date = @recipe.group_by(&:make_recipe_date)
    @recipe = @recipe.search(params[:search]) if params[:search].present?
  end

  def show
  end


  def tagged
    @recipe = Recipe.tagged_with(params[:tag_name])
    render :index
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "Your new reciepe was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Your new reciepe was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "This recipe has been deleted!"
  end



  private
  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, :make_recipe_date, :tag_list,
    ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
  end

end
