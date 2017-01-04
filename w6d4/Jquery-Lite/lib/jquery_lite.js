/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const DOMNodeCollection = __webpack_require__(1);

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


/***/ },
/* 1 */
/***/ function(module, exports) {

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


/***/ }
/******/ ]);