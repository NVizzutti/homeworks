import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';


const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_POKEMON:
      return merge(
        {},
        state,
        {
          [action.poke.id]: {
            id: action.poke.id,
            image_url: action.poke.image_url,
            name: action.poke.name
          }
        }
      );
    default:
      return state;
  }
};

export default pokemonReducer;
