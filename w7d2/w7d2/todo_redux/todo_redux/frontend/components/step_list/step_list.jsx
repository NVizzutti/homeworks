import React from 'react';
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';

class StepList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchSteps();
  }

  render() {
    return (
      <div>
        <ul>
          {this.props.steps.map((step) =>
            (<StepListItemContainer key={step.id} step={step} />) )}
        </ul>
        <StepForm createStep={this.props.createStep}
          todo_id={this.props.todo_id} />
      </div>
    );
  }
}

export default StepList;
