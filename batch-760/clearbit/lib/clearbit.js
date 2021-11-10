const authorization = "Bearer sk_893a2b5f004277a5e53c02b151e7706f";

// CALLBACK FUNCTION USED INSIDE THE AJAX REQUEST
// INJECTING THE RESULTS FROM THE API CALL INTO THE HTML
const injectData = (data) => {
  const fullName = document.querySelector("#userName");
  const email = document.querySelector("#userEmail");
  const bio = document.querySelector("#userBio");
  const location = document.querySelector("#userLocation");

  fullName.innerText = data.name.fullName;
  email.innerText = data.email;
  bio.innerText = data.bio;
  location.innerText = data.location;
}

// FUNCTION TO FETCH DATA FROM API
// AND THEN INJECT THAT DATA INTO
// THE HTML THROUGH A CALLBACK
const stalkPerson = (email) => {
  const promise = fetch(`https://person.clearbit.com/v1/people/email/${email}`,
                        { headers: { Authorization: authorization } });
  
  promise.then(response => response.json())
         .then(injectData);
};

// SELECT FORM TO ADD EVENT LISTENER
const form = document.querySelector("#clearbitForm");
// SELECT INPUT BOX
const input = document.querySelector("#clearbitEmail");

// CALLBACK FUNCTION TO INSERT THE PERSON'S DATA INTO THE FIELDS
const insertPerson = (event) => {
  event.preventDefault();
  stalkPerson(input.value);
};

// EVENT LISTENER BOUND TO THE FORM WHEN THE USER SUBMITS AN EMAIL
form.addEventListener('submit', insertPerson);

// YOU MIGHT COME ACROSS THIS SYNTEX AT SOME POINT,
// WHICH DOES EXACTLY THE SAME AS THE ABOVEL:
// form.onsubmit = insertPerson;
