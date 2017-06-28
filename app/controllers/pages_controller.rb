class PagesController < ApplicationController
  layout "firstpage", only: [:index, :about]
  before_action :authenticate_user!, except: [:index, :about]
  def index
    @posts = Post.all
    if params[:locale] === "ar"
      @doctors = User.where(role: "doctor").limit(3)
      @posts = Post.where(lang: "ar")
    else
      @doctors = User.where(role: "doctor").order(updated_at: :desc).limit(3)
      @posts = Post.where(lang: "en")
    end

    @user = User.new
  end

  def doctors
    if params[:search].present?
      @doctors = User.search_users(params[:search]).paginate(page: params[:page], :per_page => 5)
    else
      @doctors = User.where(role: "doctor").paginate(page: params[:page], :per_page => 5)
    end
    # @u = User.find_by_name(params[:q])
      # @search = Profile.ransack(params[:q])
      # if params[:q].present?
      #     @doctors = Profile.search.result.paginate(page: params[:page], :per_page => 5)
      #     puts @doctors
      #     byebug
      # else
      #     @doctors = User.where(role: "doctor").paginate(page:params[:page], :per_page => 5)
      #     byebug
      # end
  end

  def dashboard
    @users = User.all
    @comments= Comment.all
    @posts = Post.order(created_at: :DESC).includes(:comments).limit(5)

    @existing_chats_users = current_user.existing_chats_users

  end
  def patients
    @search = User.search(params[:q])
    @patients = @search.result.where(role: "patient").paginate(page: params[:page], :per_page => 10)
    # @patients = User.where(role: "patient").paginate(:page => params[:page], :per_page => 10)
  end
  def blogs
    @search = Post.search(params[:q])
    @posts = @search.result

  end
  def about

  end
end
