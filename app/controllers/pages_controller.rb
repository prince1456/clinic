class PagesController < ApplicationController
  def index
  end
  def doctors
    @doctors = User.where(role: "doctor")
  end
  def dashboard
  end
  def patients
    @patients = User.where(role: "patient")
  end
end
