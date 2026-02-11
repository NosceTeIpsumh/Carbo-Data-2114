class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @votable = find_votable
    value = params[:value].to_i

    existing_vote = @votable.vote_by(current_user)

    if existing_vote
      if existing_vote.value == value
        existing_vote.destroy
      else
        existing_vote.update(value: value)
      end
    else
      @votable.votes.create(user: current_user, value: value)
    end

    render json: { score: @votable.score }
  end

  private

  def find_votable
    if params[:comment_id]
      Comment.find(params[:comment_id])
    else
      Post.find(params[:post_id])
    end
  end
end
