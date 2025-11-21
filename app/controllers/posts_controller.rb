class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts= current_user.posts
  end

  def show
    @comments= @post.comments
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to items_path, flash, notice: "L'article a été créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
     if @post.update(post_params)
      redirect_to post_path(@post), notice: "L'article a été mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, status: :see_other, alert: "L'article a été supprimé."
    else
      redirect_to post_path(@post), alert: "Impossible de supprimer l'article."
    end
  end

  private

  def find_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:post).permit(:content, :up, :down)
  end
end
