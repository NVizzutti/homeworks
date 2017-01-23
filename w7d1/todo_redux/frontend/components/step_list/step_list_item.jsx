import React from 'react';

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { detail: false };

    this.deleteStep = this.deleteStep.bind(this);
    this.toggleDetail = this.toggleDetail.bind(this);
  }

  deleteStep(e) {
    e.preventDefault();
    this.props.removeStep(this.props.step);
  }

  toggleDetail() {
    this.setState({ detail: !this.state.detail });
  }

  render() {
    let content;
    if (this.state.detail) {
      content = (
        <div>
          <p>{this.props.step.body}</p>
          <button onClick={this.deleteStep}>Remove Step</button>
        </div>
      );
    }

    return (
      <li>
        <p onClick={this.toggleDetail}>{this.props.step.title}</p>
        {content}
      </li>
    );
  }
}

export default StepListItem;
