class PagesController < ApplicationController
  def index
  end
  def doctors
    
    @doctors = User.where(:role === "doctor")
  end
  def dashboard
  end
end
