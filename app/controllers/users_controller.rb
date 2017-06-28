class UsersController < ApplicationController
  # def new
  # end
  #
  # def create
  #   @user = User.new user_params
  #   if @user.save
  #     session[:user_id] = @user
  #     redirect_to dashboard_path
  #   else
  #     render new_user_registration_path
  #   end
  # end
  def update
    @profile = Profile.find(params[:id])
    @user = @profile.user
    if @user.update user_params
      flash[:notice] = "changed user role"
      redirect_to profile_path(@profile)
    else
      render profile_path(@profile)
    end
  end


  private
  def user_params
    params.require(:user).permit(:role)
  end
end
