package models;

import java.sql.*;
import java.util.Vector;

import beans.*;
import services.CloudFuns;
import services.Mail;

public class ApproveCollege {
	
	

	public  String updateColgStatus(String userid) {
		

		Connection con;
		PreparedStatement pst;
		GetConnection gc = new GetConnection();
		String sts="";
		try {
			con=gc.getConnection();
			
			pst=con.prepareStatement("update users SET userstatus='active' where userid=?;");
			pst.setString(1, userid);
			
			int x=pst.executeUpdate();
			
			if(x>0) {
				
				pst=con.prepareStatement("update colleges SET userstatus='active' where userid=?");
				pst.setString(1, userid);
				
				x=pst.executeUpdate();
				Mail mail=new Mail();
				String msg="Dear "+userid+", your account has been approved by the administrator";
				JavaFuns jf=new JavaFuns();
				Vector v=jf.getValue("select emailid from colleges where userid='"+userid.trim()+"'", 1);
				
				try
				{
					if(mail.sendMail(msg,v.elementAt(0).toString().trim(), "Account Approval")) {
						CloudFuns cf=new CloudFuns();
						cf.recordusage(userid, "email");
						
					}
				}
				catch (Exception e) {
					// TODO: handle exception
				}
			}			
			else
				sts="failure";
			
			if(x>0)
				sts="success";
			else
				sts="failure";
			System.out.println("sts="+sts+" x="+x);
		}
		
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return(sts);
	}
	
}
