<%@page import="services.UpdateCloudRent"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="models.LoginTracker"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
 
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>Online Exam System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
<body id="top"><%try{ %>
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
		            <li class="active"><a href='<%=session.getAttribute("usertype").toString().trim() %>'>Home</a></li>
					 
					<li><a href="ChangePass">Change Password</a></li>
					 <li><a href="logout">Logout</a>
					 
					 </li>
					<div class="clear"></div>
				 </ul>
				  
					<div class="clear"></div>
			</div>
	     </div>
	</div>
</div>
      
    <div class="container-fluid">
    <div class="row">
    <div class="col-md-3 sidebar">
    <ul class="sidebar">
        <li class="active"><a href="/<%=session.getAttribute("usertype").toString().trim()%>">Home</a></li>
        <%if(session.getAttribute("usertype").toString().trim().equals("college"))
                                	{
                                	%>
                                	 <li><a href="registerbranch">Branch Registration</a></li>
                                	 <li><a href="RegCourse">Course Registration</a></li>
        <li><a href="/registerstaff">Staff Registration</a></li>
        <li><a href="viewstaff" >View Staff</a></li>
        <li><a href="RegSubject">Subject Registration</a></li>
		<li><a href="SubAllocation">Subject Allocation</a></li>
		<li><a href="approvestudentlist" > Pending students</a></li>
		<li><a href="viewstudent" >View Student</a></li>
		<li  ><a  href="MonthlyCloudUsage.jsp?page=college">  Total Cloud Usage </a></li>
					 <li  ><a  href="MonthlyCloudRent.jsp"> Monthly Cloud Usage Statistics </a></li>
					 <li ><a    href="YearlyUserPayments.jsp">  Payment Summary </a></li>
				
		
		
		 
		
								 <%}
        else if(session.getAttribute("usertype").toString().trim().equals("cloudadmin"))
    	{
    	%>
    	<li><a href="approveColglist" > Pending Colleges</a></li>
		<li><a href="viewColg" >View Colleges</a></li>
 
		<li  ><a  href="MonthlyCloudUsage.jsp?page=admin">  Total Cloud Usage </a></li>
					 <li  ><a  href="MonthlyCloudRent.jsp"> Monthly Cloud Usage Statistics </a></li>
					 <li ><a    href="YearlyPayment History.jsp">  Payment Summary </a></li>
					
  
        <%}
        else if(session.getAttribute("usertype").toString().trim().equals("staff"))
                            	{
                            	%>
                            	  <li><a href="viewMyAllottedSubjects" >View My Allotted Subjects </a></li>
		
                            	 
        <li><a href="/RegUnit">Unit Registration</a></li>
      <li><a href="RegQues" >Register Questions</a></li>
	
	 
		 <li><a href="RegExam">Schedule Exam</a> 
		
		</li>
		<li><a href="viewPendingExams">View Pending Exams</a>
		<li><a href="viewScheduledExams">View Scheduled Exams</a>
		<li><a href="viewConductedExams">View Conducted Exams</a>
		 
		<!-- 	<li><a href="viewQues">View Questions</a></li>
		 
         -->
		   
         
                            	<li class="nav-item"><a  class="nav-link" href="editProfile1" >My Profile</a></li>
                                 <li class="nav-item"><a  class="nav-link" href="viewstudent" >View Students</a></li>
                             
                            	<%} else if(session.getAttribute("usertype").toString().trim().equals("student"))
                            	{
                            	%>
                            	<li class="nav-item"><a  class="nav-link" href="editProfile" >Edit Profile</a></li>
                            <li class="nav-item"><a  class="nav-link" href="viewConductedExamsStud" >Exam Result</a></li>
                            
                             <%} %> 
                            	<li class="nav-item"><a  class="nav-link" href="ChangePass">Change Password</a></li>
								<li class="nav-item"><a  class="nav-link" href="logout">Logout</a></li>
        <!--<li><a class="drop" href="#">Pages</a>
          <ul>
            <li><a href="pages/gallery.html">Gallery</a></li>
            <li><a href="pages/full-width.html">Full Width</a></li>
            <li><a href="pages/sidebar-left.html">Sidebar Left</a></li>
            <li><a href="pages/sidebar-right.html">Sidebar Right</a></li>
            <li><a href="pages/basic-grid.html">Basic Grid</a></li>
            <li><a href="pages/font-icons.html">Font Icons</a></li>
          </ul>
        </li>-->
        <!--<li><a class="drop" href="#">Dropdown</a>
          <ul>
            <li><a href="#">Level 2</a></li>
            <li><a class="drop" href="#">Level 2 + Drop</a>
              <ul>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
              </ul>
            </li>
            <li><a href="#">Level 2</a></li>
          </ul>
        </li>-->
       
         
      </ul>
    </div>
    <div class="col-md-9">    <!--start-image-slider---->
		<div class="image-slider">
		<!-- Slid                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   eshow 1 -->
		  <ul class="rslides" id="slider1">
		    <li><img src="images/banner2.jpg" alt=""></li>
			 
		  </ul>
	    <!-- Slideshow 2 -->
	   </div> 
     <h6 class="heading"> Logged in as <%=session.getAttribute("userid").toString() %> (<%=session.getAttribute("usertype").toString() %>)
	</h6>
			<%try{
   Date dt=new Date();
 UpdateCloudRent upd=new UpdateCloudRent();
   upd.updcloudrent((dt.getMonth()+1),(dt.getYear()+1900));
}catch(Exception ex)
{
    	System.out.println("err="+ex.getMessage());
    	 
}%>	  
<%} catch(Exception ex)
{
    	System.out.println("err="+ex.getMessage());
    	 
}%>	 
			 <div class="jumbotron">  