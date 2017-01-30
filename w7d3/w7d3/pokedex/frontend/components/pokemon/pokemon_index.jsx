import React, { Component } from 'react';

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
    this._tick();

  }

  _tick () {
    if (this.state.dir === 1) {
      this.setState({
        width: this.state.width + 10,
        height: this.state.height + 10
      });
    } else {
      this.setState({
        width: this.state.width - 10,
        height: this.state.height - 10
      });
    }

    if (this.state.width > 300) {
      this.setState({
        dir: -1
      });
    } else if (this.state.width === 200) {
      this.setState({
        dir: 1
      });
    }


    // setTimeout(this._tick.bind(this));
  }

  render() {
    return (
      <ul>
        {this.props.pokemon.map((poke, idx) => <li key={idx}>{poke.name}<br />
      <marquee><img src={poke.image_url} width={this.state.width} height={this.state.height}/></ marquee>
        </li>)}
      </ul>
    );
  }
}


export default PokemonIndex;
