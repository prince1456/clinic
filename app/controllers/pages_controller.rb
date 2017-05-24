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
  end
  def patients
    @patients = User.where(role: "patient")
  end
  def blogs
    @blogs = Post.all.order(created_at: :desc)
  end
end
