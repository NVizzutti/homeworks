import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';
import configureStore from '../store/store';


const store = configureStore();

const Root = () => (
  <Provider store={store}>
    <GiphysSearchContainer />
  </Provider>
);

export default Root;
