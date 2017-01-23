import React from 'react';
import Util from '../../util/util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = { title: '', body: '', done: false };

    this.setTitle = this.setTitle.bind(this);
    this.setBody = this.setBody.bind(this);
    this.submitForm = this.submitForm.bind(this);
  }

  setTitle(e) {
    this.setState({ title: e.target.value });
  }

  setBody(e) {
    this.setState({ body: e.target.value });
  }

  submitForm(e) {
    e.preventDefault();
    this.setState({id: Util.uniqueId()}, () => {
      this.props.receiveTodo(this.state);
      this.setState({ title: '', body: '' });
    });
  }

  render() {
    return (
      <form onSubmit={this.submitForm}>
        <label>Title &nbsp;
          <input type='text' value={this.state.title}
            onChange={this.setTitle} />
        </label>
        <br/><br/>
        <label>Body &nbsp;
          <textarea value={this.state.body}
            onChange={this.setBody} />
        </label>
        <br/><br/>
        <button>Add Todo</button>
      </form>
    );
  }
}

export default TodoForm;
