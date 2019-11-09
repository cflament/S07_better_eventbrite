# New controller for profile_pictures management
class ProfilePicturesController < ApplicationController
  # callbacks : BEFORE
  before_action :set_user, only[:create]

  # adding a new profile picture
  def create
    if @user.avatar.attach(params[:avatar])
      flash[:success] = "C'est tellement beeeaaauuuu..."
    else
      flash[:danger] = "Tiens, ça n'a pas marché... Essaie encore ?"
    end
    redirect_to(user_path(@user))
  end

  private

  # set_user callback, because callbacks are cool
  def set_user
    @user = User.find(params[:user_id])
  end

end
