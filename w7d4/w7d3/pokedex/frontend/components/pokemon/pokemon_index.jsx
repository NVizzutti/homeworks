import React, { Component } from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends Component {
  constructor(props) {
    super(props);
    this.state = {
      width: 200,
      height: 200,
      dir: 1
    };

  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }


  render() {
    const pokemonItems = this.props.pokemon.map(poke => <PokemonIndexItem key={poke.id} poke={poke} />);

    return (
      <div className="pokemons">
        <ul className="pokemon-index">
          {pokemonItems}
        </ul>
        {this.props.children}
      </div>
    );
  }
}


export default PokemonIndex;
