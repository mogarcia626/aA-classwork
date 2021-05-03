class UsersController < ApplicationController
  
  before_action :require_login, only: [:edit, :update, :show, :destroy]
  
  def index
    @users = User.all
    render :index
  end
  
  def show
    @user = User.find_by(id: params[:id])
    render :show
  end
    
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  # def edit
  #   @user = User.find_by(id: params[:id])
  #   render :edit
  # end
  
  # def update
  #   @user = User.find_by(id: params[:id])
  
  #   if current_user == @user && @user.update(user_params) 
  #     render :show
  #   else
  #     flash.now[:errors] = ["Update not successful"]
  #     render :edit
  #   end
  # end

  # def destroy
  #   @user = User.find_by(id: params[:id])
  
  #   if current_user == @user
  #     @user.destroy
  #     redirect_to new_session_url
  #   else
  #     flash.now[:errors] = ["Deletion Failed"]
  #     render :show
  #   end
  # end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
