import React from 'react';
import ReactDOM from 'react-dom';
import {requestAllPokemon} from './actions/pokemon_actions';
import configureStore from './store/store';
import Root from './components/root';
import { selectAllPokemon } from './reducers/selectors.js';


window.selectAllPokemon = selectAllPokemon;
window.requestAllPokemon = requestAllPokemon;

$(() => {
  const store = configureStore();
  window.store = store;
  const roolEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, roolEl);
});
