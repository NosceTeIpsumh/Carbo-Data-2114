class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :feed]

  def home
  end

  def profile
    @last_recipes = current_user.recipes.order(created_at: :desc)
    @last_items = current_user.items.order(created_at: :desc)
  end

  def feed
    @posts = Post.all
    @post = Post.new
  end
end
