<%@page import="models.ViewColg"%>
 
<%@page import="java.util.List"%>
<%@page import="beans.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>Online subjective type answer checking system using machine learning</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
 
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

function makeGetRequestInd(st) {
   // st=document.frm.state.value;
   
    http.open('get', 'Courses?branch=' + st);
    http.onreadystatechange = processResponseInd;
    http.send(null);
}

function processResponseInd() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('courses').innerHTML = response;
    }
}
 
</script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='//fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/responsiveslides.css">
<script src="js/jquery.min.js"></script>
<script src="js/responsiveslides.min.js"></script>
		  <script>
		    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 1
			      $("#slider1").responsiveSlides({
			        maxwidth: 2500,
			        speed: 600
			      });
			});
		  </script>
<!--light-box-->
<script type="text/javascript" src="js/jquery.lightbox.js"></script>
<link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen">
	<script type="text/javascript">
		$(function() {
			$('.gallery a').lightBox();
		});
   </script>


</head>
<body id="top">
          <div class="header">
	<div class="wrap">
		<div class="header-top">
			<div class="logo">
				 <h1>Detecting SQL Injection Attacks in Cloud SaaS using Machine Learning</h1>
			</div>
			
			<div class="clear"></div>
		</div>
	</div>
	<div class="menu">
		<div class="wrap">
			<div class="top-nav">
			      <ul class="nav">
		            <li class="active"><a href="index.jsp">Home</a></li>
					<li><a href="#login">Login</a></li>
					<li><a href="#reg">Student Registration</a></li>
					 <li><a href="#colgreg">College Registration</a></li>
					<div class="clear"></div>
				 </ul>
				  
					<div class="clear"></div>
			</div>
	     </div>
	</div>
</div>
      <!--start-image-slider---->
		<div class="image-slider">
		<!-- Slid                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   eshow 1 -->
		  <ul class="rslides" id="slider1">
		    <li><img src="images/banner1.jpg" alt=""></li>
			<li><img src="images/banner3.jpg" alt=""></li>
			<li><img src="images/banner1.jpg" alt=""></li>
		    <li><img src="images/banner3.jpg" alt=""></li>
		  </ul>
	    <!-- Slideshow 2 -->
	   </div>                                                                                                                                                         
<div class="wrap" id="reg">
	<div class="main">
		<div class="about-top">
		     
<%
	BranchList bl = new BranchList();
	List<BranchList> lst = bl.getBranchList();
	 ViewColg vc=new ViewColg();
	    List<ViewColg>lst1=vc.getColgReport();
	    System.out.println("lst="+lst1.size());
	   try{
	   //Sanitization obj=new  Sanitization();
	  //  obj.checkSQLData("sdfsdf");
		   System.out.println("lst="+lst1.size());
	   }
	   catch(Exception ex)
	   {
		   System.out.println("err="+ex.getMessage());
	   }
%>
  <div class="row">
  <div class="col-md-6">
  <div class="jumbotron">
  
  <h2>Student Registration</h2>
<form name="frm" method="post" action="registeruser" enctype="multipart/form-data"><table>
	<tr><td>Userid</td>
	<td><input type="text" name="userid" class="form-control" required></td>
	</tr>
	<tr><td>User Name</td>
	<td><input type="text" name="usernm" class="form-control" required></td>
	</tr>
	<tr><td>Password</td>
	<td><input type="password" name="pswd" class="form-control" required></td>
	</tr>
	<tr>
       	<td>College</td>
       	<td><select name="college" required class="form-control" onchange="makeGetRequestInd(this.value)">
       	<option value=""><---Select---></option> 
		
       	<%for(int i=0 ;i<lst1.size();i++) {%>
       			<option value=<%=lst1.get(i).getUserid() %>><%=lst1.get(i).getColgName() %></option>
		<%} %>
       	</select></td>
       	
       </tr>
	 <tr>
                    <td>Usertype</td>
                    <td><select name="usertype" required class="form-control">                   
                    <option value="student">Student</option>
                    <option value="exstudent">Ex-student</option>

                        </select>          </td>
                </tr>
       <tr><td>Mobile Number</td>
       	<td><input type="text" name="mobileno"  pattern="^\d{10}$" class="form-control" required></td></tr>
       <tr>
		<td>Email Address</td>       
       <td><input type="text" name="emailid" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  class="form-control" required></td>
       </tr>
     
       <tr>
