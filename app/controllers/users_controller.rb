class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    @user.save
    redirect_to user_path(@user)
  end

  def update
     @user = User.find(params[:id])

     if @user.update(user_params)
      redirect_to @user
     else
      render 'edit'
     end
  end

  def show
    @all_shows = Show.all
    @user = User.find(params[:id])
    @shows = @user.shows
    p "#" *88
    p @user
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :timezone)
    end
end
