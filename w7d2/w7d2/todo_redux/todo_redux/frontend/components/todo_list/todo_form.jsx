import React from 'react';
import Util from '../../util/util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = { title: '', body: '', done: false, tag_names: [] };

    this.setTitle = this.setTitle.bind(this);
    this.setBody = this.setBody.bind(this);
    this.submitForm = this.submitForm.bind(this);
    this.addTag = this.addTag.bind(this);
  }

  setTitle(e) {
    this.setState({ title: e.target.value });
  }

  setBody(e) {
    this.setState({ body: e.target.value });
  }

  addTag() {
    const tag_names = this.state.tag_names.slice();
    tag_names.push(this.refs.tag_name.value);
    this.setState({ tag_names }, () => {
      this.refs.tag_name.value = '';
    });
  }

  submitForm(e) {
    e.preventDefault();
    this.props.createTodo(this.state).then(() => {
      this.setState({ title: '', body: '', tag_names: [] });
    });
  }

  render() {
    const errorContent = this.props.errors.map((error, idx) =>
      <li key={idx}>{error}</li>);

    const tagContent = this.state.tag_names.map((tag, idx) =>
      <li key={idx}>{tag}</li>);

    return (
      <div>
        <ul>
          {errorContent}
        </ul>
        <form onSubmit={this.submitForm}>
          <ul>
            {tagContent}
          </ul>
          <label>Tag &nbsp;
            <input type='text' ref='tag_name' />
            <button type='button' onClick={this.addTag}>Add Tag</button>
          </label>
          <br/><br/>
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
      </div>
    );
  }
}

export default TodoForm;
