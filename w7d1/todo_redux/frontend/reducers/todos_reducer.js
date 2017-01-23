import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO, UPDATE_TODO } from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  let newState;
  switch(action.type) {
    case RECEIVE_TODOS:
      newState = {};
      // iterating throgh action.todos setting a key value pair for each one in the new state.
      // return the new state
      action.todos.forEach(todo => {
        newState[todo.id] = todo;
      });
      return newState;
    case RECEIVE_TODO:
      // Make a new object setting the a single key value pair for action.todo
      // Return a new state object by merging your previous state and your new object
      newState = {};
      newState[action.todo.id] = action.todo;
      return Object.assign({}, state, newState);
    case REMOVE_TODO:
      newState = Object.assign({}, state);
      delete newState[action.todo.id];
      return newState;
    case UPDATE_TODO:
      newState = Object.assign({}, state);
      newState[action.todo.id] = action.todo;
      return newState;
    default:
      return state;
  }
};

export default todosReducer;
