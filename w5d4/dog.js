function Cat () {
   this.name = 'Markov';
   this.age = 3;
 }

 function Dog () {
   this.name = 'Noodles';
   this.age = 4;
 }

 Dog.prototype.chase = function (cat) {
   console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof! ${arguments[1]}`)
 };

 const Markov = new Cat ();
 const Noodles = new Dog ();

Markov.checkAge = function(){
  console.log(this.age)
}
// Noodles.chase(Markov);
Noodles.chase.apply(Noodles, [Markov, "WHOA", 6, 4]);
Markov.checkAge()
