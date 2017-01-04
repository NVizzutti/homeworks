const Router = require('./router');

document.addEventListener("DOMContentLoaded", function() {
    $('.sidebar').on('click', 'li', function(){
        let location = this.innerText.toLowerCase();
        window.location.hash = location;
        let contentNode = document.querySelector('content');
        let router = new Router(contentNode);
        router.start();
    });
  });
