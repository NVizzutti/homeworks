import React from 'react';
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';

class StepList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <ul>
          {this.props.steps.map((step) =>
            (<StepListItemContainer key={step.id} step={step} />) )}
        </ul>
        <StepForm receiveStep={this.props.receiveStep}
          todoId={this.props.todoId} />
      </div>
    );
  }
}

export default StepList;
