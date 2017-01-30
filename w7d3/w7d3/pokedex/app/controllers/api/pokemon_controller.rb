class Api::PokemonController < Api::ApiController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.includes(:items).find(params[:id])
  end
end
