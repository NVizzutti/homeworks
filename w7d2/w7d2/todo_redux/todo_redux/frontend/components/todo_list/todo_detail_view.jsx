import React from 'react';
import StepListContainer from '../step_list/step_list_container';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
    this.deleteItem = this.deleteItem.bind(this);
  }
  deleteItem(e) {
    e.preventDefault();
    this.props.deleteTodo(this.props.todo);
  }

  render() {
    const displayTags = this.props.todo.tags.map((tag, idx) => <li key={idx}>{tag.name}</li>);
    const todo = this.props.todo;
    return (
      <div>
        <ul>{displayTags}</ul>
        <p>{todo.body}</p>
        <StepListContainer todo_id={todo.id} />
        <button onClick={this.deleteItem}>Delete Item</button>
      </div>
    );
  }
}

export default TodoDetailView;
