class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    users = User.all
    render json: users
  end

  def create
    # render json: params
    user = User.new(params.require(:user).permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end