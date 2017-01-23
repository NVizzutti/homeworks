import {connect} from 'react-redux';
import TodoDetailView from './todo_detail_view';
import {removeTodo} from '../../actions/todo_actions';
import { receiveSteps } from '../../actions/step_actions';



const mapDispatchToProps = dispatch => ({
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  receiveSteps: steps => dispatch(receiveSteps(steps))
});
const mapStateToProps = (state, ownProps) => ({
  todo: ownProps.todo
});
export default connect(mapStateToProps, mapDispatchToProps)(TodoDetailView);
