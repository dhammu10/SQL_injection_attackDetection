<%@page import="java.util.Vector"%>
<%@page import="models.JavaFuns"%>
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
<h2>Result </h2>
<hr>
<h3>Exam Title: <%=request.getParameter("examTitle").toString().trim() %></h3>
<table class="table table-bordered">
<tr>
<th>Student Name</th>
<th>Total Marks</th>
<th>Score</th>
<th>Percentage</th>
<th></th>
</tr>
<%
JavaFuns jf=new JavaFuns();
Vector v=jf.getValue("select * from getResult where examId="+request.getParameter("examId").trim()+" and userid='"+session.getAttribute("userid").toString().trim()+"' order by percent desc" , 6);
for(int i=0;i<v.size();i=i+6)
{%>
	<tr>
	<td><%=v.elementAt(i).toString().trim() %></td>
<td><%=v.elementAt(i+3).toString().trim() %></td>
<td><%=v.elementAt(i+4).toString().trim() %></td>
 <td><%=v.elementAt(i+5).toString().trim() %></td>
<td><a href="viewExamResult?userid=<%=v.elementAt(i+2).toString().trim() %>&examId=<%=v.elementAt(i+1).toString().trim() %>">View Details</a>
</tr>

<%}%>


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