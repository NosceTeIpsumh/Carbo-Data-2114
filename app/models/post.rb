class Post < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :comments, dependent: :destroy

  multisearchable against: [:title, :content]
end
