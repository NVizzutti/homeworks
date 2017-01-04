import { createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';
import {applyMiddleware} from 'redux';

const loggingMiddleware = (store) => (next) => (action) => {
  console.log('old state', store.getState());
  console.log('action', action);
  let result = next(action);
  console.log('new state', store.getState());
  return result;
};

const configureStore = (preloadedState = {}) => {
  const store = createStore(RootReducer, preloadedState, applyMiddleware(loggingMiddleware));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
