import {connect} from 'react-redux';
import {removeTodo} from '../../actions/todo_actions';
import { receiveStep, removeStep } from '../../actions/step_actions';
import StepListItem from './step_list_item';

const mapStateToProps = (state, ownProps) => ({
  step: ownProps.step
});

const mapDispatchToProps = (dispatch) => ({
  receiveStep: (step) => dispatch(receiveStep(step)),
  removeStep: (step) => dispatch(removeStep(step))
});

export default connect(null, mapDispatchToProps)(StepListItem);
