import React from 'react';

export default ({itemDetails}) => (
  <div className="item-details">
    Name:
    <span>{itemDetails.name}</span>
    Happiness:
    <span>{itemDetails.happiness}</span>
    Price:
    <span>{itemDetails.price}</span>
  </div>
);
