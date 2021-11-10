// GET REQUEST WITH FETCH

// SELECT THE LIST ELEMENT
const results = document.querySelector("#results");
const form = document.querySelector("#search-movies");


const searchMovie = (query) => {
  // FETCH THE INFORMATION FROM THE API
  const promise = fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`);
  // THEN PARSE THE PROMISE INTO JSON
  // THEN PERFORM ACTION ON THE RETURNED OBJECT
  promise.then(response => response.json())
         .then((data) => {
            // GET THE ARRAY OF MOVIES
            const movies = data.Search;
            // ITERATE OVER MOVIES
            movies.forEach((movie) => {
              //CREATE A LIST TIME HTML ELEMENT WITH INFORMATION OF THE MOVIE
              const item = `<li class="list-inline-item">
                              <img src="${movie.Poster}">
                              <p>${movie.Title}</p>
                            </li>`
              // INSERT LIST ITEM INSIDE THE UNORDERED LIST
              results.insertAdjacentHTML('beforeend', item);
            })
         })
}

// SELECT INPUT
const input = document.querySelector("#keyword");

// CALLBACK FUNCTION THAT CALLS THE searchMovie FUNCTION
// WITH THE VALUE FROM THE INPUT
const insertMovies = (event) => {
  event.preventDefault();
  results.innerHTML = "";
  searchMovie(input.value);
};

// EVENT LISTENER TO INSERT MOVIES FROM THE FORM
form.addEventListener('submit', insertMovies);

// DEFAULT MOVIES THAT SHOULD BE SEEN ON THE BROWSER ON LOAD
searchMovie("harry potter");

// POST REQUEST WITH FETCH

// SELECT INPUT ELEMENT
const input2 = document.querySelector("#search");

// CALLBACK FUNCTION TO ACCESS ALGOLIA API
const searchAlgoliaPlaces = (event) => {
  // THE FETCH FUNCTION CAN RECEIVE A SECOND ARGUMENT
  // WHICH IS AN OBJECT SPECIFYING THE METHOD AND THE 
  // BODY OF THE REQUEST
  fetch("https://places-dsn.algolia.net/1/places/query", {
    method: "POST",
    body: JSON.stringify({ query: event.currentTarget.value })
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data.hits); // Look at local_names.default
    });
};

input2.addEventListener("keyup", searchAlgoliaPlaces);