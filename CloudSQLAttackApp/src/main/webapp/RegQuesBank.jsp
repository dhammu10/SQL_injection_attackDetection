<%@page import="models.QuestionTypes"%>
<%@page import="models.Staff"%>
<%@page import="models.RegisterBranch"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
 <link rel="stylesheet" href="css/cust.css">

<title>Online Exam Analytics</title>

<script language="Javascript" type="text/javascript">
 

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest(st) {
   // st=document.frm.state.value;
   
    http.open('get', 'Courses?branch=' + st);
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('courses').innerHTML = response;
    }
}
 
</script>

<script language="Javascript" type="text/javascript">
 

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest1(st) {
   // st=document.frm.state.value;
   
    http.open('get', 'Semesters1?courseId=' + st);
    http.onreadystatechange = processResponse1;
    http.send(null);
}

function processResponse1() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('sem').innerHTML = response;
    }
}
 
</script>

<script language="Javascript" type="text/javascript">
 

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest2(st) {
	//alert('in makeget2');
     courseId=document.frm.courseId.value;
     semester=document.frm.semester.value;
     branch=document.frm.branchname.value;
     //alert(courseId+" sem="+semester+" branch="+branch);
    http.open('get', 'ShowAllottedSubjects1?semester=' + semester+"&courseId="+courseId+"&branch="+branch);
    http.onreadystatechange = processResponse2;
    http.send(null);
}

function processResponse2() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('subjects').innerHTML = response;
    }
}
 
</script>

<script language="Javascript" type="text/javascript">
 

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest3(st) {
	// alert('in makeget3'+st);
     //subId=document.frm.subId.value;
    // semester=document.frm.semester.value;
    // branch=document.frm.branchname.value;
     //alert(courseId+" sem="+semester+" branch="+branch);
    http.open('get', 'ShowUnits?subId=' + st);
    http.onreadystatechange = processResponse3;
    http.send(null);
}

function processResponse3() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('units').innerHTML = response;
    }
}
 
</script>
<script language="Javascript" type="text/javascript">
 

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequestQues(st) {
	// alert('in makeget3'+st);
     //subId=document.frm.subId.value;
    // semester=document.frm.semester.value;
    // branch=document.frm.branchname.value;
     //alert(courseId+" sem="+semester+" branch="+branch);
    http.open('get', 'ShowQMarks?quesType=' + st);
    http.onreadystatechange = processResponseQues;
    http.send(null);
}

function processResponseQues() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('marks').innerHTML = response;
    }
}
 
</script>
 
</head>
<body><jsp:include page="Top.jsp"></jsp:include>
<% try{ response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
} 

String userid=String.valueOf(session.getAttribute("userid"));

if(!userid.equalsIgnoreCase("null")){	
	
session.setMaxInactiveInterval(10*60);

%><div class="row">
<div class="col-md-6">

<h2> Question Registration</h2>
<form name="frm" id="frm" method="post" action="QuesReg">
<table class="tblform">
	<!-- <tr>
		<td>Branch ID</td>
		<td><input type="text" name="branchid" required></td>
	</tr> -->
		<tr>
		<td>Question</td>
		<td><textarea name="ques" class="form-control" required></textarea>
		<input type="hidden" name="userid" value="<%=session.getAttribute("userid").toString().trim() %>"/>
		 </td></tr>
		 <tr>
		<td>Question Type</td>
		<td>
		<select name="quesType" required class="form-control" onchange="makeGetRequestQues(this.value)">
		<option value=""><---Select---></option> 
		 <%
		 List<QuestionTypes> lst1=(List<QuestionTypes>)request.getAttribute("lstquesType");
		 for(int i=0;i<lst1.size();i++)
		 {
			 QuestionTypes br1=(QuestionTypes)lst1.get(i);
			 %><option value="<%=br1.getQuesType() %>"><%=br1.getQuesType() %></option><%
		 }
		 %>	</select>
		</td>
	</tr>
		 <tr>
		<td>Marks</td>
		<td>
		   
		  <div id="marks" name="marks"></div>
		  </td>
		  </tr>
		 
	<tr>
		<td>Branch Name</td>
		<td>
		<select name="branchname" required class="form-control" onchange="makeGetRequest(this.value)">
		<option value=""><---Select---></option> 
		 <%
		 List<RegisterBranch> lst=(List<RegisterBranch>)request.getAttribute("lstbranch");
		 for(int i=0;i<lst.size();i++)
		 {
			 RegisterBranch br=(RegisterBranch)lst.get(i);
			 %><option value="<%=br.getBranchname() %>"><%=br.getBranchname() %></option><%
		 }
		 %>	</select>
		</td>
	</tr>
	<tr>
	<td>Course</td>
	<td>
	<div id="courses" name="courses"></div>
	</td>
	</tr>
	<tr>
	<td>Semester</td>
	<td>
	<div id="sem" name="sem"></div>
	</td>
	</tr>
	<tr>
	<td>Subject</td>
	<td>
	<div id="subjects" name="subjects"></div>
	</td>
	</tr>
	<tr>
	<td>Units</td>
	<td>
	<div id="units" name="units"></div>
	</td>
	</tr>
	<tr><td colspan="2">
	<div id="showanspage" name="showanspage"></div>
	</td></tr>

	<tr>
		<td>
		<input type="submit" value="Submit">
		</td>
	</tr>
</table>
</form></div> 
<div class="col-md-6">
<img src="images/reg.png" width="50%"/>
</div>
</div>
<%
}
else{
	%>
	<h2>Invalid Session...Login again</h2>
	<br>
	<a href="index.jsp">Login</a>
	
		<%
}}
catch(Exception ex)
{
	System.out.println("err="+ex.getMessage());
}
%>
 
</body>
</html>