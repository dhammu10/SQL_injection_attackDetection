<%@page import="models.QuestionTypes"%>
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
String quesType= request.getAttribute("quesType").toString().trim();
 
QuestionTypes obj=new QuestionTypes();
obj.setQuesType(quesType); 
double marks=obj.getMarks1();
%><table>
<tr><td colspan="2">
<input type="number" name="marks" value="<%=marks %>" class="form-control" required/>
</td>
</tr>
<%
System.out.println("questtyype="+request.getParameter("quesType").toString());
if(request.getParameter("quesType").toString().trim().equals("Objective"))
{%>
 
<tr>
<td>Option1</td>
<td>
<input type="text" name="option1" required class="form_control" class="form_control" />
</td>
</tr>
<tr>
<td>Option2</td>
<td>
<input type="text" name="option2" required class="form_control" />
</td>
</tr>
<tr>
<td>Option3</td>
<td>
<input type="text" name="option3" required class="form_control"/>
</td>
</tr>
<tr>
<td>Option4</td>
<td>
<input type="text" name="option4" required class="form_control"/>
</td>
</tr>
<tr>
<td>Answer</td>
<td>
<select name="answer" required class="form_control">
<option value=""><--Select--></option>
<option value="option1">Option 1</option>
<option value="option2">Option 2</option>
<option value="option3">Option 3</option>
<option value="option4">Option 4</option>
</select>
</td>
</tr>
</table>
<%}else if(request.getParameter("quesType").toString().trim().equals("OneSentence"))
{%>
 <table>
<tr>
<td>One Sentence Answer</td>
<td>
<input type="text" name="OneSentence" required class="form_control"/>
</td>
</tr>
</table>
<%}else{ %>
 <table>
<tr>
<td>Yes No Type Answer</td>
<td>
Yes<input type="radio" value="Yes"  name="yesNotype" required checked="checked"/>
No<input type="radio" value="No" name="yesNotype" required />
</td>
</tr>
</table>
<%} %>
</body>
</html>