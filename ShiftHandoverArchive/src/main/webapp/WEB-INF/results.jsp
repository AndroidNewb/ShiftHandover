<%@page import="java.util.Iterator"%>
<%@page import="shifthandover_app.model.ShiftActivityModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>results</title>
</head>
<body>
	<%
		//ShiftActivityModel entry=(ShiftActivityModel)request.getSession().getAttribute("list");
	%>

	<c:if test="${not empty list}">
		<c:forEach items="${list}" var="shiftEntry">
			<table>
				<tr>
					<td>Date:</td>
					<td><input type="text" disabled=true
						value=<c:out value="${shiftEntry.dateString}" />></td>
				</tr>
				<tr>
					<td>Current Shift</td>
					<td><input type="text" disabled=true
						value=<c:out value="${shiftEntry.currentShift}" />></td>
					<td>Next Shift</td>
					<td><input type="text" disabled=true
						value=<c:out value="${shiftEntry.nextShift}" />></td>
				</tr>
				<tr>
					<td>Completed tasks:</td>
					<td colspan="3"><textarea name="completedTasks" rows="4"
							cols="110" disabled><c:out value="${shiftEntry.completedTasks}" /></textarea></td>
				</tr>
				<tr>
					<td>InProgress tasks:</td>
					<td colspan="3"><textarea name="completedTasks" rows="4"
							cols="110" disabled><c:out
								value="${shiftEntry.inProgressTasks}" /></textarea></td>
				</tr>
				<tr>
					<td>Issues encountered:</td>
					<td colspan="3"><textarea name="completedTasks" rows="4"
							cols="110" disabled><c:out value="${shiftEntry.issues}" /></textarea></td>
				</tr>
				<tr>
					<td>Changes(RFC):</td>
					<td colspan="3"><textarea name="completedTasks" rows="4"
							cols="110" disabled><c:out value="${shiftEntry.changes}" /></textarea></td>
				</tr>
				<tr>
					<td>Handover By:</td>
					<td><input type="text" disabled=true
						value=<c:out value="${shiftEntry.handover_By}" />></td>
					<td>Handover To:</td>
					<td><input type="text" disabled=true
						value=<c:out value="${shiftEntry.handover_To}" />></td>
				</tr>
			</table>
			<hr>
			<br>
		</c:forEach>
	</c:if>


</body>
</html>