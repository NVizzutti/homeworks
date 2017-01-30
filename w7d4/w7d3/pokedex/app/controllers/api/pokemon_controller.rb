class Api::PokemonController < Api::ApiController
  def index
    @pokemons = Pokemon.all
  end

  def create
    @pokemon = Pokemon.new(poke_params)
    if @pokemon.save
      render :show
    else
      render json: @pokemon.errors.full_messages, status: 422
    end
  end

  def show
    @pokemon = Pokemon.includes(:items).find(params[:id])
  end

  private
  def poke_params
    params.permit(:name, :attack, :defense, :image_url, :moves, :poke_type)
  end
end
