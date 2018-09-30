class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @your_posts = current_user.posts.page params[:page]
    @liked_posts = current_user.fav_posts.page params[:page]
  end

  private 
    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end
