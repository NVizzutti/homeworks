const RyanHall = {
  name: "Ryan Hall",

  greet () {
    console.log(`Hi, I'm ${this.name}, how can I help you?`)
  }
};

const Dumbo = {
  name: "Dumbo",

  greet () {
    console.log(`phHRRRRRRR my name is ${this.name}.`);
  }
};


Dumbo.greet.call(RyanHall)
