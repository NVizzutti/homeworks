const DOMNodeCollection = require('./dom_node_collection.js');

window.$l = function(arg){
  let nodeList = document.querySelectorAll(arg);
  let nodeArray = Array.from(nodeList);
  // return nodeArray;
  if (arg instanceof HTMLElement) {
    return (new DOMNodeCollection([arg]));
  } else if (typeof arg === 'string') {
    let elements = document.querySelectorAll(arg);
    return (new DOMNodeCollection(elements));
  }
};
