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
<h2>Questions&nbsp;&nbsp;<a  href="viewPendingExams" class="btn btn-primary" >Back</a></h2>
<hr>

<table class="table table-bordered table-responsive">
<tr style="background-color:seashell">
<th>Question</th>
<th>Marks</th>
<th>Question Type</th> 
<th></th> 
</tr>


<soham:forEach items="${stf}" var="rec">

<tr><td>${rec.ques}</td>
<td>${rec.marks}</td>
<td>${rec.questype}</td> 
<td>
<a href="DelQues?exQuesId=${rec.exQuesId}&examId=${rec.examId}">Delete Questions</a>
</td>
 
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