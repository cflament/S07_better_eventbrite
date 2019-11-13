# New controller for profile_pictures management
class ProfilePicturesController < ApplicationController
  # callbacks : BEFORE
  before_action :set_user, only: [:create, :destroy]

  # adding a new profile picture
  def create
    @user.profile_picture.attach(params[:profile_picture])
    if @user.profile_picture.attached?
      flash[:success] = "C'est tellement beeeaaauuuu..."
    else
      flash[:danger] = "Tiens, ça n'a pas marché... Essaie encore ?"
    end
    redirect_to(user_path(@user))
  end

  # removing profile picture
  def destroy
    @user.profile_picture.purge
    flash[:warning] = 'Photo de profil supprimée'
    redirect_to @user
  end

  private

  # set_user callback, because callbacks are cool
  def set_user
    @user = User.find(params[:user_id])
  end

end
