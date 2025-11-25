class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @items = current_user.items.search_by_name_description_difficulty_indice_gly(params[:query])
    else
      @items = current_user.items
    end
    @item = Item.new
  end

  def show
  end

  def create
    @item = current_user.items.new(item_params)
    
    if @item.save
      redirect_to items_path, notice: "The CarboDuct has been created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "Your CarboDuct has been updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path, status: :see_other, alert: "The CarboDuct has been deleted"
    else
      redirect_to item_path(@item), alert: "Impossible to delete the CarboDuct"
    end
  end

  private

  def find_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :brand, :category, :indice_gly, :ratio_glucide, :photo)
  end
end