<td>Gender</td>
<td>
  <input type="hidden" name="userstatus" value="deactive"/>
<input type="radio" name="gender" value="Male"   checked="checked" required >Male 
<input type="radio" name="gender" value="Female"  required>Female 
</td>
</tr>
        
       <tr>
       	<td>Branch</td>
       	<td><select name="branch" required class="form-control" onchange="makeGetRequestInd(this.value)">
       	<option value=""><---Select---></option> 
		
       	<%for(int i=0 ;i<lst.size();i++) {%>
       			<option value=<%=lst.get(i).getBranchname()%>><%=lst.get(i).getBranchname() %></option>
		<%} %>
       	</select></td>
       	
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
       	<td>Date Of Birth</td>
       	<td><input type="date" name="dob" class="form-control"></td>
       </tr>
       <tr><td>Photo</td>
       <td>
       <input type="file" name="file" class="form-control"/>
       </td>
	<tr>
	<td><input type="submit" value="Submit" class="btn btn-primary" ></td>
	</tr>
	</table>
</form></div>
  </div>
  <div class="col-md-6">
     <img src="images/studReg.png" width="60%"/>
  </div>
  </div>
		</div>
		</div>
		</div>
		
		
		<div class="footer" id="login">
			<div class="wrap">
			<div class="footer-grids">
			
			<div class="row jumbotron">
			
			<div class="col-md-6"> <h2>Login</h2> 
			  <form name="frm" method="post" action="check">
         <table class="tblform"> 
         <tr><td>Userid</td>
         <td>
          <input type="text" class="form-control" name="userid" required>
          </td>
          </tr>
          <tr><td>Password</td>
          <td> <input type="password"  class="form-control" name="pswd" required>
          </td>
          </tr>
          <tr><td colspan="2"><input type="submit" class="btn btn-primary" value="Submit"></td></tr>
          <tr><td colspan="2"><a href="forgetpassword">Forget Password?</a></td></tr>
         </table>
				<br/><br/>			 
							 
							 
						</form>
			</div>
			<div class="col-md-6">
			   <img src="images/login.jpg" width="80%"/>
			</div>
			</div></div></div>
			</div>
			
			<div class="wrap" id="colgreg">
	<div class="main">
		<div class="about-top">
		   
  <div class="row">
  <div class="col-md-6">
  <div class="jumbotron">
  
  <h2>College Registration</h2>

<form name="frm" method="post" action="registercolg" enctype="multipart/form-data"><table>
	<tr><td>Userid</td>
	<td><input type="text" name="userid" class="form-control" required></td>
	</tr>
	<tr><td>User Name</td>
	<td><input type="text" name="usernm" class="form-control" required></td>
	</tr>
	<tr><td>College Name</td>
	<td><input type="text" name="colgName" class="form-control" required></td>
	</tr>
	<tr><td>Password</td>
	<td><input type="password" name="pswd" class="form-control" required></td>
	</tr>
	 
       <tr><td>Mobile Number</td>
       	<td><input type="hidden" name="usertype" value="college"/>
       	<input type="text" name="mobileno"  pattern="^\d{10}$" class="form-control" required></td></tr>
       <tr>
		<td>Email Address</td>       
       <td><input type="text" name="emailid" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  class="form-control" required></td>
       </tr>
     
       <tr>
<td>Gender</td>
<td>
  <input type="hidden" name="userstatus" value="deactive"/>
<input type="radio" name="gender" value="Male"   checked="checked" required >Male 
<input type="radio" name="gender" value="Female"  required>Female 
</td>
</tr> 
       <tr>
       	<td>Date Of Birth</td>
       	<td><input type="date" name="dob" class="form-control"></td>
       </tr>
       <tr><td>Photo</td>
       <td>
       <input type="file" name="file" class="form-control"/>
       </td>
	<tr>
	<td><input type="submit" value="Submit" class="btn btn-primary" ></td>
	</tr>
	</table>
</form></div>
  </div>
  <div class="col-md-6">
     <img src="images/studReg.png" width="60%"/>
  </div>
  </div>
		</div>
		</div>
		</div>
			</div>
  
</body>
</html>