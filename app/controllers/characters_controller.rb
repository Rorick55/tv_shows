class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
    @television_show = TelevisionShow.find(params[:television_show_id])
  end

  def destroy
    @character = Character.find(params[:id])
    if @character.destroy
      flash[:notice] = "character was deleted"
      redirect_to characters_path
    else
      flash[:notice] = "character was not deleted"
      redirect_to @character
    end
  end

  def create
      @television_show = TelevisionShow.find(params[:television_show_id])
      @actor = Actor.where(name: character_params[:actor_name])

      @character = Character.new(character_params)
      @character.television_show_id = @television_show.id
      if !@actor.empty?
        @character.actor_id = @actor.first.id
      end
        if @character.save
          flash[:notice] = "Success"
          redirect_to @television_show
        else
          render :new
        end
  end

  def character_params
    params.require(:character).permit(:character_name, :actor_name, :description)
  end
end
