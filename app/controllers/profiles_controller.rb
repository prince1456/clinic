class ProfilesController < ApplicationController
  before_action :find_params, only: [:edit, :show, :update, :destory]
  before_action :authenticate_user!, only: [:create, :new, :update, :destroy, :show]
  def index
    if params[:search].present?
      @profiles = Profile.search_profiles(params[:search]).paginate(page: params[:page], :per_page => 5)
    else
      @profiles = Profile.all.paginate(page: params[:page], :per_page => 5)
    end
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
    @user = User.find(params[:id])
  end

  def edit
    redirect_to root_path, alert: "access defined" unless can? :edit, @profile
  end
  def update
    redirect_to root_path, alert: "access defined" unless can? :update, @profile
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
                                    :job, :image, :user_id, :bio , :position, :lang, :first_name_arabic, :last_name_arabic, :position_arabic, :bio_arabic)
  end
end
