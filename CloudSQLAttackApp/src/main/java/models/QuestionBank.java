package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import  beans.*;


public class QuestionBank {
	private int subId,unitId,quesId;
	private String ques,quesType,yesNotype,OneSentence;
	private String userid,collegeid,answer,option1,option2,option3,option4;
	private double marks;
	List<QuestionBank> lstques;
	Connection con;
	CallableStatement csmt;
	ResultSet rs;
	public String getCollegeid() {
		return collegeid;
	}
	public void setCollegeid(String collegeid) {
		this.collegeid = collegeid;
	} 
	  
	public String getYesNotype() {
		return yesNotype;
	}
	public void setYesNotype(String yesNotype) {
		this.yesNotype = yesNotype;
	}
	public String getOneSentence() {
		return OneSentence;
	}
	public void setOneSentence(String oneSentence) {
		OneSentence = oneSentence;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	public int getSubId() {
		return subId;
	}
	public void setSubId(int subId) {
		this.subId = subId;
	}
	public int getUnitId() {
		return unitId;
	}
	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}
	public String getQues() {
		return ques;
	}
	
	public int getQuesId() {
		return quesId;
	}
	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	public String getQuesType() {
		return quesType;
	}
	public void setQuesType(String quesType) {
		this.quesType = quesType;
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
	public List<QuestionBank> getLstques() {
		return lstques;
	}
	public void setLstques(List<QuestionBank> lstques) {
		this.lstques = lstques;
	}
	public QuestionBank()
	{
		
	}
	public QuestionBank(ResultSet rs)
	{
		try
		{
			quesId=rs.getInt("quesId");
		subId=rs.getInt("subId");
		marks=rs.getDouble("marks");
		unitId=rs.getInt("unitId");
		quesType=rs.getString("quesType");
		ques=rs.getString("ques").toString().trim();
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
 	        csmt=con.prepareCall("{call getQuestions(?)}"); 
 	       csmt.setInt(1, unitId); 
 	       
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	           lstques=new ArrayList<QuestionBank>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       lstques.add(new QuestionBank(rs)); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	}
	public boolean insertQues() {
	
	Connection con;
	CallableStatement csmt;
	GetConnection gc = new GetConnection();
	String sts="";
	
	try {
		con=gc.getConnection();
		 Date dt1=new Date();
		 String dt=dt1.getDate()+"/"+(dt1.getMonth()+1)+"/"+(dt1.getYear()+1900);
		 csmt=con.prepareCall("{call insertQuesBank(?,?,?,?,?,?,?,?,?,?,?,?)}");
		 csmt.setInt(1, subId);
		 csmt.setInt(2, unitId);
		 csmt.setDouble(3, marks);
		  csmt.setString(4, userid);
	        csmt.setString(5,ques);
	        csmt.setString(6, quesType);
	        if(quesType.trim().equals("OneSentence"))
	        {
	        	 csmt.setString(7, OneSentence);
		 	        csmt.setString(8, "NA");
		 	        csmt.setString(9,  "NA");
		 	        csmt.setString(10,  "NA");
		 	        csmt.setString(11,  "NA");
	        }
	        else if(quesType.trim().equals("YesNoType"))
	        {
	        	 csmt.setString(7, yesNotype);
	 	        csmt.setString(8, "NA");
	 	        csmt.setString(9,  "NA");
	 	        csmt.setString(10,  "NA");
	 	        csmt.setString(11,  "NA");
	        }
	        else
	        {
	        csmt.setString(7, answer);
	        csmt.setString(8, option1);
	        csmt.setString(9, option2);
	        csmt.setString(10, option3);
	        csmt.setString(11, option4);
	        }
	        csmt.setString(12, collegeid);
	         System.out.println("data="+subId+" "+userid+" "+unitId+" "+marks+" "+ques );
	         
	         csmt.execute();
 	         ResultSet rs=csmt.getResultSet(); 
	       while (rs.next())
	        {
	    	   quesId=rs.getInt("mxid");
	            
	            System.out.println("true"+quesId);
	            
	        } 
	       return true; 
	}
	catch(Exception ex) {
		System.out.println("err="+ex.getMessage());
		ex.printStackTrace();
		return false; 
	}
	 
	}
 	 
}
