import React from 'react';
import { withRouter } from 'react-router';
import { Link } from 'react-router';


class PokemonDetail extends React.Component {
  constructor (props) {
    super(props);
  }

  componentDidMount () {
    this.props.requestPokemon(this.props.router.params.id);
  }

  componentWillReceiveProps(newProps) {
    console.log(this.props);
    if(this.props.params.id !== newProps.params.id) {
      this.props.requestPokemon(this.props.router.params.id);
      this.renderMoves();
    }
  }

  renderMoves() {
    if (this.props.pokemonDetails.moves) {
      return (
        <ul className="pokemon-moves">
          {this.props.pokemonDetails.moves.map((move, idx) => <li key={idx}>{move}</li>)}
        </ul>
      );
    } else {
      return null;
    }
  }
  renderItems() {
    if (this.props.pokemonDetails.items) {
      return (
        <div>
          <ul className="pokemon-items">
            {this.props.pokemonDetails.items.map((item, idx) =>
              <Link to={`pokemon/${item.pokemon_id}/item/${idx}`} activeClassName="item-active">
                <li key={idx}>
                  <img src={item.image_url} />
                </li>
              </Link>
              )}
          </ul>
          {this.props.children}
        </div>
      );
    } else {
      return null;
    }
  }

  render () {
    return (
      <div className="pokemon-details">
        <h1>{this.props.pokemonDetails.name}</h1>
        <img src={this.props.pokemonDetails.image_url} />
        <h3>Attack: {this.props.pokemonDetails.attack} | Defense: {this.props.pokemonDetails.defense}</h3>
        {this.renderMoves()}
        {this.renderItems()}
      </div>
    );
  }
}

export default withRouter(PokemonDetail);
