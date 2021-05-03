class SessionsController < ApplicationController


  before_action :require_login, only: [:destroy]

  def new
  end

  def create
    @user = User.find_by_credentials(params[:username], params[:password])
    if @user
      log_in!(@user)
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    log_out
    render :new
  end
end
