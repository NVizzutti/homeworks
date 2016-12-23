
let MadLib = function(verb, adj, noun){
  let string = "We shall verb the adj noun"
  string = string.replace("verb", verb)
  string = string.replace("adj", adj)
  string = string.replace("noun", noun)
  return string
}
console.log(MadLib("make", "best", "food"))

let isSubString = function(searchString, substr){
  for (let i = 0; i < searchString.length; i++){
    for (let j = i+1; j < searchString.length; j++){
      if (searchString.substr(i, j) === substr) { return true }
    }
  }
  return false;
};

// console.log(isSubString("time to program", "program"))
 console.log(isSubString("time to programs", "program"))

let fizzBuzz = function(array){
  let result = []
  for (i = 0; i < array.length; i ++){
    let num = array[i]
    if ((num % 3 === 0) && (num % 5 !== 0) || (num % 5 === 0) && (num % 3 !== 0)) {
      result.push(num)
    }
  }
  return result
}


 console.log(fizzBuzz([1, 3, 5, 9, 15]))

let isPrime = function(num){
  for (let i = 2; i < num; i++) {
    if (num % i == 0) { return false }
  }
  return true
}

// console.log(isPrime(13))


let sumOfNPrimes = function(n){
	debugger;
  let primes = [];
  let sum = 0;
  if (n === 0) { return 0 } ;
  let i = 2;
  while (primes.length < n){
    if (isPrime(i)) { primes.push(i) }
    i++
  };
  for (let i in primes) { sum += primes[i]; }
  return sum;
}


// console.log(sumOfNPrimes(3))


let allOrNothing = function(){
  for (let i = 1; i < arguments.length; i++) {
    if (arguments[i] % arguments[0] === 0) { return true }
  }
  return false
}


// console.log(allOrNothing(3, 4, 7, 10, 13))
