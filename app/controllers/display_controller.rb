class DisplayController < ApplicationController

  def index
    @users = User.all
    @user = params[:uid] ? User.find(params[:uid]) : @users.first

    if @user
      @posts = @user.posts
      @post = params[:pid] ? @posts.find(params[:pid]) : @posts.first
    end
  end

end
