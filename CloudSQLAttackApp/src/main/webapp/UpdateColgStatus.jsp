<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="soham"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
 <link rel="stylesheet" href="css/cust.css">

<title>AI Forum</title>
</head>
<body><jsp:include page="Top.jsp"></jsp:include>
<%

String userid=String.valueOf(session.getAttribute("userid"));

if(!userid.equalsIgnoreCase("null")){	
	
session.setMaxInactiveInterval(10*60);

%>


<h2>Pending Colleges</h2>
<hr>
<table class="table table-bordered">
<tr style="background-color:seashell">
<th>UserId</th>
<th>UserName</th>
<th>Usertype</th>
<th>Userstatus</th>
<th>Action</th>
</tr>


<soham:forEach items="${stal}" var="rec">

<tr>
<td>${rec.userid}</td>
<td>${rec.usernm}</td>
<td>${rec.usertype}</td>
<td>${rec.userstatus}</td>
<td><a href="activateColg?uid=${rec.userid}">Activate Account</a></td>
</tr>

</soham:forEach>
</table>
 
<%
}
else{
	%>
	<h2>Invalid Session...Login again</h2>
	<br>
	<a href="index.jsp">Login</a>
	
	<%
}

%>
</body>
</html>