class UsersController < Clearance::UsersController

  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
    @shouts =  @user.shouts
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
