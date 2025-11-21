class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :feed]

  def home
  end

  def profile
  end

  def browse
  end

  def feed
    @posts = Post.all
    @post = Post.new
  end
end
