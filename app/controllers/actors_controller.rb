class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      flash[:notice] = "Success"
      redirect_to @actor
    else
      render :new
    end
  end

  def actor_params
    params.require(:actor).permit(:name, :description)
  end
end
