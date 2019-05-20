class Api::V1::PokemonsController < Api::V1::BaseController

  before_action :set_pokemon, only: [ :show ]

  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def pokemon_params
    params.permit(:name, :description)
  end

  def render_error
    render json: { errors: @pokemon.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
