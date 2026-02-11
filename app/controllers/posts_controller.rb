class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show]
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    @posts= current_user.posts
  end

  def new
    @post = Post.new
  end

  def show
    @comments = @post.comments.by_score.to_a
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to feed_path, notice: "Le post a été créé avec succès."
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

  def set_post
    @post = Post.find(params[:id])
  end

  def find_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :photo)
  end
end
