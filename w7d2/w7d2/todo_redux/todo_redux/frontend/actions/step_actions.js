export const RECEIVE_STEP = "RECEIVE_STEP";
export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const REMOVE_STEP = "REMOVE_STEP";
import * as APIUtil from '../util/step_api_util';

export const receiveSteps = steps => ({
  type: RECEIVE_STEPS,
  steps
});

export const receiveStep = step => ({
  type: RECEIVE_STEP,
  step
});

export const removeStep = step => ({
  type: REMOVE_STEP,
  step
});

export const createStep = step => dispatch => (
  APIUtil.createStep(step).then(res => dispatch(receiveStep(res)))
);

export const fetchSteps = () => dispatch => (
  APIUtil.fetchSteps().then(res => dispatch(receiveSteps(res)))
);
