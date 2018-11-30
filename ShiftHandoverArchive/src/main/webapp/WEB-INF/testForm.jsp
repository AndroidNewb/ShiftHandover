<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<style>
body {
	background-color: #eee;
	font: helvetica;
}

#container {
	width: 500px;
	background-color: #fff;
	margin: 30px auto;
	padding: 30px;
	border-radius: 5px;
	box-shadow: 5px;
}

.green {
	font-weight: bold;
	color: green;
}

.message {
	margin-bottom: 10px;
}

label {
	width: 70px;
	display: inline-block;
}

form {
	line-height: 160%;
}

.hide {
	display: none;
}
</style>
</head>
<body>
	<div id="container">
		
			<form:form modelAttribute="newEntry">
				<label for="nameInput">Name: </label>
				<form:input path="name" id="nameInput" />
				<br />

				<label for="ageInput">Age: </label>
				<form:input path="age" id="ageInput" />
				<br />

				<label for="emailInput">Email: </label>
				<form:input path="email" id="emailInput" />
				<br />

				<label for="genderOptions">Gender: </label>
				<form:select path="gender" id="genderOptions">
					<form:option value="">Select Gender</form:option>
					<form:option value="MALE">Male</form:option>
					<form:option value="FEMALE">Female</form:option>
				</form:select>
				<br />

				
				<label for="frequencySelect">Freq:</label>
				<form:select path="newsletterFrequency" id="frequencySelect">
					<form:option value="1">1 </form:option>
					<form:option value="2">2 </form:option>
				</form:select>
				<br />

				<br />
				<input type="submit" value="Submit" />
			</form:form>
	</div>
</body>
</html>