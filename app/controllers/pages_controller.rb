class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :feed]

  def home
  end

  def profile
  end

  def feed
    @posts = Post.all
  end
end
