import React from 'react';
import Util from '../../util/util';

class StepForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { title: '', body: '', done: false,
      todoId: this.props.todoId};

    this.submitForm = this.submitForm.bind(this);
    this.handleInputChange = this.handleInputChange.bind(this);
  }

  submitForm(e) {
    e.preventDefault();
    this.setState({ id: Util.uniqueId() }, () => {
      this.props.receiveStep(this.state);
      this.setState({ title: '', body: '' });
    });
  }

  handleInputChange(input, e) {
    const newState = Object.assign({}, this.state);
    newState[input] = e.target.value;
    this.setState(newState);
  }

  render() {
    return (
      <form onSubmit={this.submitForm}>
        <input type='text' value={this.state.title}
          onChange={this.handleInputChange.bind(null, 'title')} />
        <textarea value={this.state.body}
          onChange={this.handleInputChange.bind(null, 'body')}/>
        <button>Add Step</button>
      </form>
    );
  }
}

export default StepForm;
