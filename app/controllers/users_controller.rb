class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :right_user?, only: [:show]
  
  def show
    @user = User.find(params[:id])
  end

  private
  
  def right_user?
    unless User.find(params[:id])==current_user
      flash[:danger] = "Tu ne peux pas consulter cette page profil utilisateur."
      redirect_to root_path
    end 
  end 

end
