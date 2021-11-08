// CREATE
const fruits = [];

// ADD AN ITEM
fruits.push('Apple');
fruits.push('Banana');
fruits.push('Watermelon');
fruits.push('Strawberry');
fruits.push('Pear');

console.log(fruits);

// READ SPECIFIC ITEM
console.log(fruits[1]);

// UPDATE AN ITEM
fruits[1] = 'Orange';

console.log(fruits);

// REMOVE AN ITEM
// FIRST ARGUMENT: STARTING INDEX
// SECOND ARGUMENT: HOW MANY ITEMS TO REMOVE
fruits.splice(2, 1);

console.log(fruits);

// REMOVES LAST ITEM
fruits.pop();
// REMOVES FIRST ITEM
fruits.shift();

console.log(fruits);

// LOOPS OVER ARRAY
fruits.forEach((fruit) => {
  console.log(fruit.toUpperCase());
});