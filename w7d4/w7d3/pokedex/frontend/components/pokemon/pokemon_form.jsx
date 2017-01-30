import React from 'react';
import { withRouter } from 'react-router';

class PokemonForm extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      name: '',
      image_url: '',
      attack: '',
      defense: '',
      move1: '',
      move2: '',
      moves: [],
      poke_type: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    // this.handleChange = this.handleChange.bind(this);
  }

  handleChange(name, e) {
    this.setState({ [name]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    let newPoke = Object.assign(
      {},
      this.state,
      {
        moves: [this.state.move1, this.state.move2]
      }
    );
    this.props.createPokemon(newPoke).then((brandNewPoke) => {
      this.props.router.push(`pokemon/${brandNewPoke.id}`);
    });
  }

  render() {
    return(
      <div className='pokemon-create'>
        <form onSubmit={this.handleSubmit}>
          <label>Name
            <input type='text' onChange={this.handleChange.bind(this, "name")} />
          </label>
          <label>Image Url
            <input type='text' onChange={this.handleChange.bind(this, "image_url")} />
          </label>
          <label>Type
            <select value={this.state.poke_type} onChange={this.handleChange.bind(this, "poke_type")}>
              <option value="" disabled>Select Type</option>
              <option value="bug">bug</option>
              <option value="bug">dragon</option>
            </select>
          </label>
          <label>Attack
            <input type='text' onChange={this.handleChange.bind(this, "attack")} />
          </label>
          <label>Defense
            <input type='text' onChange={this.handleChange.bind(this, "defense")} />
          </label>
          <label>Move 1
            <input type='text' onChange={this.handleChange.bind(this, "move1")} />
          </label>
          <label>Move 2
            <input type='text' onChange={this.handleChange.bind(this, "move2")} />
          </label>
          <button type='submit'>Create poke!</button>
        </form>
      </div>
    );
  }
}

export default withRouter(PokemonForm);
