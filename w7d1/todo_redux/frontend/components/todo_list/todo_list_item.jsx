import React from 'react';
import TodoDetailViewContainer from './todo_detail_view_container';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { detail: false };
    this.reverseState = this.reverseState.bind(this);
    this.toggleDetail = this.toggleDetail.bind(this);
  }
  reverseState(e) {
    e.preventDefault();
    this.props.todo.done = !this.props.todo.done;
    this.props.updateTodo(this.props.todo);
  }

  toggleDetail() {
    this.setState({ detail: !this.state.detail });
  }

  render() {
    // debugger;
    const detail = this.state.detail ?
      (<TodoDetailViewContainer todo={this.props.todo} />) : '';
    return (
      <li>
        <p onClick={this.toggleDetail}>{this.props.todo.title}</p>
        &nbsp;<button onClick={this.reverseState}>{this.props.todo.done ? 'Undo' : 'Done'}</button>
        {detail}
      </li>
    );
  }
}

export default TodoListItem;
