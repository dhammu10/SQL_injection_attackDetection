<%@page import="models.ExamQuestions"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/cust.css">


<title>AI Forum</title>
</head>
<body onload="counddown('<%=request.getAttribute("enddt").toString().trim()%>');"><jsp:include page="Top.jsp"></jsp:include>
<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("/college");
}
String userid=String.valueOf(session.getAttribute("userid"));
// response.sendRedirect("viewScheduledExamsStud");
 %>
 
 
 

<form action="<%=request.getRequestURL()%>" name="forma">
<div class="col-md-12">
<h1 class="timer" > <span class="timer1"><p id="demo"></p></span></h1>
</div>
</form>
<script>
<!--
// Set the date we're counting down to
<%
String enddt=request.getAttribute("enddt").toString().trim();
//String userid1=ses.getAttribute("userid").toString().trim();
//String examId=request.getAttribute("enddt").toString().trim();
%>
function counddown(dt1)
{
	//alert(dt1);
//"June 10, 2021 23:23:00"
var countDownDate = new Date(dt1).getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();
    
  // Find the distance between now and the count down date
  var distance = countDownDate - now;
    
  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
  // Output the result in an element with id="demo"
  document.getElementById("demo").innerHTML =  hours + "h "
  + minutes + "m " + seconds + "s ";
    
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "EXPIRED";
    window.location.href = "ExitExam?userid=";
	
  }
}, 1000);
}
-->
</script> 
<%
List<ExamQuestions> lstq=(List<ExamQuestions>)request.getAttribute("stf");

%>
<div class="container">
<div class="jumbotron">
<h2><%=request.getAttribute("quesNo").toString().trim() %>. <%=lstq.get(0).getQues() %></h2>
<form method="post" action="SubmitAns">
<input type="hidden" name="ques" value="<%=lstq.get(0).getQues() %>"/>
<input type="hidden" name="quesId" value="<%=lstq.get(0).getQuesId() %>"/>
<input type="hidden" name="examId" value="<%=lstq.get(0).getExamId() %>"/>
<input type="hidden" name="marks" value="<%=lstq.get(0).getMarks() %>"/>
<input type="hidden" name="quesType" value="<%=lstq.get(0).getQuestype() %>"/>
<input type="hidden" name="quesNo" value="<%=request.getAttribute("quesNo").toString().trim() %>"/>
<input type="hidden" name="enddt" value="<%=request.getAttribute("enddt").toString().trim() %>"/>

<table class="table">
<%
if(lstq.get(0).getQuestype().equals("Describe")||lstq.get(0).getQuestype().equals("Explain in Details"))
{
	%>
	<tr><td>
	Definition</td>
	<td>
	<textarea name="define" onpaste="return false" oncopy="return false" required="required" class="form-control"></textarea>
	</td>
	</tr>
	<tr><td>
	Details</td>
	<td>
	<textarea name="details" onpaste="return false" oncopy="return false" required="required" class="form-control"></textarea>
	</td>
	</tr>
	<% 
}
else if(lstq.get(0).getQuestype().equals("YesNoType"))
{
%>
	<tr><td>
	Answer</td>
	<td>
	Yes<input type="radio" name="yesNoType" checked="checked"  value="yes"/>
	No<input type="radio" name="yesNoType" value="no"/>
	 </td>
	</tr>
	<% 
}else{
%>
<tr><td>
	Answer</td>
	<td>
	<textarea name="answer" onpaste="return false" oncopy="return false" required class="form-control"></textarea>
	</td>
	</tr>
<%} %>
<tr>
<td colspan="2">
<input type="Submit" value="Submit" class="btn btn-primary"/>
</td>
</tr>
</table></form>
</div>
</div>
</body>
</html>