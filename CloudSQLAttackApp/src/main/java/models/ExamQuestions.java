package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import  beans.*;


public class ExamQuestions {
	private int examId,exQuesId,quesId;
	private String ques,questype,userid,grade;
	private double marks,examMarks; 
	List<ExamQuestions> lstques;
	Connection con;
	CallableStatement csmt;
	ResultSet rs;
	 
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public double getExamMarks() {
		return examMarks;
	}
	public void setExamMarks(double examMarks) {
		this.examMarks = examMarks;
	}
	public List<ExamQuestions> getLstques() {
		return lstques;
	}
	public void setLstques(List<ExamQuestions> lstques) {
		this.lstques = lstques;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public int getExQuesId() {
		return exQuesId;
	}
	public void setExQuesId(int exQuesId) {
		this.exQuesId = exQuesId;
	}
	public int getQuesId() {
		return quesId;
	}
	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	public String getQuestype() {
		return questype;
	}
	public void setQuestype(String questype) {
		this.questype = questype;
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
	public ExamQuestions()
	{
		
	}
	public ExamQuestions(ResultSet rs)
	{
		try
		{
			exQuesId=rs.getInt("exQuesId");
			examId=rs.getInt("examId");
			quesId=rs.getInt("quesId");
			ques=rs.getString("ques");
		marks=rs.getDouble("marks");
		questype=rs.getString("quesType");
		userid=rs.getString("userid");
		 
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("err in constr"+e.getMessage());
		}
	}
	public void getQuestions()
 	{
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getExamQues(?)}"); 
 	       csmt.setInt(1, examId);
 	      
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	           lstques=new ArrayList<ExamQuestions>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       lstques.add(new ExamQuestions(rs)); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	} 
	public void getQuestionsStud()
 	{
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getExamQuesStud(?,?)}"); 
 	       csmt.setInt(1, examId);
 	      csmt.setString(2, userid);
 	      
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	           lstques=new ArrayList<ExamQuestions>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       lstques.add(new ExamQuestions(rs)); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	} 
	public List<ExamQuestions> getResult()
 	{
		List<ExamQuestions> lstresult=new ArrayList<ExamQuestions>();
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getResult(?,?)}"); 
 	        csmt.setString(1, userid);
 	        csmt.setInt(2, examId); 
 	      
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	        lstresult=new ArrayList<ExamQuestions>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       ExamQuestions obj1=new ExamQuestions();
 	       obj1.setExamId(rs.getInt("examId"));
 	       obj1.setExamMarks(rs.getDouble("examMarks"));
 	       obj1.setMarks(rs.getDouble("marks"));
 	       obj1.setQues(rs.getString("ques"));
 	       obj1.setQuesId(rs.getInt("quesId"));
 	       obj1.setQuestype(rs.getString("quesType"));
 	       obj1.setUserid(rs.getString("userid"));
 	       lstresult.add(obj1); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	    return lstresult;
 	} 
}
