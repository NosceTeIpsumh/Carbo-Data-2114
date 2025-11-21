class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show, :edit, :update]

  def index
    @recipes = current_user.recipes
    @recipe = Recipe.new
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
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :steps, :difficulty, :indice_gly, :ratio_glucide, :user_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
