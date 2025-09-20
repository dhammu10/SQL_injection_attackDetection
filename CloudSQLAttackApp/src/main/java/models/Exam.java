package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

import  beans.*;


public class Exam {
	private int examId,totalQuesAdded,duration,totalQues,semester,subId,courseId,quesId;
	private String title,currentSts,collegeid,enddt,dt,tm,branchname,course,subnm;
	private double totalmarksOfAddedQues;
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getCourseId() {
		return courseId;
	}
	
	
	public String getCollegeid() {
		return collegeid;
	}
	public void setCollegeid(String collegeid) {
		this.collegeid = collegeid;
	}
	public String getCurrentSts() {
		return currentSts;
	}
	public void setCurrentSts(String currentSts) {
		this.currentSts = currentSts;
	}
	public String getEnddt() {
		return enddt;
	}
	public void setEnddt(String enddt) {
		this.enddt = enddt;
	}
	public int getTotalQuesAdded() {
		return totalQuesAdded;
	}
	public void setTotalQuesAdded(int totalQuesAdded) {
		this.totalQuesAdded = totalQuesAdded;
	}
	public double getTotalmarksOfAddedQues() {
		return totalmarksOfAddedQues;
	}
	public void setTotalmarksOfAddedQues(double totalmarksOfAddedQues) {
		this.totalmarksOfAddedQues = totalmarksOfAddedQues;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourse() {
		return course;
	}
	
	public int getQuesId() {
		return quesId;
	}
	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}
	public String getSubnm() {
		return subnm;
	}
	public void setSubnm(String subnm) {
		this.subnm = subnm;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	private String userid,sts;
	private double marks;
	List<Exam> lstexam;
	Connection con;
	CallableStatement csmt;
	ResultSet rs;
	 
	   
	 
	public int getSubId() {
		return subId;
	}
	public void setSubId(int subId) {
		this.subId = subId;
	}
	public String getBranchname() {
		return branchname;
	}
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}
	 
