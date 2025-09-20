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
<h2>Result &nbsp;<input type="button" value="Back" onclick="window.history.back()" class="btn btn-primary"/></h2>
<hr>
<h3>Exam Title: <%=request.getAttribute("examTitle").toString().trim() %></h3>
<table class="table table-bordered">
<tr>
<th>Total Marks</th>
<th>Score</th>
<th>Percentage</th>
</tr>
<tr>
<td><%=request.getAttribute("totalMarks").toString().trim() %></td>
<td><%=request.getAttribute("score").toString().trim() %></td>
<td><%=request.getAttribute("percent").toString().trim() %></td>
</tr>
</table>
<table class="table table-bordered table-responsive">
<tr style="background-color:seashell">
<th>Question</th>
<th>Question Type</th>
<th>Total Marks</th>
<th>Scored Marks</th>
 
</tr>


<soham:forEach items="${stf}" var="rec">

<tr><td>${rec.ques}</td>
<td>${rec.questype}</td>
<td>${rec.marks}</td>
<td>${rec.examMarks}</td> 
 
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