class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def followings
    @user = User.find(params[:id])
    @user_followings = @user.followings
  end
  
  def followers
    @user = User.find(params[:id])
    @user_followers = @user.followers
  end

end
