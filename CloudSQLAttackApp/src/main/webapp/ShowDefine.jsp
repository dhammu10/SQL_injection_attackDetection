<%@page import="java.util.Vector"%>
<%@page import="models.JavaFuns"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
JavaFuns jf=new JavaFuns();
Vector v=jf.getValue("select quesType from quesbank where quesId="+request.getParameter("quesId").trim() , 1);
if(v.elementAt(0).toString().trim().equals("Describe")||v.elementAt(0).toString().trim().equals("Explain in Details"))
{
	%>
	Definition <textarea name="define" class="form-control"></textarea>
	<br/><br/>Detail Answer<br/><% 
}
else{
	%>
	<input type="hidden" name="define" value="NA"/>
	<%
}
%>
</body>
</html>