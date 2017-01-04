class Inbox {

  render() {
    let container = document.createElement('ul');
    container.addClass('messages');
    container.innerHTML = 'An Inbox Item';
    return container;
  }
  
}
module.exports = Inbox;
