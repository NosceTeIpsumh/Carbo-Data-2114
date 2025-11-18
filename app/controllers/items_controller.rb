class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items= current_user.items
  end

  def show
    @item= Item.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