	public String getSts() {
		return sts;
	}
	public void setSts(String sts) {
		this.sts = sts;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getTotalQues() {
		return totalQues;
	}
	public void setTotalQues(int totalQues) {
		this.totalQues = totalQues;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public String getTm() {
		return tm;
	}
	public void setTm(String tm) {
		this.tm = tm;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public double getMarks() {
		return marks;
	}
	public void setMarks(double marks) {
		this.marks = marks;
	}
	public List<Exam> getLstexam() {
		return lstexam;
	}
	public void setLstexam(List<Exam> lstexam) {
		this.lstexam = lstexam;
	}
	public Exam()
	{
		
	}
	public Exam(ResultSet rs)
	{
		try
		{subId=rs.getInt("subId");
			examId=rs.getInt("examId");
			duration=rs.getInt("duration");
		marks=rs.getDouble("marks");
		totalQues=rs.getInt("noQuestions");
		userid=rs.getString("userid");
		title=rs.getString("title").toString().trim();
		userid=rs.getString("userid");
		subnm=rs.getString("subName");
		branchname=rs.getString("branch");
		course=rs.getString("course");
		semester=rs.getInt("sem");
		dt=rs.getString("dt");
		tm=rs.getString("tm");
		sts=rs.getString("sts");
		try
		{
			totalQuesAdded=rs.getInt("quesNo");
			totalmarksOfAddedQues=rs.getDouble("TotalMarksOFRegisteredQues");
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		try
		{

		      Hashtable<Integer,String> ht=new Hashtable<>();
		      ht.put(1, "January"); 
		      ht.put(2, "February");
		      ht.put(3, "March");
		      ht.put(4, "April");
		      ht.put(5, "May");
		      ht.put(6, "June");
		      ht.put(7, "July");
		      ht.put(8, "August");
		      ht.put(9, "September");
		      ht.put(10, "October");
		      ht.put(11, "November");
		      ht.put(12, "December");
		      String edt=rs.getString("enddt");
		      String[] str=edt.split("\\ ");
		      String[] s=str[0].split("\\-");
		      enddt=ht.get(Integer.parseInt(s[1].trim()))+" "+s[2]+", "+s[0]+" "+str[1]; 
		      
			//enddt=rs.getString("enddt");
			 
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		try
		{
			currentSts=rs.getString("currentSts").trim();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("err in constr"+e.getMessage());
		}
	}
	public void getExam()
 	{
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getExamPending(?)}"); 
 	       csmt.setString(1, userid);
 	      
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	           lstexam=new ArrayList<Exam>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       lstexam.add(new Exam(rs)); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	}
 	public void getConductedExamsStud()
 	{
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getExamConductedStud(?)}"); 
 	       csmt.setString(1, userid);
 	      
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	           lstexam=new ArrayList<Exam>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       lstexam.add(new Exam(rs)); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	}
	public void getConductedExams()
 	{
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getExamConducted(?)}"); 
 	       csmt.setString(1, userid);
 	      
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	           lstexam=new ArrayList<Exam>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       lstexam.add(new Exam(rs)); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	}
	public void getScheduledExams1()
 	{
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getExamScheduled(?)}"); 
 	       csmt.setString(1, userid);
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	           lstexam=new ArrayList<Exam>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       lstexam.add(new Exam(rs)); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	}
	public void getScheduledExam()
 	{
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getScheduledExamsStud(?,?,?,?,?)}"); 
 	       csmt.setString(1, branchname);
 	      csmt.setInt(2, semester);
 	     csmt.setString(3, course);
 	    csmt.setString(4, userid);
 	   csmt.setString(5, collegeid);
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	           lstexam=new ArrayList<Exam>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       lstexam.add(new Exam(rs)); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	}
	public void getExamStud()
 	{
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getExam(?,?,?)}"); 
 	       csmt.setString(1, branchname);
 	      csmt.setInt(2, semester);
 	     csmt.setInt(3, subId);
 	       
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	           lstexam=new ArrayList<Exam>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       lstexam.add(new Exam(rs)); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	}
	public boolean insertExam() {
	
	Connection con;
	CallableStatement csmt;
	GetConnection gc = new GetConnection();
	String sts="";
	
	try {
		con=gc.getConnection();
		  csmt=con.prepareCall("{call insertExam(?,?,?,?,?,?,?,?,?,?,?,?)}");
		 csmt.setString(1, title);
		 csmt.setString(2, dt);
		 csmt.setString(3,tm );
		  csmt.setInt(4, duration);
	        csmt.setInt(5,totalQues);
	        csmt.setDouble(6, marks);
	        csmt.setString(7, userid);
	        csmt.setString(8, branchname);
	        csmt.setInt(9, semester);
	        csmt.setInt(10, courseId);
	        csmt.setInt(11, subId);
	        csmt.setString(12, collegeid);
	         int n=csmt.executeUpdate(); 
	        if(n>0)
	        {
	            try{con.close();}catch(Exception ex){}
	            System.out.println("true");
	            return true;
	        }
	        else
	            return false; 
	}
	catch(Exception ex) {
		System.out.println("err="+ex.getMessage());
		ex.printStackTrace();
		return false; 
	}
	 
	}
	public boolean insertAExam() {
		
		Connection con;
		CallableStatement csmt;
		GetConnection gc = new GetConnection();
		String sts="";
		
		try {
			con=gc.getConnection();
			  csmt=con.prepareCall("{call insertAExam(?,?)}");
			 csmt.setInt(1, examId);
			 csmt.setString(2, userid); 
		          
		         int n=csmt.executeUpdate(); 
		        if(n>0)
		        {
		            try{con.close();}catch(Exception ex){}
		            System.out.println("true");
		            return true;
		        }
		        else
		            return false; 
		}
		catch(Exception ex) {
			System.out.println("err="+ex.getMessage());
			ex.printStackTrace();
			return false; 
		}
		 
		}
	public boolean insertExamQues() {
		
		Connection con;
		CallableStatement csmt;
		GetConnection gc = new GetConnection();
		String sts="";
		
		try {
			con=gc.getConnection();
			  csmt=con.prepareCall("{call insertExamQuestions(?,?,?)}");
			 csmt.setInt(1, examId);
			 csmt.setInt(2, quesId);
			 csmt.setString(3,userid );
			   
		         int n=csmt.executeUpdate(); 
		        if(n>0)
		        {
		            try{con.close();}catch(Exception ex){}
		            System.out.println("true");
		            return true;
		        }
		        else
		            return false; 
		}
		catch(Exception ex) {
			System.out.println("err="+ex.getMessage());
			ex.printStackTrace();
			return false; 
		}
		 
		}
}
