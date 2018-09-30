class LikesController < ApplicationController
  before_action :require_signin

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create!(user: current_user) unless Like.find_by(post: @post, user: current_user)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(post: @post, user: current_user)
    @like.destroy
  end
end
