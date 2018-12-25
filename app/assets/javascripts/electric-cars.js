let idCounter = 1;
let userId, bookingId;
let numberOfCars;


$(() => {
		getCarCount();
		getUserId();
		listenerNextCarClick();
		listenerPreviousCarClick();
		listenerBookThisCarClick();
		listenerCreateBookingClick();
		listenerViewEditBookings();
})

function getUserId() {
	$.ajax({
		dataType: 'json',
		method: 'GET'
	}).done(function(data) {
		userId = data.id;
	})
}

function getCarCount() {
    $.get('/car_count', function (data) {
         numberOfCars = data;
    });
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
			$( "#car-details" ).replaceWith( "<div class='white-box' id='car-details'>" +
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


function listenerViewEditBookings () {
	$("#view-edit-bookings").on('click', function(event) {
		event.preventDefault();
		getUserBookings();
	})
}


function listenerModifyBookingClick () {
	$("#modify-booking").on('click', function (event) {
		event.preventDefault();
	  bookingId =	$("input[name='booking']:checked").val();
		bookingId = parseInt(bookingId, 10) + 1;
		editBookingForm();
		})
}

function getUserBookings () {
	$.ajax({
		dataType: 'json',
		method: 'GET'
	}).success(function(json) {
		let html = createUserDetails(json);
		if (html == "") {
			document.getElementById('bookings').innerHTML = "<p>You do not have any bookings yet!</p>";
		}
		else if (!html == "") {
			document.getElementById('bookings').innerHTML = html;
		}
		listenerModifyBookingClick();
	})
}


function newBookingForm () {
	$.ajax({
		url: `/ajax_booking?user_id=${userId}&car_id=${idCounter}`,
		method: 'GET'
	}).success(function (response) {
		$(".modal-title").html("Make a Reservation");
		$("#book-this-car").show();
		$("#edit-this-booking").hide();
		$("#book-this-car").html(response);
	})
}

function editBookingForm () {
	$.ajax({
		url: `/ajax_edit_booking?user_id=${userId}&id=${bookingId}`,
		method: 'GET'
	}).success(function (response) {
		$(".modal-title").html("Update Your Reservation");
		$("#book-this-car").hide();
		$("#edit-this-booking").show();
		$("#edit-this-booking").html(response);
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
			 getUserBookings(json);
		})
	})
}

function listenerEditBookingClick () {
	$("edit_booking").on('submit', function(e) {
		e.preventDefault();
		let $form = $(this);
		let action = $form.attr("action");
		let params = $form.serialize();
		$.ajax({
			url: action,
			data: params,
			dataType: "json",
			method: "PATCH"
		}).success(function(json) {
			 debugger;
			 getUserBookings(json);
		})
	})
}

function createUserDetails (json) {
	let userDetails = new UserDetails (json)
	let html = userDetails.createUserDetailsHTML();
	return html;
}


class UserDetails {
	constructor(obj) {
		this.userName = obj.name
		this.bookings = obj.bookings
		this.userCars = obj.cars
	}
}

UserDetails.prototype.createUserDetailsHTML = function () {
	const bookings = (
		this.bookings.map((booking, index) => {
			return `<input type='radio' id=${index} name='booking' value=${index}>
							<label for=${index}> ${booking["car"].name} from ${booking.start_date} to ${booking.end_date}</label><br>`
		}).join('') )
    if (bookings.length !== 0) {
			return (`<div class="white-box">
						<strong> Your Current Bookings: </strong><br><br>
						<p>${bookings}</p>
						<div class="container">
					    <br><button class="btn btn-success" id="modify-booking" data-toggle="modal" data-target="#myModal">Modify</button>
					  </div>
						</div>
						`)
		}
		else {
			return ("")
		}
}
