import { valuesIn } from 'lodash';

export const selectAllPokemon = ({ pokemon }) => {
  return valuesIn(pokemon);
};

export const selectItem = ({ pokemonDetails: { items } }, id) => (
  items[id]
);
