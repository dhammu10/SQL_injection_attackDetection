package models;

import java.sql.*;
import  beans.*;
import java.util.*;

public class ViewColg {

	private String userid,colgName,course;
	private String usernm;
	private String emailid;
	private String mobileno;
	private String gender;
	private String dob;
	private String addr;
	private String collegeid;
	private String lastseen;
	
	
	
	public String getColgName() {
		return colgName;
	}
	public void setColgName(String colgName) {
		this.colgName = colgName;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getLastseen() {
		return lastseen;
	}
	public void setLastseen(String lastseen) {
		this.lastseen = lastseen;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	  
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCollegeid() {
		return collegeid;
	}
	public void setCollegeid(String collegeid) {
		this.collegeid = collegeid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	
	public List<ViewColg> getColgReport(){
		
		GetConnection gc = new GetConnection();
		Connection con;
		List<ViewColg> lst = new ArrayList<ViewColg>();
		
		ResultSet rs;
		
		try {
		
		con= gc.getConnection();
		Statement st=con.createStatement();
		rs=st.executeQuery("select * from colleges where userstatus='active'");
		ViewColg vs;
		LoginTracker login=new LoginTracker();
		while(rs.next()) {
			
			vs= new ViewColg();
			vs.setUserid(rs.getString("userid"));
			vs.setUsernm(rs.getString("usernm"));
			vs.setEmailid(rs.getString("emailid"));
			vs.setMobileno(rs.getString("mobileno"));
			vs.setGender(rs.getString("gender"));
			vs.setColgName(rs.getString("collegeName"));
			vs.setDob(rs.getString("dob"));
			vs.setAddr(rs.getString("addr"));
			vs.setLastseen(login.getLastSeen(rs.getString("userid").toString().trim()));
			lst.add(vs);
		}
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return(lst);
	}
	
	 
}
