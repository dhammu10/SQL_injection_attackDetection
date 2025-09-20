  
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
 <select required name="unitId" class="form-control" onchange="makeGetRequest4(this.value)" >
<option value=""><---Select---></option> 
<%
int subId=Integer.parseInt(request.getAttribute("subId").toString().trim());
 
Units obj=new Units();
obj.setSubId(subId); 
obj.getUnits();

 List<Units> lst=obj.getLstunits(); 
 for(int i=0;i<lst.size();i++)
{%>
<option value="<%=((Units)lst.get(i)).getUnitId() %>"><%=((Units)lst.get(i)).getUnitName() %></option>											
<%}%>
 

</select>
</body>
</html>