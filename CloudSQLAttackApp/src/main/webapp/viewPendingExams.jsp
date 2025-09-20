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
<h2>Pending Exams</h2>
<hr>

<table class="table table-bordered table-responsive">
<tr style="background-color:seashell">
<th>Title</th>
<th>Branch</th>
<th>Course</th>
<th>Semester</th>
<th>Subject</th>
<th>Marks</th>
<th>Date</th><th>Time</th>
<th>Duration</th>
<th>No of Questions</th>
<th>No of Added Questions</th>
<th>Marks of Added Questions</th>
<th>Status</th><th></th><th></th>
</tr>


<soham:forEach items="${stf}" var="rec">

<tr><td>${rec.title}</td>
<td>${rec.branchname}</td>
<td>${rec.course}</td>
<td>${rec.semester}</td>
<td>${rec.subnm}</td>
<td>${rec.marks}</td>
<td>${rec.dt}</td>
<td>${rec.tm}</td>
<td>${rec.duration}</td>
<td>${rec.totalQues}</td>
<td>${rec.totalQuesAdded}</td>
<td>${rec.totalmarksOfAddedQues}</td>
<td>
<soham:choose>
  <soham:when test="${rec.getTotalmarksOfAddedQues()<rec.getMarks()}">
    Pending
    </soham:when> 
  <soham:otherwise>
   <a href="submitExam?m1=${rec.totalmarksOfAddedQues}&m2=${rec.marks}&examId=${rec.examId}">Submit Exam</a>
   
  </soham:otherwise>
</soham:choose>
 </td>
<td>
<a href="AddQues?examId=${rec.examId}&subId=${rec.subId}">Add Questions</a>
</td>
<td>
<a href="viewAddedQues?examId=${rec.examId}&subId=${rec.subId}">View Questions</a>
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