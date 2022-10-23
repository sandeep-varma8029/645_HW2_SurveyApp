<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--Sai Sandeep Varma Mudundi, G01352322, smudund@gmu.edu-->
<!--This is the main Survey form with Required fields for first name, last name, street address, city, state, zip, telephone number, e-mail, and
date of survey and other form fields like Checkboxes, Radio Buttons, drop down and Submit and cancel buttons -->
<!--Took Reference for https://www.geeksforgeeks.org/build-a-survey-form-using-html-and-css/-->

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content=
		"width=device-width, initial-scale=1.0">
	<title>
		GMU Student Survey Form
	</title>
<link rel="stylesheet" type="text/css" href="Sandeep_Survey_Style.css" />
</head>

<body>
	<h1>GMU Student Survey Form 2</h1>

	<!-- Create Form -->
	<form id="form">

		<!-- Details -->
		<div class="form-control">
		
			<label for="name" id="label-name"><span style="color:#ff0000">*</span>
				First Name
			</label>

			<!-- Input Type Text -->
			<input type="text"
				id="name"
				placeholder="Enter your First name" autocomplete="on" autofocus required />
		</div>
		<div class="form-control">
			<label for="name" id="label-name"><span style="color:#ff0000">*</span>
				Last Name
			</label>

			<!-- Input Type Text -->
			<input type="text"
				id="name"
				placeholder="Enter your Last name" autocomplete="on" autofocus required/>
		</div>
				<div class="form-control">
			<label for="name" id="label-name"><span style="color:#ff0000">*</span>
				Street address
			</label>

			<!-- Input Type Text -->
			<input type="text"
				id="name"
				placeholder="Street address" autocomplete="on" autofocus required/>
		</div>
		<div class="form-control">
			<label for="city" id="label-city"><span style="color:#ff0000">*</span>
				City
			</label>

			<!-- Input Type Text-->
			<input type="text"
				id="city"
				placeholder="city" autocomplete="on" autofocus required/>
		</div>
		<div class="form-control">
			<label for="State" id="label-State"><span style="color:#ff0000">*</span>
				State
			</label>

			<!-- Input Type Text-->
			<input type="text"
				id="State"
				placeholder="State" autocomplete="on" autofocus required/>
		</div>
		<div class="form-control">
			<label for="zip" id="label-zip"><span style="color:#ff0000">*</span>
				Zip Code
			</label>

			<!-- Input Type Number-->
			<input type="number"
				id="zip"
				placeholder="Zip Code" autocomplete="on" autofocus required />
		</div>
		<div class="form-control">
			<label for="numberphone" id="label-phone"><span style="color:#ff0000">*</span>
				Telephone Number
			</label>

			<!-- Input Type Phone Number-->
			<input type="tel"
				id="phone"
				placeholder="+1 xxx-xxx-xxxx" autocomplete="on" autofocus required/>
		</div>

		<div class="form-control">
			<label for="email" id="label-email"><span style="color:#ff0000">*</span>
				Email
			</label>

			<!-- Input Type Email-->
			<input type="email"
				id="email"
				placeholder="Enter your email" autocomplete="on" autofocus required />
		</div>
				<div class="form-control">
			<label for="date" id="label-date"><span style="color:#ff0000">*</span>
				Date Of Survey
			</label>

			<!-- Input Type Date-->
			<input type="date"
				id="date"
				placeholder="mm/dd/yyyy" autocomplete="on" autofocus required />
		</div>
		<div class="form-control">
			<label>What do you like most about the campus
				<small>(Check all that apply)</small>
			</label>
			<!-- Input Type Checkbox -->
			<label for="inp-1">
				<input type="checkbox"
					name="inp">Students</input></label>
			<label for="inp-2">
				<input type="checkbox"
					name="inp">Location</input></label>
			<label for="inp-3">
				<input type="checkbox"
					name="inp">Campus</input></label>
			<label for="inp-4">
				<input type="checkbox"
					name="inp">Atmosphere</input></label>
			<label for="inp-5">
				<input type="checkbox"
					name="inp">Dorm rooms</input></label>
			<label for="inp-6">
				<input type="checkbox"
					name="inp">Sports</input></label>
		</div>
		<div class="form-control">
			<label>
				How did you become interested in the University?
			</label>

			<!-- Input Type Radio Button -->
			<label for="recommed-1">
				<input type="radio"
					id="recommed-1"
					name="recommed">Friends</input>
			</label>
			<label for="recommed-2">
				<input type="radio"
					id="recommed-2"
					name="recommed">Television</input>
			</label>
			<label for="recommed-3">
				<input type="radio"
					id="recommed-3"
					name="recommed">Internet</input>
			</label>
						<label for="recommed-3">
				<input type="radio"
					id="recommed-3"
					name="recommed">Other</input>
			</label>
		</div>
		<div class="form-control">
			<label for="role" id="label-role">
				Will you recommend the University to other prospective students ?
			</label>
			
			<!-- Dropdown options -->
			<select name="role" id="role">
				<option value="Very Likely">Very Likely</option>
				<option value="Likely">Likely</option>
				<option value="Unlikely">
					Unlikely
				</option>
			</select>
		</div>


		<div class="form-control">
		
			<label for="raffle" id="label-raffle">
				Raffle (Enter to win a free movie ticket)
			</label>

			<!-- Input Type Text -->
			<input type="text"
				id="raffle"
				placeholder="Enter at least ten comma separated numbers ranging from 1 to 100" />
		</div>


		<div class="form-control">
			<label for="comment">
				Any comments or suggestions
			</label>

			<!-- multi-line text input control -->
			<textarea name="comment" id="comment"
				placeholder="Enter your comment here">
			</textarea>
		</div>

		<!-- Multi-line Text Input Control -->
		<button type="submit" value="submit">
			Submit
		</button>
		<button type="submit" value="Cancel">
			Cancel
		</button>
	</form>
</body>

</html>
