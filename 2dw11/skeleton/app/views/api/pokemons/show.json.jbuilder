json.pokemon do
    json.set! @pokemon.id do 
        json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type, :image_url
    end
end

json.moves do
    @pokemon.moves.each do |move|
        json.set! move.id do 
            json.extract! move, *move.attributes.keys
        end
    end
end

json.items do
    @pokemon.items.each do |item|
        json.set! item.id do 
            json.extract! item, *item.attributes.keys
        end
    end
end


