<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddEntry</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script>
       $(function() {
              $("#shiftDate").datepicker({ dateFormat: "dd/mm/yy",maxDate: '0' }).val();
       });
</script>

</head>

<style>
table {
	border-collapse: collapse;
}

tr:hover {
	background-color: #f5f5f5;
}

th {
	background-color: #1b3359;
	color: white;
}
</style>
<body>
	<h2>Shift HandOver</h2>


	<form name="newEntry" action="/api/saveEntry" method="POST">
		<table border="2" cellpadding="5" cellspacing="5">


			<tr>
				<th align="Left">Team Name</th>
				<td>DL.SSO Support Team <DL.SSOSupportTeam @SunTrust.com></td>
				<td>Date:</td>
				<td><input type="text" id="shiftDate" name="shiftDate" required></td>
			</tr>

			<tr>
				<th align="Left">Current Shift:</th>
				<td><select name="currentShift">
						<option value="1">First Shift</option>
						<option value="2">Second Shift</option>
						<option value="3">Third Shift</option>
				</select></td>
				<th align="Left">Next Shift:</th>
				<td><select name="nextShift">
						<option value="1">First Shift</option>
						<option value="2">Second Shift</option>
						<option value="3">Third Shift</option>
				</select></td>
			</tr>
			<tr>
				<th align="Left">Completed tasks</th>
				<td colspan="3"><textarea name="completedTasks" rows="7"
						cols="110">
</textarea></td>
			</tr>
			<tr>
				<th align="Left">In Progress tasks</th>
				<td colspan="3"><textarea name="inProgressTasks" rows="7"
						cols="110">
</textarea></td>
			</tr>
			<tr>
				<th align="Left">Issues encountered (Mention the
					Incident/WO/RFC)</th>
				<td colspan="3"><textarea name="issues" rows="7" cols="110">
</textarea></td>
			</tr>
			<tr>
				<th align="Left">Changes(RFC):</th>
				<td colspan="3"><textarea name="changes" rows="7" cols="110">
</textarea></td>
			</tr>
			<tr>
				<th align="Left">Handover By:</th>
				<td><select name="handover_By">
						<option value="Vamshika">Vamshika</option>
						<option value="Vineet">Vineet</option>
						<option value="Aswin">Aswin</option>
						<option value="Amit_Kumar">Amit_Kumar</option>
						<option value="Lydia">Lydia</option>

				</select></td>


				<th align="Left">Handover To:</th>
				<td><select name="handover_To">
						<option value="Vamshika">Vamshika</option>
						<option value="Vineet">Vineet</option>
						<option value="Aswin">Aswin</option>
						<option value="Amit_Kumar">Amit_Kumar</option>
						<option value="Lydia">Lydia</option>

				</select></td>
			</tr>
			<tr>

				<td colspan="4" align="center"><input type="submit"
					value="Submit"></td>
			</tr>

		</table>
	</form>
</body>
</html>
