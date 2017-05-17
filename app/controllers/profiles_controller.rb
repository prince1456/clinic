class ProfilesController < ApplicationController
  before_action :find_params, only: [:edit, :show, :update, :destory]
  def index
    @profiles = Profile.all
  end
  def show
  end
  def edit

  end
  def new
    @profile = Profile.new
  end
  def destory
  end
  def update
  end
  def create
    @profile = Profile.new(strong_params)

    if @profile.save
      redirect_to profile_path(@profile), notice: "successfully make your profiles"
    else
      falsh[:alert] = "somethings wrong"
      render :new
    end

  end
  private
  def find_params
    @profile = Profile.find(params[:id])
  end
  def strong_params
    params.require(:profile).permit(:firt_name, :last_name, :address,
                                    :phone_number, :emr_name, :emr_phone,
                                    :gender, :age, :nationality, :married,
                                    :job, :image, :user_id)
end
end
