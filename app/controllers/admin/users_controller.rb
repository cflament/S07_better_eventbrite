class Admin::UsersController < Admin::BaseController
  

  def index
    @users = User.all.sort
  end
end
