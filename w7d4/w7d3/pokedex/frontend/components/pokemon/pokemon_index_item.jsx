import React from 'react';
import { Link } from 'react-router';

const PokemonIndexItem = ({poke}) => (
  <Link to={`pokemon/${poke.id}`} >
  <li key={poke.id}>
    <div>
      <img src={poke.image_url} />
      <span>{poke.name}</span>
    </div>
  </li>
</Link>
);

export default PokemonIndexItem;
