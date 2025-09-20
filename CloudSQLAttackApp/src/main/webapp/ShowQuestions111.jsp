  
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
</head>
<body>
 <select required name="quesId" onchange="makeGetRequestQuesType(this.value)" class="form-control" >
<option value=""><---Select---></option> 
<%
int unitId=Integer.parseInt(request.getAttribute("unitId").toString().trim());
 
QuestionBank obj=new QuestionBank();
obj.setUnitId(unitId); 
obj.getQuestions();

 List<QuestionBank> lst=(List<QuestionBank>)obj.getLstques(); 
 for(int i=0;i<lst.size();i++)
{%>
<option value="<%=((QuestionBank)lst.get(i)).getQuesId() %>"><%=((QuestionBank)lst.get(i)).getQues() %></option>											
<%}%>
 

</select>
</body>
</html>