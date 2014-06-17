class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end
  def new
    @character = Character.new
    @television_show = TelevisionShow.find(params[:television_show_id])
  end

  def create
    @television_show = TelevisionShow.find(params[:television_show_id])
    if Character.where(character_params).empty?
      @character = Character.new(character_params)
      @character.television_show_id = @television_show.id
        if @character.save
          flash[:notice] = "Success"
          redirect_to @television_show
        else
          flash[:notice] = "can't be blank"
          redirect_to @television_show
        end
    else
      flash[:notice] = 'has already been taken'
      redirect_to @television_show
    end
  end

  def character_params
    params.require(:character).permit(:character_name, :actor_name, :description)
  end
end
