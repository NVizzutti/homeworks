import { valuesIn } from 'lodash';

export const selectAllPokemon = ({ pokemon }) => {
  return valuesIn(pokemon);
};
