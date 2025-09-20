package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import  beans.*;


public class QuestionTypes {
	
	private String quesType;
	private double marks;
	Connection con;
	CallableStatement csmt;
	ResultSet rs;
	List<QuestionTypes> lstQuesTypes;
	 
	 
	public String getQuesType() {
		return quesType;
	}
	public void setQuesType(String quesType) {
		this.quesType = quesType;
	}
	public double getMarks() {
		return marks;
	}
	public void setMarks(double marks) {
		this.marks = marks;
	}
	public List<QuestionTypes> getLstQuesTypes() {
		return lstQuesTypes;
	}
	public void setLstQuesTypes(List<QuestionTypes> lstQuesTypes) {
		this.lstQuesTypes = lstQuesTypes;
	}
	public QuestionTypes()
	{
		
	}
	public QuestionTypes(ResultSet rs)
	{
		try
		{
		quesType=rs.getString("qstType");
		marks=rs.getDouble("marks");
		 
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("errr in branch="+e.getMessage());
		}
	}
	
	
	   

	public String registerQuesType() {
	 
	PreparedStatement pst;
	GetConnection gc = new GetConnection();
	String sts="";
	
	try {
		con=gc.getConnection();
		
		pst=con.prepareStatement("insert into qst values(?,?,?);");
		pst.setInt(1, getId());
		pst.setString(2, quesType);
		pst.setDouble(3,marks );
		int x= pst.executeUpdate();
		
		if(x>0)
			sts="Success.jsp";
		else
			sts="Failure.jsp";
	}
	catch(Exception ex) {
		System.out.println("err="+ex.getMessage());
		ex.printStackTrace();
	}
	return(sts);
	}
 	public int getId()
    {
 		int mxid=1000;
        try
        {
    	PreparedStatement pst;
    	GetConnection gc = new GetConnection();
    	
             
            con=gc.getConnection();
          CallableStatement csmt=con.prepareCall("{call getMaxIdQst()}");
           
             csmt.execute();
            ResultSet rs=csmt.getResultSet();
                        
            boolean auth=false;
            while(rs.next())
            { System.out.println("true");
                auth=true;
                
                mxid=rs.getInt("mxid");
                  
            }
        }
           
         
        catch(Exception ex)
        {
            System.out.println("err="+ex.getMessage());
             
        }
        return (mxid+1);
    } 
 	public void getQuesTypes()
 	{
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getQuesTypes()}"); 
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	        lstQuesTypes=new ArrayList<QuestionTypes>();    
 	        while(rs.next())
 	        { System.out.println("true");
 	       lstQuesTypes.add(new QuestionTypes(rs)); 
 	        }
 	    }
 	       
 	     
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	}
 	public double getMarks1()
 	{
 		double marks=0;
 	    try
 	    {
 	    	GetConnection obj = new GetConnection();
 	         
 	        con=obj.getConnection() ;
 	        csmt=con.prepareCall("{call getQMarks(?)}");
 	        csmt.setString(1, quesType);
 	         csmt.execute();
 	         rs=csmt.getResultSet();
 	          while(rs.next())
 	        { System.out.println("true");
 	       marks=rs.getDouble("marks");
 	        }
 	    }
 	       
 	     
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	    return marks;
 	}
}
