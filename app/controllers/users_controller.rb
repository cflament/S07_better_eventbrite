class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :right_user?, only: [:show, :edit, :update]
  
  def show
    @user = page_user
  end

  def edit
    @user = page_user
  end 

  def update
    @user = page_user
    puts user_params

    if @user.update(user_params)
      flash[:success] = "Tes infos ont bien été modifiées"
    else
      flash[:danger] = "Tes modifs n'ont pas pu être passées"
    end 
    redirect_to user_path(@user.id)
  end

  private

  def page_user
    User.find(params[:id])
  end 

  def right_user?
    unless page_user==current_user
      flash[:danger] = "Tu ne peux pas consulter cette page profil utilisateur."
      redirect_to root_path
    end 
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end


end
