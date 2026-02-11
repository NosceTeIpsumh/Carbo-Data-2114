class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_back fallback_location: post_path(@post)
    else
      redirect_back fallback_location: post_path(@post), alert: "Comment cannot be empty."
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: post_path(@comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
