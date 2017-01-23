import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from
  '../actions/step_actions';

const initialState = {
  1: { // this is the step with id = 1
    id: 1,
    title: "walk to store",
    done: false,
    body: "Take the car",
    todoId: 2
  },
  2: { // this is the step with id = 2
    id: 2,
    title: "buy soap",
    body: "Use a credit card",
    done: false,
    todoId: 1
  }
};

const stepsReducer = (state = initialState, action) => {
  let newState = {};
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_STEP:
      newState = Object.assign({}, state);
      newState[action.step.id] = action.step;
      return newState;
    case RECEIVE_STEPS:
      return Object.assign({}, action.steps);
    case REMOVE_STEP:
      newState = Object.assign({}, state);
      delete newState[action.step.id];
      return newState;
    default:
      return state;
  }
};

export default stepsReducer;
