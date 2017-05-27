class PagesController < ApplicationController
  layout "firstpage", :only => :index
  def index
    @posts = Post.all
    @doctors = User.where(role: "doctor")
  end

  def doctors
    @doctors = User.where(role: "doctor")
  end

  def dashboard
    @users = User.all
    @comments= Comment.all
    @posts = Post.all

  end
  def patients
    @patients = User.where(role: "patient")
  end
  def blogs
    @search = Post.search(params[:q])
    @posts = @search.result
  end
end
