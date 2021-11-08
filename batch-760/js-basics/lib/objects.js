// CREATE AN OBJECT
const student = {
  firstName: "Gabriel",
  lastName: "Guerra"
};

console.log(student['firstName']);

// ACCESS A VALUE FROM A KEY - PREFERRED WAY
console.log(student.lastName);

// REASSIGN VALUES
student.firstName = 'Lorran';
student.lastName = 'Monteiro';

// CREATE A NEW KEY-VALUE PAIR
student.middleName = 'Cruz';

console.log(student);