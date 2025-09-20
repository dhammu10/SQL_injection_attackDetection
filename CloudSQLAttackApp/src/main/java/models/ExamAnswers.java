package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpSession;
 

import  beans.*;
 
  

public class ExamAnswers {
	private int  quesId,ansid,examId;
	private String userid,ans,dt,ques,quesType,ansType,answer,yesNoType,objective,details;
	private double marks,CosineSim,fuzzySim,amarks,cosinesim,fwsimilarity;  
	List<ExamAnswers> lstans;
	Connection con;
	CallableStatement csmt;
	ResultSet rs; 
    PreparedStatement pst;

	    
	public String getObjective() {
		return objective;
	}

	public void setObjective(String objective) {
		this.objective = objective;
	}

	public double getCosineSim() {
		return CosineSim;
	}

	public void setCosineSim(double cosineSim) {
		CosineSim = cosineSim;
	}

	public double getFuzzySim() {
		return fuzzySim;
	}

	public void setFuzzySim(double fuzzySim) {
		this.fuzzySim = fuzzySim;
	}

	public int getQuesId() {
		return quesId;
	}

	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}

	public int getAnsid() {
		return ansid;
	}

	public void setAnsid(int ansid) {
		this.ansid = ansid;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
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

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public String getQues() {
		return ques;
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

	public String getAnsType() {
		return ansType;
	}

	public void setAnsType(String ansType) {
		this.ansType = ansType;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getYesNoType() {
		return yesNoType;
	}

	public void setYesNoType(String yesNoType) {
		this.yesNoType = yesNoType;
	}

	 

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public double getMarks() {
		return marks;
	}

	public void setMarks(double marks) {
		this.marks = marks;
	}

	public double getAmarks() {
		return amarks;
	}

	public void setAmarks(double amarks) {
		this.amarks = amarks;
	}

	public double getCosinesim() {
		return cosinesim;
	}

	public void setCosinesim(double cosinesim) {
		this.cosinesim = cosinesim;
	}

	public double getFwsimilarity() {
		return fwsimilarity;
	}

	public void setFwsimilarity(double fwsimilarity) {
		this.fwsimilarity = fwsimilarity;
	}

	public List<ExamAnswers> getLstans() {
		return lstans;
	}

	public void setLstans(List<ExamAnswers> lstans) {
		this.lstans = lstans;
	}

	public ExamAnswers()
	{
		
	}
	 
	public ExamAnswers(ResultSet rs)
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
 	           lstans=new ArrayList<ExamAnswers>();          
 	        while(rs.next())
 	        { System.out.println(rs.toString());
 	       lstans.add(new ExamAnswers(rs)); 
 	        }
 	    } 
 	    catch(Exception ex)
 	    {
 	        System.out.println("err="+ex.getMessage());
 	         
 	    }
 	}
	public boolean insertExamAns(HttpSession ses) {
		
		Connection con;
		CallableStatement csmt;
		GetConnection gc = new GetConnection();
		String sts="";
		boolean flag=false;
		try {
			con=gc.getConnection();
			 Date dt1=new Date();
			 String dt=dt1.getDate()+"/"+(dt1.getMonth()+1)+"/"+(dt1.getYear()+1900);
			 csmt=con.prepareCall("{call insertAExamAnswers(?,?,?,?,?,?,?,?,?,?,?)}");
			 csmt.setInt(1, examId);
			 csmt.setInt(2, quesId);
			 csmt.setString(3, userid);
			 csmt.setString(4, ans.trim());
			 csmt.setString(5, ansType);
			  csmt.setDouble(6, marks);
			  
			 // calculateSim();
			  csmt.setDouble(7, 0);
			  csmt.setDouble(8,0);
			  String qr="(select ifnull((select ifnull(marks,0) as marks  from quesbank where quesId="+quesId+" and lower(answer) like concat('%','"+ans.toString().trim().toLowerCase()+"','%')),0) as marks);";
			  System.out.println("qr="+qr);
			  JavaFuns jf=new JavaFuns();
			  Vector v1=jf.getValue(qr, 1);
			  csmt.setDouble(9,Double.parseDouble(v1.elementAt(0).toString().trim()));
			  String qrr="select count(*) as attempts from quizliveperformance where userid='"+userid.trim()+"' and ques='"+ques+"' and qqid="+examId;
			  Vector v2=jf.getValue(qrr, 1);
			  csmt.setInt(10,Integer.parseInt(v2.elementAt(0).toString().trim()));
			 double reqtime=0;
			// double starttime=Double.parseDouble(ses.getAttribute("startTime").toString().trim());
			// double endtime=Double.parseDouble(ses.getAttribute("endTime").toString().trim());
			// reqtime=endtime-starttime;
			  csmt.setDouble(11, 0);
			  csmt.execute();
		         rs=csmt.getResultSet();
		        while(rs.next())
		        {
		        	flag=true;
		        	ansid=rs.getInt("ansId");
		        	System.out.println("answerid="+ansid);
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
	 
 	public void calculateSim()
 	{
 		double cosineSum=0,fwsum=0;
 		try
 		{
 			JavaFuns jf=new JavaFuns();
 			Vector v=jf.getValue("select ans from modelans where ansType='"+ansType+"' and quesId="+quesId,1);
 			for(int i=0;i<v.size();i++)
 			{
 				cosineSum+=CosineSimilarity.cosineSimilarity1(v.elementAt(i).toString().trim().toLowerCase(), ans.toLowerCase());
 				//fwsum+=FuzzySearch.ratio(v.elementAt(i).toString().trim().toLowerCase(), ans.toLowerCase());
 			}
 			CosineSim=cosineSum/v.size();
 			fuzzySim=fwsum/v.size();
 		}
 		catch (Exception e) {
			// TODO: handle exception
 			System.out.println("err="+e.getMessage());
		}
 	}
 	public String trackExamDetails(HttpSession ses) {
 	     
        try
       {
           Date dt=new Date();
           String d=(dt.getDate()+"/"+(dt.getMonth()+1)+"/"+(dt.getYear()+1900));
           GetConnection dbcon=new GetConnection();
        con=dbcon.getConnection();
        JavaFuns ff=new JavaFuns();
            
       String branch=ses.getAttribute("branch").toString();
       String userid=ses.getAttribute("userid").toString();
        int maxid=ff.FetchMax("id","QuizAnalysis");
        pst=con.prepareStatement("insert into QuizAnalysis values(?,?,?,?,?,?,?,?)");
        pst.setInt(1,maxid);
         pst.setString(2, userid);
         pst.setString(3,ques);
             pst.setString(4,ans);
         pst.setString(5,d);
        pst.setString(6, (dt.getHours()+":"+dt.getMinutes()));
          Vector vv=ff.getValue("select ques from quesbank where ques='"+ques+"' and lower(answer) like '%"+ans.toLowerCase()+"%'",1);
          if(vv.size()>0)
        pst.setString(7, "CorrectAnswer"); 
          else
              pst.setString(7, "WrongAnswer"); 
           pst.setInt(8, examId); 
        int n=pst.executeUpdate(); 
        
        System.out.println("update QuizLivePerformance set csts='prevAttempt' where ques='"+ques+"' and userid='"+ses.getAttribute("userid").toString().trim()+"'");
        if(ff.execute("update QuizLivePerformance set csts='prevAttempt' where ques='"+ques+"' and userid='"+ses.getAttribute("userid").toString().trim()+"'")){}
         maxid=ff.FetchMax("id","QuizLivePerformance");
        pst=con.prepareStatement("insert into QuizLivePerformance values(?,?,?,?,?,?,?,?,?,?)");
        pst.setInt(1,maxid);
         pst.setString(2, userid);
         pst.setString(3,ques);
            
         pst.setString(5,d);
        pst.setString(6, (dt.getHours()+":"+dt.getMinutes()));
          Vector vv1=ff.getValue("select answer from quesbank where ques='"+ques+"' and answer='"+ans+"'",1);
          if(vv1.size()>0)
          {
        pst.setString(7, "CorrectAnswer"); 
        pst.setString(9, "btn-success"); 
         pst.setString(4,vv1.elementAt(0).toString().trim());
          }
          else
          {
              Vector vv11=ff.getValue("select answer from quesbank where ques='"+ques+"'",1);
              pst.setString(7, "WrongAnswer"); 
              pst.setString(9, "btn-danger"); 
              pst.setString(4,vv11.elementAt(0).toString().trim());
          }
           pst.setString(8, "current"); 
           pst.setInt(10, examId); 
        int n1=pst.executeUpdate(); 
       }
        catch(Exception ex)
        {
            System.out.println("Error : "+ex.getMessage());
             
        }
        return "success";
           
     
   }
    
}
