let idCounter = 1;
let userId;
let numberOfCars;


$(() => {
		getCarCount();
		getUserId();
		listenerNextCarClick();
		listenerPreviousCarClick();
		listenerBookThisCarClick();
})

function getCarCount() {
    $.get('/car_count', function (data) {
         numberOfCars = data;
    });
}

function getUserId () {
	$.ajax({
		dataType: 'json',
		method: 'GET'
	}).done(function(data) {
		userId = data.id;
	})
}

function listenerNextCarClick () {
    $("#js-next").on('click', function (event) {
			event.preventDefault();
			if (idCounter < numberOfCars) {
				if (idCounter === 0){
					idCounter = parseInt($("#js-next").attr("data-id")) + 1;
				}
				else {
					idCounter += 1;
				}
				getCarDetails(idCounter);
			}
		})
}

function listenerPreviousCarClick () {
		$("#js-previous").on('click', function (event) {
			event.preventDefault();
			if (idCounter === 0) {
				previousId = 1;
			}
			else if (idCounter > 0) {
				if (idCounter === 1) {
					idCounter = 1;
				} else {
					idCounter -= 1;
				}
			}
			getCarDetails(idCounter);
		})
}

function getCarDetails (idCounter) {
	$.ajax({
		method: 'GET',
		url: `/cars/${idCounter}`,
		dataType: 'json',
		success: function(response) {
			$( "#car-details" ).replaceWith( "<div id='car-details'>" +
				"<p><strong>" + `${response.name}` + "</strong></p>" +
				"<p> Top Speed:" + `${response.top_speed}` + "</p>" +
				"<p> Range Rer Charge (km`):" + `${response.range}` + "</p>" +
				"<p>Charge Time (hrs):" + `${response.charge_time}` + "</p>" +
				"<p>Price Per Day (USD ):" + `${response.price_per_day}` + "</p>" +
			"</div>" );
		}
	})
}

function listenerBookThisCarClick () {
	$("#book-car").on('click', function (event) {
		event.preventDefault();
		newBookingForm();
		})
}

function newBookingForm () {
	$.ajax({
		url: `/ajax_booking?user_id=${userId}&car_id=${idCounter}`,
		method: 'GET'
	}).success(function (response) {
		$("#book-this-car").html(response);
		listenerCreateBookingClick();
	})
}

function listenerCreateBookingClick () {
	$("#new_booking").on('submit', function(e) {
		e.preventDefault();
		let $form = $(this);
		let action = $form.attr("action");
		let params = $form.serialize();

		$.ajax({
			url: action,
			data: params,
			dataType: "json",
			method: "POST"
		}).success(function(json) {
			let booking = new Booking (json)
			let html = booking.createPostHTML();
		})

	})
}

class Booking {
	constructor(obj) {
		let currentBooking = obj["bookings"].length - 1;
		this.userName = obj.name
		this.carName = obj["bookings"][currentBooking]["car"].name
		this.startDate = obj["bookings"][currentBooking].start_date;
		this.endDate = obj["bookings"][currentBooking].end_date;
	}
}


Booking.prototype.createBookingHTML = function () {
	console.log("")
}











































// const button = document.getElementById('fetch-dogs') // We find the 'fetch dogs' button and add an event listner to call our funtion when clicked.
//
// button.addEventListener('click', function (event) {
//   fetchDogs() // fetchDogs will send a request to the dog api and after formating it will append it to the page
// });
//
// function fetchDogs() {
//   fetch('https://dog.ceo/api/breeds/image/random') // fetch takes two arguments, a url and an options object.
//   We are GETing from the dog api so we don't need to include the headers. Headers are more important when we want to POST, PUT, DELETE.
//   .then(res => res.json()) // Take our JSON Response from dog api and convert it to a javascript object
//   .then(data => {  // {status: success, message: 'https://example.jpeg'}
//     const dog = new Dog(data.message) // Pass just the message value, the image url, to the Dog Class below. dog => Dog {imageURL: 'https://example.jpeg'}
//     const dogHTML = dog.formatImageHtml() //
//		 Call the the Dog Class prototype function we created on our new dog instance.
//     dogHTML => "<img src='https://images.dog.ceo/breeds/cockapoo/bubbles2.jpg'alt='random dog'/>"
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
