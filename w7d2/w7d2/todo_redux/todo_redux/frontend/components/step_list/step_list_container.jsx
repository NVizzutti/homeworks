import {connect} from 'react-redux';
import StepList from './step_list';
import { receiveStep, removeStep, fetchSteps, createStep } from '../../actions/step_actions';
import { stepsByTodoId } from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => ({
  steps: stepsByTodoId(state, ownProps.todo_id),
  todo_id: ownProps.todo_id
});

const mapDispatchToProps = dispatch => ({
  receiveStep: step => dispatch(receiveStep(step)),
  fetchSteps: () => dispatch(fetchSteps()),
  createStep: step => dispatch(createStep(step))
});

export default connect(mapStateToProps, mapDispatchToProps)(StepList);
