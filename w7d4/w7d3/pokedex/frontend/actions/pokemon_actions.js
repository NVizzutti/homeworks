import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_POKEMON = "RECEIVE_POKEMON";
export const CREATE_POKEMON = 'CREATE_POKEMON';

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receivePokemon = (poke) => ({
  type: RECEIVE_POKEMON,
  poke
});

export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon().then(
    pokemon => dispatch(receiveAllPokemon(pokemon)),
    console.log
  );
};


export const requestPokemon = (id) => (dispatch) => {
  return APIUtil.fetchPokemon(id).then(
    poke => dispatch(receivePokemon(poke)),
    console.log
  );
};

export const createPokemon = (poke) => (dispatch) => {
  return APIUtil.createPokemon(poke).then(
    newPoke => {
      dispatch(receivePokemon(newPoke));
      return newPoke;
    },
    console.log
  );
};
