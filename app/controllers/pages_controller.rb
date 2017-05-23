class PagesController < ApplicationController
  def index
    @posts = Post.all
    @doctors = User.where(role: "doctor")
  end

  def doctors
    @doctors = User.where(role: "doctor")
  end

  def dashboard
  end
end
