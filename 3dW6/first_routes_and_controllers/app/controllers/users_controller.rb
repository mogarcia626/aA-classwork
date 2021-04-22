class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    users = User.all
    render json: users
  end

  def create
    render json: params
    users = User.new(params.require(:user).permit(:name, :email))
    users.save!
    render json: users
  end

  def show
    render json: params
  end

  


end