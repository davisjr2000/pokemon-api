json.array! @pokemons do |pokemon|
  json.extract! pokemon, :id, :name, :description
end
