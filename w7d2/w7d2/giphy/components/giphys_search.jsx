import React, { Component } from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends Component {
  constructor(props){
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.state = { search: '' };
  }

  handleChange(e) {
    e.preventDefault();
    let newVal = e.target.value;
    this.setState({ search: [newVal]});
  }

  handleSubmit(e){
    e.preventDefault();
    let searchTerm = this.state.search;
    this.props.fetchSearchGiphys(searchTerm);
    this.setState({search: ''});
  }

  render() {
    return (
      <div>
        <label>Search</label>
        <input type='text' value={this.state.search} onChange={this.handleChange}></input><br></br>
        <button onClick={this.handleSubmit}>Submit</button>
          <br />
          <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
