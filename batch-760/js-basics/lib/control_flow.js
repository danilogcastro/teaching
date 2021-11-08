const age = 20;

// IF/ELSE

if (age >= 18) {
  console.log("You can vote");
} else {
  console.log("You cannot vote");
};

const grade = 75;

// WITH ELSE IF BLOCK

if (grade > 90) {
  console.log('A');
} else if (grade > 80) {
  console.log('B');
} else {
  console.log('C');
}

// SWITCH OPERATOR

const num = 6;

switch (num) {
  case 1:
    console.log("number one");
    break;
  case 2:
    console.log("number two");
    break;
  case 3:
    console.log("number three");
    break;
  default:
    console.log('none of the above');
}