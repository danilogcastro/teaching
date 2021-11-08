// MODERN JS: ARROW FUNCTIONS
const square = (x) => {
  return x * x;
};

// WITH IMPLICIT RETURN
// ONLY WORKS WHEN BLOCK HAS ONE LINE
// const square = x => x * x;

// console.log(square(2));

const capitalize = (word) => {
  const firstLetter = word[0].toUpperCase();
  const rest = word.substring(1).toLowerCase();
  return firstLetter + rest;
  // return `${firstLetter}${rest}`
};

console.log(capitalize('gabRiEl'));