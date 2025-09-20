  
<%@page import="models.QuestionBank"%>
<%@page import="models.Units"%>
<%@page import="models.Subjects"%>
<%@page import="java.util.List"%>
<%@page import="models.Courses"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<title>Register</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Insert title here</title>

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

function makeGetRequestQues1(st) {
	// alert('in makeget3'+st);
     //subId=document.frm.subId.value;
    // semester=document.frm.semester.value;
    // branch=document.frm.branchname.value;
     //alert(courseId+" sem="+semester+" branch="+branch);
    http.open('get', 'ShowQuestions?unitId=' + st);
    http.onreadystatechange = processResponseQues1;
    http.send(null);
}

function processResponseQues1() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('ques').innerHTML = response;
    }
}
 
</script>
</head>
<body>
<jsp:include page="Top.jsp"></jsp:include>
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
}
%><div class="row">
<div class="col-md-6">

<h2> Add Questions</h2>
<form name="frm" id="frm" method="post" action="QuesAdd">
<table class="tblform">
<tr><td>Units</td><td>
 <select required name="unitId" class="form-control" onchange="makeGetRequestQues1(this.value)" >
<option value=""><---Select---></option> 
<%
int subId=Integer.parseInt(request.getAttribute("subId").toString().trim());
 
Units obj=new Units();
obj.setSubId(subId); 
obj.getUnits();

 List<Units> lst=(List<Units>)obj.getLstunits(); 
 for(int i=0;i<lst.size();i++)
{%>
<option value="<%=((Units)lst.get(i)).getUnitId() %>"><%=((Units)lst.get(i)).getUnitName() %></option>											
<%} %> 
</select>
<input type="hidden" name="examId" value="<%=request.getAttribute("examId").toString().trim() %>"/>
<input type="hidden" name="userid" value="<%=session.getAttribute("userid").toString().trim() %>"/>
</td>
</tr>
<tr><td>Question</td>
<td>
<div id="ques"></div>
</td></tr>
<tr><td colspan="2">
<input type="submit" value="Submit"/>
</td></tr>
</table></form>
<%}catch(Exception ex){} %>
</body>
</html>