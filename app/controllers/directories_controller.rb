class DirectoriesController < ApplicationController
  def create
    @directory = Directory.new directory_params
    @profile = Profile.find params[:profile_id]
    @directory.profile = @profile
    @directory.user = current_user
    if @directory.save
      redirect_to profile_path(@profile), notice: "file uploaded"
    else
      render "/profiles/show", alert: "can't upload"
    end
  end
  def edit
    @profile = Profile.find params[:profile_id]
    @directory = Directory.find params[:id]
  end
  def update
    @directory = Directory.find params[:id]
    @profile = Profile.find params[:profile_id]
    if @directory.update directory_params
      redirect_to profile_path(@profile), notice:"directory is updated"
    else
      render "profiles/show"
    end
  end
  def destroy
    @profile = Profile.find params[:profile_id]
    @directory = Directory.find params[:id]
    @directory.destroy
    redirect_to profile_path(@profile), notice: "deleted file"
  end
  private

  def directory_params
    params.require(:directory).permit(:file)
  end
end
