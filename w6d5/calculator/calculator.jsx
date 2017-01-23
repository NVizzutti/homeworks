import React from 'react';

class Calculator extends React.Component {
  constructor(props){
    super(props);
    this.state = {num1: 0, num2: 0, sum: 0};
    this.add = this.add.bind(this);
    this.changeNum1 = this.changeNum1.bind(this);
    this.changeNum2 = this.changeNum2.bind(this);
  }

  changeNum1(e){
    const num1 = e.target.value ? parseInt(e.target.value): '';
    this.setState({ num1 });
  }

  changeNum2(e){
    const num2 = e.target.value ? parseInt(e.target.value): '';
    this.setState({ num2 });
  }

  add(e){
    e.preventDefault();
    const sum = this.state.num1 + this.state.num2;
    this.setState({ sum });
  }

  render() {
    return (
      <div>
        <input type='text' value={this.state.num1} onChange={this.changeNum1}></input><br></br>
        <input type='text' value={this.state.num2} onChange={this.changeNum2}></input>
        <button onClick={this.add}>Add Nums</button>
        <p>{this.state.sum}</p>
      </div>
    );
  }
}

export default Calculator;
