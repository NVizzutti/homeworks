
function titleize(namesArr, cb){
  let result = namesArr.map(name => `Hello, ${name}`);
  cb(result);
}

titleize(['Nick', "jon", "james"], function(nameList){
  nameList.forEach(name => console.log(name))
});

function Elephant(name, height, tricks) {
  this.name = name;
  this.height =  height;
  this.tricks =  tricks

}

//
// Elephant.prototype.trumpet = function () {
//   console.log(`ASDASDASDSAD ${this.name}`)
// };
// Elephant.prototype.grow = function () {
//   this.height += 1
// };
function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height += 1
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing varters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

var herd = [ellie, charlie, kate, micah];


let bfastOrder = function dinerBreakfast(){
  let original = "eggs";

  return function(food){
    order = `${original.substr(0, 7)} and ${food}.`
    console.log(order)
  }
}

let original = bfastOrder()
original("bacon")

let ernest = new Elephant("ernest", "corgi mix")
console.log(ernest.__proto__)
console.log(Elephant.prototype)
