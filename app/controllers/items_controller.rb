class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = current_user.items
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to items_path, flash, notice: "L'article a été créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "L'article a été mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path, status: :see_other, alert: "L'article a été supprimé."
    else
      redirect_to item_path(@item), alert: "Impossible de supprimer l'article."
    end
  end

  private

  def find_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :brand, :category, :indice_gly, :ratio_glucide)
  end
end
