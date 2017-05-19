class LikesController < ApplicationController
  def create
    post = Post.find params[:post_id]
    @like = Like.new(post: post, user: current_user)
    if @like.save
      redirect_to post_path(post)	, notice: "thanks for liking"
    else
      redirect_to post_path(post), alert: "Unable to like"
    end
  end
  def destroy
      like = current_user.likes.find params[:id]
      post = Post.find params[:post_id]
      like.destroy
      redirect_to post_path(post), notice: "can't like"
  end
end
