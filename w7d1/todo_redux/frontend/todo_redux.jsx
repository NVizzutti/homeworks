import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import { stepsByTodoId } from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  let store = configureStore();
  window.store = store;
  window.stepsByTodoId = stepsByTodoId;
  ReactDOM.render(<Root store={store} />,
    document.getElementById('root'));
});
