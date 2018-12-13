var nextCounter = 0;
var previousCounter = 0;
var nextId = 1;
var previousId;

$(() => {
		listenerNextCarClick()
		listenerPreviousCarClick()
})
var numberOfCarsObject;

function listenerNextCarClick () {
    $("#js-next").on('click', function (event) {
			event.preventDefault();
			console.log("nextCounter" + " " +  nextCounter);
			console.log("nextId" + " " + nextId);
			if (nextId < 4) {
				if (nextCounter === 0) {
						nextId = parseInt($("#js-next").attr("data-id")) + 1;
						nextCounter++
				} else {
					nextId += 1;
					nextCounter++;
				}
					$.ajax({
						method: 'GET',
						url: `/cars/${nextId}`,
						dataType: 'json',
						success: function(response) {
							console.log(response);
						}
					})
			}
		})
}


function listenerPreviousCarClick () {
    $("#js-previous").on('click', function (event) {
			event.preventDefault();
			if (nextCounter === 0) {
				nextId = parseInt($("#js-next").attr("data-id")) + 1;
				nextCounter++;
			}
			else {
				nextId += 1;
				nextCounter++;
			}
			$.ajax({
				method: 'GET',
				url: `/cars/${nextId}`,
				dataType: 'json',
				success: function(response) {
					console.log(response.name);
				}
			})
		})
}

































// const button = document.getElementById('fetch-dogs') // We find the 'fetch dogs' button and add an event listner to call our funtion when clicked.
//
// button.addEventListener('click', function (event) {
//   fetchDogs() // fetchDogs will send a request to the dog api and after formating it will append it to the page
// });
//
// function fetchDogs() {
//   fetch('https://dog.ceo/api/breeds/image/random') // fetch takes two arguments, a url and an options object. We are GETing from the dog api so we don't need to include the headers. Headers are more important when we want to POST, PUT, DELETE.
//   .then(res => res.json()) // Take our JSON Response from dog api and convert it to a javascript object
//   .then(data => {  // {status: success, message: 'https://example.jpeg'}
//     const dog = new Dog(data.message) // Pass just the message value, the image url, to the Dog Class below. dog => Dog {imageURL: 'https://example.jpeg'}
//     const dogHTML = dog.formatImageHtml() // Call the the Dog Class prototype function we created on our new dog instance. dogHTML => "<img src='https://images.dog.ceo/breeds/cockapoo/bubbles2.jpg'alt='random dog'/>"
//     document.getElementById('dogs').innerHTML = dogHTML // appends our new html to the dogs div
//   })
// }
//
// class Dog {
//   constructor(message) {
//     this.imageURL = message
//   }
//
// }
//
// Dog.prototype.formatImageHtml = function(){
//   return `<img src="${this.imageURL}"alt="random dog"/>` // formats our image
// }
// Create a booking object? a car object?
// Need to create a car object of sorts
//
