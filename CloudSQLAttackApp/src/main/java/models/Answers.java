package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import  beans.*;


public class Answers {
	private int  quesId,ansid;
	private String userid,ans,define,dt,anstype;
	  
	List<Answers> lstques;
	Connection con;
	CallableStatement csmt;
	ResultSet rs;
	 
	   
	public String getDefine() {
		return define;
	}
	public void setDefine(String define) {
		this.define = define;
	}
	public String getAnstype() {
		return anstype;
	}
	public void setAnstype(String anstype) {
		this.anstype = anstype;
	}
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public int getQuesId() {
		return quesId;
	}
	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	 
	public Answers()
	{
		
	}
	
	public int getAnsid() {
		return ansid;
	}
	public void setAnsid(int ansid) {
		this.ansid = ansid;
	}
	public Answers(ResultSet rs)
	{
		try
		{
			quesId=rs.getInt("quesId");
	 
		dt=rs.getString("dt");
		ans=rs.getString("ans").toString().trim();
		userid=rs.getString("userid");
		  
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("err in constr"+e.getMessage());
		}
	}
	public void getAnswers()
 	{
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getAnswers(?)}"); 
 	       csmt.setInt(1, quesId); 
 	       
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	           lstques=new ArrayList<Answers>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       lstques.add(new Answers(rs)); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	}
	public boolean insertAns() {
	
	Connection con;
	CallableStatement csmt;
	GetConnection gc = new GetConnection();
	String sts="";
	boolean flag=false;
	try {
		con=gc.getConnection();
		 Date dt1=new Date();
		 String dt=dt1.getDate()+"/"+(dt1.getMonth()+1)+"/"+(dt1.getYear()+1900);
		 csmt=con.prepareCall("{call insertModelAns(?,?,?,?,?)}");
		 csmt.setInt(1, quesId);
		 csmt.setString(2, userid);
		 csmt.setString(3, dt);
		  csmt.setString(4, ans);
		  csmt.setString(5, anstype);
		  csmt.execute();
	         rs=csmt.getResultSet();
	        while(rs.next())
	        {
	        	flag=true;
	        	ansid=rs.getInt("ansId");
	            try{con.close();}catch(Exception ex){}
	            System.out.println("true");
	            return true;
	        }
	         
	            return flag; 
	}
	catch(Exception ex) {
		System.out.println("err="+ex.getMessage());
		ex.printStackTrace();
		return false; 
	}
	 
	}
 	 
}
