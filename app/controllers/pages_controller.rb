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
      @doctors = User.where(role: "doctor" )
  end

  def dashboard
    @users = User.all
    @comments= Comment.all
    @posts = Post.order(created_at: :DESC).includes(:comments).limit(5)

    @existing_chats_users = current_user.existing_chats_users

  end
  def patients
    @patients = User.where(role: "patient")
  end
  def blogs
    @search = Post.search(params[:q])
    @posts = @search.result
  end
  def about

  end
end
