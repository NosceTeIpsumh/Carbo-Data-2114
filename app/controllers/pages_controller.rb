class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :feed]

  def home
  end

  def root
  end
  
  def profile
    @last_recipes = current_user.recipes.order(created_at: :desc)
    @last_items = current_user.items.order(created_at: :desc)

    if params[:query].present?
      @results = PgSearch.multisearch(params[:query]).includes(:searchable)
    else
      @results = []
    end
  end

  def feed
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end
end
