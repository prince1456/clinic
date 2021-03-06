
class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :update, :destroy]
  layout "firstpage", only: [:show]
  def index
    if params[:search].present?
      @posts = Post.search_posts(params[:search]).paginate(page: params[:page], :per_page => 5)
    else
      @posts = Post.all.paginate(page: params[:page], :per_page => 5)
    end
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
    if params[:locale] == "ar"
      @posts= Post.where(lang: "ar").order(id: :desc)
    else
      posts= Post.where(lang: "en").order(id: :desc)
    end
  end

  def edit
     redirect_to root_path, alert: "access defined" unless can? :edit, @post
  end

  def update
    redirect_to root_path, alert: "access defined" unless can? :update, @post
    if @post.update post_params
      flash[:notice] = "the post was updated "
      redirect_to post_path(@post), notice: "post have been updated"
    else
      flash[:alert] = "Post can't be updated"
      render :edit
    end
  end
  def destroy
    redirect_to root_path, alert: "access defined" unless can? :destroy, @post
    @post.destroy
    flash[:notice]= "your post was deleted"
    redirect_to posts_path
  end
  private
  def post_params
    params.require(:post).permit(:title, :content, :author, :picture, :video, :attachments, :lang, {tag_ids: []})
  end
  def find_post
    @post = Post.find params[:id]
  end
end
