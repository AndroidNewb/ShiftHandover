<%@page import="java.util.Iterator"%>
<%@page import="shifthandover_app.model.ShiftActivityModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import ="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>results</title>
</head>
<body>
<%
List<ShiftActivityModel> list=(List<ShiftActivityModel>)request.getSession().getAttribute("list");

for (int i = 0; i < list.size(); i++) {
	out.print(list.get(i).getCompletedTasks());
}
out.print("<hr>");
%>
<table>
<c:forEach items="${list}" var="item">
    <tr>
    <%-- ${item.completedTasks} --%>
    </tr>
    <hr>
</c:forEach>
</table>
</body>
</html>