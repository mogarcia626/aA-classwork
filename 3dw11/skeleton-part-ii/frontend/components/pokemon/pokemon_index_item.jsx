import React from 'react';

class PokemonIndexItem extends React.Component {
    constructor(props) {
        super(props);
        this.pokemon = this.props.pokemon
    }

    render() {
        return (
            <li className="pokemon-index-item">
                <span>{this.pokemon.id}</span>
                <img src={this.pokemon.imageUrl}/>
                <span>{this.pokemon.name}</span>
            </li>
        )
    }
}



export default PokemonIndexItem;