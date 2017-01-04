class DOMNodeCollection {
  constructor(HTMLElements){
    this.nodes = HTMLElements;
  }

  html(str){
    if (str) {
      this.nodes.forEach(function(node){
        node.innerHTML = str;
      });
    } else {
      return this.nodes[0].innerHTML;
    }
  }

  empty(){
    this.nodes.forEach(function(node){
      node.innerHTML = '';
    });
    }

  each(cb){
    this.nodes.forEach((el) => cb(el));
  }

  append(element){
    if (typeof element === 'string'){
      this.nodes.forEach(function(node){
        node.innerHTML += element;
      });
    } else if (element instanceof DOMNodeCollection){
      this.nodes.forEach(function(node){
        node.innerHTML += element.innerHTML;
      });
    }
  }

  attr(attribute, value){
    this.nodes.forEach(function(node) {
      node.setAttribute(attribute, value);
    });
  }

  addClass(className){
    this.nodes.forEach(function(node){
      node.setAttribute('class', className);
    });
  }

  removeClass(className){
    this.nodes.forEach(function(node){
      node.removeAttributes('class', className);
    });
  }

  children(){
    let result = [];
    this.nodes.forEach(function(node){
      result.push(node.children);
    });
    return result;
  }
}

module.exports = DOMNodeCollection;
