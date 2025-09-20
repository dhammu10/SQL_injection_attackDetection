package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.springframework.web.multipart.MultipartFile;

import beans.GetConnection;

public class College {
	private String userid;
	private String usernm,colgName,addr;
	private String pswd;
	private String usertype;
	private String userstatus;
	private String emailid;
	private String mobileno;
	private String gender;
	private String semester;
	private String dob;
	private String branch;
	private MultipartFile file;
	private String path;
	private int courseId;
	
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getColgName() {
		return colgName;
	}
	public void setColgName(String colgName) {
		this.colgName = colgName;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getGender() {
		return gender;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getUserid() {
		return userid;
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
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getUserstatus() {
		return userstatus;
	}
	public void setUserstatus(String userstatus) {
		this.userstatus = userstatus;
	}
public List<College> getColgReport(String userid1){
		
		GetConnection gc = new GetConnection();
		Connection con;
		List<College> lst = new ArrayList<College>();
		System.out.println("userid="+userid1);
		ResultSet rs;
		
		try {
		
		con= gc.getConnection();
		Statement st=con.createStatement();
		rs=st.executeQuery("select * from colleges where userid='"+userid1+"'");
		College vs;
		 
		while(rs.next()) {
			
			vs= new College();
			vs.setUserid(rs.getString("userid"));
			vs.setUsernm(rs.getString("usernm"));
			vs.setEmailid(rs.getString("emailid"));
			vs.setMobileno(rs.getString("mobileno"));
			vs.setGender(rs.getString("gender"));
			vs.setBranch(rs.getString("branch"));
			vs.setDob(rs.getString("dob"));
			vs.setColgName(rs.getString("collegeName"));
			vs.setUsertype(rs.getString("usertype"));
			lst.add(vs);
		}
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return(lst);
	}
	
	
	public String addNewCollege()
	{
		GetConnection gc = new GetConnection();
		int y=0;
		
		Connection con;
		String st="";
		try {
		con=gc.getConnection();
		PreparedStatement pst;
		
		pst=con.prepareStatement("insert into users values(?,?,?,?,?,?,?);");

		pst.setString(1,userid);
		pst.setString(2,usernm);
		pst.setString(3,pswd);
		pst.setString(4,usertype);
		pst.setString(5,"pending");
		pst.setString(6,"NA");
		pst.setString(7,"NA");
		

		int x=pst.executeUpdate();
		
		if(x>0) {
			
			pst=con.prepareStatement("insert into colleges values(?,?,?,?,?,?,?,?,?,?,?,?)");
			
			pst.setString(1,userid);
			pst.setString(2,usernm);
			pst.setString(3,usertype);
		 
			pst.setString(4, colgName);
			pst.setString(5,mobileno);
			pst.setString(6,emailid);
			pst.setString(7, dob);
			pst.setString(8, gender);
			pst.setString(9, "pending");
			pst.setString(10, path);
			pst.setString(11, userid);
			pst.setString(12, addr);
			 	y=pst.executeUpdate();
		}
		else
			st="failure";
		
		if(y>0)
			st="success";
		else
			st="failure";
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return st;
		
		
	}
	public String updateColg(String userid1)
	{
		GetConnection gc = new GetConnection();
		int y=0;
		
		Connection con;
		String st="";
		try {
		con=gc.getConnection();
		PreparedStatement pst;
		
		 if(!path.equals("NA"))
		 {
			pst=con.prepareStatement("update colleges set mobileno=?,addr=?,emailid=?,photo=?,dob=? where userid=?");
			 
			pst.setString(1,mobileno);
			pst.setString(2,addr);
			pst.setString(3, emailid);
			pst.setString(4, path);
			pst.setString(5, dob);
			pst.setString(6, userid1);
		 }
		else
		{
			pst=con.prepareStatement("update colleges set mobileno=?,addr=?,emailid=?,dob=?  where userid=?");
			 
			pst.setString(1,mobileno);
			pst.setString(2,addr);
			pst.setString(3, emailid); 
			pst.setString(4, dob);
			pst.setString(5, userid1);
		}
			y=pst.executeUpdate();
		 
		
		if(y>0)
			st="success";
		else
			st="failure";
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return st;
		
		
	}

}
