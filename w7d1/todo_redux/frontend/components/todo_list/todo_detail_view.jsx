import React from 'react';
import StepListContainer from '../step_list/step_list_container';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
    this.deleteItem = this.deleteItem.bind(this);
  }
  deleteItem(e) {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  render() {
    const todo = this.props.todo;
    return (
      <div>
        <p>{todo.body}</p>
        <StepListContainer todoId={todo.id} />
        <button onClick={this.deleteItem}>Delete Item</button>
      </div>
    );
  }
}

export default TodoDetailView;
