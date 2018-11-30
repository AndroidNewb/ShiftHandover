<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Entry</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script>
	$(function() {
		$("#shiftDate").datepicker({ dateFormat: "dd/mm/yy" }).val();
	});
	
	function validateDates()
	{
		 var x = document.forms["searchEntry"]["fromDate"].value;
		 var y = document.forms["searchEntry"]["tillDate"].value;
		 
		 
	}
	
</script>

</head>
<body>


	<form name="searchEntry" action="/api/searchEntry" method="POST">
		<table border="2">
			<tr>
				<td>From Date: </td>
				<td><input type="text" id="fromDate" name="fromDate"></td> 
				
			</tr>
			<tr>
				<td>Till Date: </td>
				<td><input type="text" id="tillDate" name="tillDate"></td> 
				
			</tr>
			<tr>
				<td>Current Shift: </td>
				<td><select name="currentShift">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td> Handover By: </td>
				<td><select name="handover_By">
						<option value="Vamshika">Vamshika</option>
						<option value="Vineet">Vineet</option>
						<option value="Aswin">Aswin</option>
						<option value="Amit_Kumar">Amit_Kumar</option>
						<option value="Lydia">Lydia</option>

				</select></td>
			</tr>
			<tr>
				<td> Handover To: </td>
				<td><select name="handover_To">
						<option value="Vamshika">Vamshika</option>
						<option value="Vineet">Vineet</option>
						<option value="Aswin">Aswin</option>
						<option value="Amit_Kumar">Amit_Kumar</option>
						<option value="Lydia">Lydia</option>

				</select> </td>
			</tr>
			<tr>
				<td> <input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>