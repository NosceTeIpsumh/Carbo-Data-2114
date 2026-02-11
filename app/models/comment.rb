class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :votable, dependent: :destroy

  scope :by_score, -> {
    left_joins(:votes)
      .group(:id)
      .order(Arel.sql("COALESCE(SUM(votes.value), 0) DESC, comments.created_at DESC"))
  }

  def score
    votes.sum(:value)
  end

  def vote_by(user)
    votes.find_by(user: user)
  end
end
