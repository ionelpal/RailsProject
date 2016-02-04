class ProfilesController < ApplicationController
  before_filter :authenticate_user!
before_filter :ensure_admin, :only => [:destroy]

  def ensure_admin
  unless current_user && current_user.admin?
  render:text => "Access Error", :status => :unauthorized
  end
  end 

  respond_to :html

  def myprofile
     profile = Profile.find_by_user_id(current_user.id)
     
    if profile.nil?
      redirect_to "/profiles/new"
    else
      @user = User.find(current_user.id)
      @profile = Profile.find_by_user_id(@user.id)
      redirect_to "/items"
    end
  end

  
  def index
    @profiles = Profile.all
    respond_with(@profiles)
  end

  def show
    respond_with(@profile)
  end

  def new
    @user = User.find(current_user.id)
  @profile = Profile.new
    @profile.user_id = @user.id
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:firstname, :lastname, :address, :mobile, :user_id)
    end
end
