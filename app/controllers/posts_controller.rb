class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to post_path(@post)
    else
      flash[:alert] = "post can't be created"
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update post_params
      flash[:notice] = "the post was updated "
      redirect_to post_path(@post), notice: "post have been updated"
    else
      flash[:alert] = "Post can't be updated"
      render :edit
    end
  end
  def destroy
    @post.destroy
    flash[:notice]= "your post was deleted"
    redirect_to posts_path
  end
  private
  def post_params
    params.require(:post).permit(:title, :content, :author, :picture, :video, :attachments,  {tag_ids: []})
  end
  def find_post
    @post = Post.find params[:id]
  end
end