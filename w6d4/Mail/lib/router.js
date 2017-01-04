class Router {
  constructor(node){
    this.node = node;
  }

  start() {
    this.render();
    document.addEventListener('hashchange', () => this.render());
  }

  render() {
    this.node.innerHTML = '';
    let route = this.activeRoute();
    let content = document.createElement("p");
    content.innerHTML = route;
    this.node.appendChild(content);
  }

  activeRoute(){
    let location = window.location.hash;
    return location.replace('#', '');
  }
}


module.exports = Router;
