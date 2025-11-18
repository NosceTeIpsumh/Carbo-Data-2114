class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = recipe.new(recipe_params)
    @user = current_user
    if @recipe.save!
      redirect_to recipes_path
    else
      render :new, unprocessable_entity
  end

  def edit
  end

  def update
  end

  def destroy
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
