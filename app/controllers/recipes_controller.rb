class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = current_user.recipes
    @recipe = Recipe.new
    # Group recipes by GI level
    @low_gi_recipes = current_user.recipes.where('indice_gly < ?', 55).order(created_at: :desc)
    @medium_gi_recipes = current_user.recipes.where('indice_gly >= ? AND indice_gly <= ?', 55, 70).order(created_at: :desc)
    @high_gi_recipes = current_user.recipes.where('indice_gly > ?', 70).order(created_at: :desc)
  end

  def show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @user = current_user
    if @recipe.save!
      redirect_to recipes_path
    else
      render :new, unprocessable_entity
    end
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    @user = current_user
    if @recipe.save!
      redirect_to recipes_path
    else
      render :new, unprocessable_entity
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to recipes_path, status: :see_other, alert: "Recipe has been deleted"
    else
      redirect_to recipe_path(@recipe), alert: "Impossible to delete the recipe"
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :steps, :difficulty, :indice_gly, :ratio_glucide, :user_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
