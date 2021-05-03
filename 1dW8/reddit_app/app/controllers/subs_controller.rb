class SubsController < ApplicationController
  def index
    @subs = Sub.all

    render :index
  end

  def show
    @sub = Sub.find_by(id: )
  end

  def new
  end

  def create
  end


  def edit
  end

  def update
  end

end
