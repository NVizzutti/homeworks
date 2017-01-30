import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import { stepsByTodoId } from './reducers/selectors';
import {fetchTodos} from './actions/todo_actions';
window.fetchTodos = fetchTodos;

document.addEventListener('DOMContentLoaded', () => {
  let store = configureStore();
  window.store = store;
  window.stepsByTodoId = stepsByTodoId;
  ReactDOM.render(<Root store={store} />,
    document.getElementById('content'));
});
