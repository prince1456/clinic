class ProfilesController < ApplicationController
  before_action :find_params, only: [:edit, :show, :update, :destory]
  def index
    @search = Profile.search(params[:q])
    @profiles = @search.result
  end
  def new
    @profile = Profile.new
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
  def show
    @directory = Directory.new
  end

  def edit
  end
  def update
    byebug
    if @profile.update strong_params
      redirect_to profile_path(@profile), notice: "profile updated"
    else
      flash[:alert] = "something went wrong"
      render :edit
    end
  end
  def destroy
    @profile.destroy
    flash[:notice] = "profile was deleted"
    redirect_to profiles_path
  end
  private
  def find_params
    @profile = Profile.find(params[:id])
  end
  def strong_params
    params.require(:profile).permit(:first_name, :last_name, :address,
                                    :phone_number, :emr_name, :emr_phone,
                                    :gender, :age, :nationality, :married,
                                    :job, :image, :user_id, :bio ,  :position)
  end
end
