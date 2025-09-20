package models;

import java.sql.*;
import  beans.*;
import java.util.*;

public class ViewColgList {
	
	private String userid;
	private String usernm;
	private String usertype;
	private String userstatus;
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
	
	
	public List<ViewColgList> getapprovalList(){
		
		Connection con;
		GetConnection gc = new GetConnection();
		Statement st;
		List<ViewColgList> lst = new ArrayList<ViewColgList>();
		ResultSet rs;
		
		try {
			
			con=gc.getConnection();
			st=con.createStatement();
			
			rs=st.executeQuery("select userid,usernm,userstatus,usertype from users where userstatus='pending' and (usertype='college' )");
			
			ViewColgList vsl;
			
			while(rs.next()) {
				
				vsl= new ViewColgList();
				vsl.setUserid(rs.getString("userid"));
				vsl.setUsernm(rs.getString("usernm"));
				vsl.setUserstatus(rs.getString("userstatus"));
				vsl.setUsertype(rs.getString("usertype"));
				
				lst.add(vsl);
				
				
			}
			
			
		}
		
		catch(Exception ex) {
			ex.printStackTrace();
		}
	
		return(lst);
	}
	
	
	
}
