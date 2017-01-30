import React, { Component } from 'react';

const GiphyIndexItems = (props) => {
    const giphys = props;
    return (
    <ul>
      {giphys.map((img, idx) => <li key={idx}>
      <img src={img.images.fixed_height.url}></img>
      </li>)}
    </ul> );
  };



class GiphysIndex extends Component {

  render() {
    return (
      <div>
        <ul>
           {GiphyIndexItems(this.props.giphys)}
        </ul>
      </div>
    );
  }
}

export default GiphysIndex;
