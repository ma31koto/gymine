class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:map_search, :show]

  def map_search
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

end
