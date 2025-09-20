package cloud.sql.attack;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import beans.Base64Decoder;
import beans.DataSanitization;
import beans.GetURL;
import models.Answers;
import models.ApproveCollege;
import models.ApproveStudents;
import models.CheckUser;
import models.College;
import models.Courses;
import models.Exam;
import models.*;
import models.ExamQuestions;
import models.JavaFuns;
import models.Pass;
import models.PasswordRecovery;
import models.QuestionBank;
import models.QuestionTypes;
import models.RegisterBranch;
import models.Staff;
import models.Staff1;
import models.Student;
import models.Subjects;
import models.SubjectsAllocation;
import models.Units;
import models.ViewColg;
import models.ViewColgList;
import models.ViewStaff;
import models.ViewStudent;
import models.ViewStudentList;
import services.CloudFuns;

@Controller
public class CloudController implements ErrorController{
	@RequestMapping("/home")
	public String index()
	{
		return "index.jsp";
	}
	
	@RequestMapping("/cloudadmin")
	public String cloudadmin()
	{
		return "approveColglist";
	}
	 @RequestMapping("/registercolg")
		public ModelAndView registercolg(College stu,ServletRequest request)
		{
		 DataSanitization dobj=new DataSanitization();
	    	ModelAndView mv=new ModelAndView();
	    	if(dobj.checkSQLData(stu.getEmailid()))
	    	{
	    		mv.setViewName("Failure2.jsp?type=SQLAttack");
	    		mv.addObject("activity","SQLAttack");
	    	}
	    	else if(dobj.checkSQLData(stu.getColgName()))
	    	{
	    		mv.setViewName("Failure2.jsp?type=SQLAttack");
	    		mv.addObject("activity","SQLAttack");
	    	}
	    	else if(dobj.checkSQLData(stu.getUsernm()))
	    	{
	    		mv.setViewName("Failure2.jsp?type=SQLAttack");
	    		mv.addObject("activity","SQLAttack");
	    	}
	    	else if(dobj.checkSQLData(stu.getPswd()))
	    	{
	    		mv.setViewName("Failure2.jsp?type=SQLAttack");
	    		mv.addObject("activity","SQLAttack");
	    	}
	    	else if(dobj.checkSQLData(stu.getUserid()))
	    	{
	    		mv.setViewName("Failure2.jsp?type=SQLAttack");
	    		mv.addObject("activity","SQLAttack");
	    	}
	    	else
	    	{
			 try
			 {MultipartFile file=stu.getFile();
			 String filepath=request.getServletContext().getRealPath("/")+"/Uploads/";
			 
			 
			 System.out.println("path="+filepath);
			 File f=new File(filepath);
			 f.mkdir();
			  
			 try {
				  
				 String fileName=stu.getUserid()+"."+ file.getOriginalFilename().split("\\.")[1];
				 file.transferTo(new File(filepath+"/"+fileName));
				 stu.setPath(fileName);
				 String st=stu.addNewCollege();
					if(st.equals("success"))
						mv.setViewName("Success.jsp");
					else
						mv.setViewName("Failure.jsp");
			 }
			 catch (Exception e) {
				// TODO: handle exception
				 mv.setViewName("Failure.jsp");
			}}
			 catch (Exception e) {
					// TODO: handle exception
				 mv.setViewName("Failure.jsp");
				}
			 mv.addObject("activity","ColgReg");
	    	}
			 return mv;
			
		}
	 @RequestMapping("/approveColglist")
		@SessionScope
		public ModelAndView approvecolglist() {
			
			List<ViewColgList> lst = new ArrayList<ViewColgList>();
			ViewColgList vls= new ViewColgList();
			
			lst=vls.getapprovalList();
			ModelAndView mv=new ModelAndView();
			mv.addObject("stal",lst);
			mv.setViewName("UpdateColgStatus.jsp");
			return mv;
		
		}
	 @RequestMapping("/activateColg")
		public ModelAndView activateColg(String uid) {
			ModelAndView mv=new ModelAndView();
			ApproveCollege ap=new ApproveCollege();
			String sts=ap.updateColgStatus(uid);
			if(sts.equals("success"))
				 mv.setViewName("Success.jsp");
			else
				 mv.setViewName("Failure.jsp");
			mv.addObject("activity","ColgActivation");
			 return mv;
		}
	 @RequestMapping("/viewColg")
		@SessionScope
		public ModelAndView viewColg() {
			
			List<ViewColg> lst = new ArrayList<ViewColg>();
			ViewColg vs = new ViewColg();
			lst=vs.getColgReport();
			ModelAndView mv=new ModelAndView();
			mv.addObject("std",lst);
			mv.setViewName("ViewColgReport.jsp");
			return mv;
		}
	 
	@RequestMapping("/Courses")
	public ModelAndView Courses(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("Courses.jsp");
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/Semesters")
	public ModelAndView Semesters(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("Semesters.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		return mv;
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
        session.invalidate();
		return "Logout.jsp";
	}
 
	@RequestMapping("/Semesters1")
	public ModelAndView Semesters1(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("Semesters1.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/viewMyAllottedSubjects")
	public ModelAndView viewMyAllottedSubjects(HttpServletRequest request,HttpSession ses)
	{
		SubjectsAllocation obj=new SubjectsAllocation();
		obj.getSubjectsAllocationReportStaff(ses.getAttribute("userid").toString().trim());
		List<SubjectsAllocation> lst=obj.getLstsub();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("viewMyAllottedSubjects.jsp");
		mv.addObject("std",lst);
		return mv;
	}
	@SessionScope
	@RequestMapping("/ShowAllottedSubjects")
	public ModelAndView ShowAllottedSubjects(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowAllottedSubjects.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		mv.addObject("semester",request.getParameter("semester").toString().trim());
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/ShowAllottedSubjects1")
	public ModelAndView ShowAllottedSubjects1(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowAllottedSubjects1.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		mv.addObject("semester",request.getParameter("semester").toString().trim());
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/AddQues")
	public ModelAndView AddQues(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("AddQues.jsp");
		mv.addObject("subId",request.getParameter("subId").toString().trim());
		mv.addObject("examId",request.getParameter("examId").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/ShowQuestions")
	public ModelAndView ShowQuestions(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowQuestions.jsp");
		mv.addObject("unitId",request.getParameter("unitId").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/ShowQuestions111")
	public ModelAndView ShowQuestions111(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowQuestions111.jsp");
		mv.addObject("unitId",request.getParameter("unitId").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/ShowQMarks")
	public ModelAndView ShowQMarks(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowQMarks.jsp");
		mv.addObject("quesType",request.getParameter("quesType").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/ShowUnits")
	public ModelAndView ShowUnits(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowUnits1.jsp");
		mv.addObject("subId",request.getParameter("subId").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/ShowSubjects")
	public ModelAndView ShowSubjects(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowSubjects.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		mv.addObject("semester",request.getParameter("semester").toString().trim());
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		return mv;
	}
	
	@RequestMapping("/registerstudent")
	public String registerstudent()
	{
		return "Register.jsp";
	}
	@RequestMapping("/student")
	public String student()
	{
		return "Student.jsp";
	}
	@RequestMapping("/staff")
	public String staff()
	{
		return "Staff.jsp";
	}
	@RequestMapping("/admin")
	public String admin()
	{
		return "Admin.jsp";
	}
	 @RequestMapping("/error")
    public String handleError() {
        //do something like logging
		return "college";
    }
  
    public String getErrorPath() {
        return "/error";
    }
		  
    @RequestMapping("/college")
	public String college()
	{
		return "Admin.jsp";
	} 
    @RequestMapping("/registeruser")
	public ModelAndView registeruser(Student stu,ServletRequest request)
	{
    	DataSanitization dobj=new DataSanitization();
    	ModelAndView mv=new ModelAndView();
    	if(dobj.checkSQLData(stu.getEmailid()))
    	{
    		mv.setViewName("Failure2.jsp?type=SQLAttack");
    		mv.addObject("activity","SQLAttack");
    	}
    	else if(dobj.checkSQLData(stu.getUsernm()))
    	{
    		mv.setViewName("Failure2.jsp?type=SQLAttack");
    		mv.addObject("activity","SQLAttack");
    	}
    	else if(dobj.checkSQLData(stu.getUserid()))
    	{
    		mv.setViewName("Failure2.jsp?type=SQLAttack");
    		mv.addObject("activity","SQLAttack");
    	}
    	else if(dobj.checkSQLData(stu.getPswd()))
    	{
    		mv.setViewName("Failure2.jsp?type=SQLAttack");
    		mv.addObject("activity","SQLAttack");
    	}
    	else
    	{
		
		 try
		 {MultipartFile file=stu.getFile();
		 String filepath=request.getServletContext().getRealPath("/")+"/Uploads/";
		 
		 
		 System.out.println("path="+filepath);
		 File f=new File(filepath);
		 f.mkdir();
		  
		 try {
			  
			 String fileName=stu.getUserid()+"."+ file.getOriginalFilename().split("\\.")[1];
			 file.transferTo(new File(filepath+"/"+fileName));
			 stu.setPath(fileName);
			 String st=stu.addNewStudent();
				if(st.equals("success"))
					mv.setViewName("Success.jsp");
				else
					mv.setViewName("Failure.jsp");
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 mv.setViewName("Failure.jsp");
		}}
		 catch (Exception e) {
				// TODO: handle exception
			 mv.setViewName("Failure.jsp");
			}
		 mv.addObject("activity","StudReg");
    	}
		 return mv;
		
	}
	@RequestMapping("/updateuser")
	public ModelAndView updateuser(Student stu,ServletRequest request,HttpSession ses)
	{String fileName="NA";
		
	ModelAndView mv=new ModelAndView();
	try
		 {
			 stu.setUserid(ses.getAttribute("userid").toString().trim());
			 
		  
		 try {
			 MultipartFile file=stu.getFile();
			 String filepath=request.getServletContext().getRealPath("/")+"/Uploads/";
			 
			 
			 System.out.println("path="+filepath);
			 File f=new File(filepath);
			 f.mkdir();
			  fileName=stu.getUserid()+"."+ file.getOriginalFilename().split("\\.")[1];
			 file.transferTo(new File(filepath+"/"+fileName));
			 
		 }
		 catch (Exception e) {
			// TODO: handle exception
			// return "UserRegFailure.jsp";
		}
		 if(!fileName.equals("NA"))
		 {
			 ses.setAttribute("photo", fileName);
		 }
		 stu.setPath(fileName);
		 String st=stu.updateStudent(stu.getUserid());
		 if(st.equals("success"))
				mv.setViewName("Success.jsp");
			else
				mv.setViewName("Failure.jsp");
		 }
		 catch (Exception e) {
			 System.out.println("in update="+e.getMessage());
				// TODO: handle exception
			 mv.setViewName("Failure.jsp");
			}
		 mv.addObject("activity","StudProfile");
		 
		 return mv;
	}
	@RequestMapping("/updatestaff")
	public ModelAndView updatestaff(Staff1 stu,ServletRequest request,HttpSession ses)
	{
		ModelAndView mv=new ModelAndView();
		String fileName="NA";
		 try
		 {
			 stu.setUserid(ses.getAttribute("userid").toString().trim());
			
		 try {
			 MultipartFile file=stu.getFile();
			 String filepath=request.getServletContext().getRealPath("/")+"/Uploads/";
			 
			 
			 System.out.println("path="+filepath);
			 File f=new File(filepath);
			 f.mkdir();
			  
			  fileName=stu.getUserid()+"."+ file.getOriginalFilename().split("\\.")[1];
			 file.transferTo(new File(filepath+"/"+fileName));
			 
		 }
		 catch (Exception e) {
			// TODO: handle exception
			// return "UserRegFailure.jsp";
		}
		 if(!fileName.equals("NA"))
		 {
			 ses.setAttribute("photo", fileName);
		 }
		 stu.setPath(fileName);
		 String st=stu.updateStaff(stu.getUserid());
		 if(st.equals("success"))
				mv.setViewName("Success.jsp");
			else
				mv.setViewName("Failure.jsp");
		 }
		 catch (Exception e) {
			 System.out.println("in update="+e.getMessage());
				// TODO: handle exception
			 mv.setViewName("Failure.jsp");
			}
		 mv.addObject("activity","StaffProfile");
		 return mv;
	}
	@RequestMapping("/forgetpassword")
	public String forgetpassword() {
		
		return("ForgetPassword.jsp");
	}
	@RequestMapping("/recoverpassword")
	public String recoverpassword(PasswordRecovery pr) {
		
		String sts=pr.getNewPassword();
		
		return(sts);
	}
	@RequestMapping("/ChangePass")
	public String ChangePass()
	{
		return "ChangePass.jsp";
	}
	@RequestMapping("/ChangePassService")
	public ModelAndView ChangePassService(Pass eobj,HttpSession ses)
	{
		ModelAndView mv=new ModelAndView();
		 try
		 {
			 
			 eobj.setUserid(ses.getAttribute("userid").toString().trim());
			 if(eobj.changePassword())
			 { 
				 mv.setViewName("Success.jsp");
			 }
			 else
			 { 
				 mv.setViewName("Failure.jsp");
			 }
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 System.out.println("err="+e.getMessage());
			 mv.setViewName("Failure.jsp");
		}
		 mv.addObject("activity","changePass");
		 return mv;
		 
	}

	@RequestMapping("/registernewstaff")
	public ModelAndView registernewstaff(Staff f,HttpSession ses)
	{
		ModelAndView mv=new ModelAndView();
		f.setCollegeid(ses.getAttribute("collegeid").toString().trim());
		String st=f.addNewStaff();
		if(st.equals("success"))
			 mv.setViewName("Success.jsp");
		else
			 mv.setViewName("Failure.jsp");
		mv.addObject("activity","StaffReg");
		 return mv;
	}
	@RequestMapping("/registerbranch")
	@SessionScope
	public String registerbranch() {
		
		return("RegisterBranch.jsp");
		
	}
	@RequestMapping("/RegCourse")
	@SessionScope
	public ModelAndView RegCourse() {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
		RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		//System.out.println("branch lst="+lst.size());
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst);
		mv.setViewName("RegCourse.jsp");
		return mv;
	}
	@RequestMapping("/CourseReg")
	public ModelAndView CourseReg(Courses rb) {
		ModelAndView mv=new ModelAndView();
		String st="Failure.jsp";
		if(rb.registerCourse())
		{
			st="Success.jsp";
		}
		 
		mv.setViewName(st);
		mv.addObject("activity","courseReg");
		return mv;
	}
	@RequestMapping("/RegSubject")
	@SessionScope
	public ModelAndView RegSubject() {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
		RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst);
		mv.setViewName("RegSubject.jsp");
		return mv;
	}
	 
	@RequestMapping("/SubAllocation")
	@SessionScope
	public ModelAndView SubAllocation(HttpSession ses) {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
		List<Staff> lststaff = new ArrayList<Staff>();
		Staff staff=new Staff();
		staff.setCollegeid(ses.getAttribute("collegeid").toString().trim());
		lststaff=staff.getStaffList();
		RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst);
		mv.addObject("lstStaff",lststaff);
		mv.setViewName("SubjectAllocation.jsp");
		return mv;
	}
	@RequestMapping("/RegUnit")
	@SessionScope
	public ModelAndView RegUnit() {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
	 
		RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst);
		 System.out.println("size="+lst.size());
		mv.setViewName("RegUnits.jsp");
		return mv;
	}
	
	@RequestMapping("/RegModelAns")
	@SessionScope
	public ModelAndView RegModelAns() {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
	 
		RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst);
		 System.out.println("size="+lst.size());
		mv.setViewName("RegAns.jsp");
		return mv;
	}
	@RequestMapping("/RegQues")
	@SessionScope
	public ModelAndView RegQues() {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
		List<QuestionTypes> lst1 = new ArrayList<QuestionTypes>();
		 
		RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		
		QuestionTypes questyp = new QuestionTypes();
		questyp.getQuesTypes();
		lst1=questyp.getLstQuesTypes();
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst);
		mv.addObject("lstquesType",lst1);
		 System.out.println("size="+lst.size());
		mv.setViewName("RegQuesBank.jsp");
		return mv;
	}
	@RequestMapping("/RegExam")
	@SessionScope
	public ModelAndView RegExam() {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
		  
		RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		
		 
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst);
	 
		 System.out.println("size="+lst.size());
		mv.setViewName("RegExam.jsp");
		return mv;
	}
	@RequestMapping("/QuesReg")
	public ModelAndView QuesReg(QuestionBank rb,HttpSession ses) {
		ModelAndView mv=new ModelAndView();
		String st="Failure.jsp",input="";
		int quesid=0;
		 rb.setCollegeid(ses.getAttribute("collegeid").toString().trim());
		if(rb.insertQues())
		{
			 
		  quesid=rb.getQuesId();
			System.out.println("id="+quesid);
		  
		 	input=rb.getQues();
			if(rb.getQuesType().equals("OneSentence"))
			{
				input=input+" "+rb.getOneSentence();
			}
			 beans.Base64Encoder encoder=new beans.Base64Encoder();
				
			 mv.setViewName("gotoPython.jsp");
			 String param=quesid+"|"+ses.getAttribute("userid").toString().trim()+"|"+input;
			  param=encoder.encode(param.getBytes());
				
			 mv.addObject("path",beans.GetURL.getPythonServerURL()+"SQLAttackDetection.py?param="+param);
			  
			  
		}
		else
		{
		mv.setViewName("Failure.jsp");
		mv.addObject("activity","QuesReg");
		}
		return mv;
	}
	@RequestMapping("/FromPythonQues")
   	public ModelAndView FromPythonQues(ServletRequest request)
   	{
   		ModelAndView mv=new ModelAndView();  
   		 try {
   			  
   			 
   			 String st=request.getParameter("result").toString().trim();
   			System.out.println("sts="+st);
   			 if(st.equals("SQLINJECTION"))
   			{
   				mv.setViewName("Failure.jsp");
   	   			mv.addObject("activity","SQLAttack");
   	   			String id=request.getParameter("id").toString().trim();
   	   			JavaFuns jf=new JavaFuns();
   	   			if(jf.execute("delete from quesbank where quesId="+id)) {}
   	   		CloudFuns cf=new CloudFuns();
   			Vector vcolg=cf.getValue("select collegeid from users where userid='"+request.getParameter("userid").toString().trim()+"'", 1);
   			String colgid=vcolg.elementAt(0).toString().trim();
   			cf.recordusage(colgid, "sqlattacks");
   			}
   			else
   			{
   				mv.setViewName("Success.jsp");
   	   			mv.addObject("activity","QuesReg");
   			}
   			
   		 }
   		 catch (Exception e) {
   			// TODO: handle exception
   			 mv.setViewName("Failure.jsp");
   		} 
   		
   		 return mv;
   	}
	@RequestMapping("/QuesAdd")
	public ModelAndView QuesAdd(Exam rb) {
		ModelAndView mv=new ModelAndView();
		String st="Failure.jsp";
		JavaFuns jf=new JavaFuns();
		try {
		if(jf.execute("update exams set noQuestions=noQuestions+1 where examId="+rb.getExamId()))
		{}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		if(rb.insertExamQues())
		{
			st="Success.jsp";
		}
		 
		mv.setViewName(st);
		mv.addObject("activity","ExamQuesReg");
		return mv;
	}
	@RequestMapping("/AnsReg")
	public ModelAndView AnsReg(Answers rb) {
		ModelAndView mv=new ModelAndView(); 
		int quesid=rb.getQuesId();
		JavaFuns jf=new JavaFuns();
		Vector v=jf.getValue("select quesType from quesbank where quesId="+rb.getQuesId() , 1);
		if(v.elementAt(0).toString().trim().equals("Describe")||v.elementAt(0).toString().trim().equals("Explain in Details"))
		{
			String ansids="";
			rb.setAnstype("Details");
			if(rb.insertAns())
			{}
			ansids=String.valueOf(rb.getAnsid());
			rb.setAnstype("Definition");
			rb.setAns(rb.getDefine());
			if(rb.insertAns())
			{}
			ansids=ansids+"|"+String.valueOf(rb.getAnsid());
			mv.setViewName("forwardAns.jsp?ansid="+ansids);
			mv.addObject("path",beans.GetURL.getPythonServerURL()+"FindKeywords1.py?ansId="+ansids);
			
		}
		else if(v.elementAt(0).toString().trim().equals("YesNoType"))
		{
			rb.setAnstype("YesNoType"); 
			if(rb.insertAns())
			{}
			mv.setViewName("forwardAns.jsp?ansid="+rb.getAnsid());
			mv.addObject("path",beans.GetURL.getPythonServerURL()+"FindKeywords.py?ansId="+rb.getAnsid());
			
		}
		else
		{
			rb.setAnstype("Answer"); 
			if(rb.insertAns())
			{
				 
			}
			mv.setViewName("forwardAns.jsp?ansid="+rb.getAnsid());
			mv.addObject("path",beans.GetURL.getPythonServerURL()+"FindKeywords.py?ansId="+rb.getAnsid());
			
		}
		 
		return mv;
	}
	@RequestMapping("fromPython")
	public ModelAndView fromPython(HttpServletRequest request)
	{ModelAndView mv=new ModelAndView(); 
		 try
		 {
			 String param=request.getParameter("param").toString().trim();
			 Base64Decoder decoder=new Base64Decoder();
			 byte[] paramDecrypted=decoder.decode(param);
			 String str=new String(paramDecrypted);
			 
			 if(str.split("\\|")[0].equals("staff"))
			 { 
				 mv.setViewName("Success.jsp");
				 mv.addObject("activity","AnsReg");
			 } 
			 else
			 { 
				 mv.setViewName("Failure.jsp");
				 mv.addObject("activity","AnsReg");
			 }
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 System.out.println("err="+e.getMessage());
			 mv.setViewName("Failure.jsp");
			 mv.addObject("activity","AnsReg");
		}
		 return mv;
	}
	@RequestMapping("Evaluate")
	public ModelAndView Evaluate(HttpServletRequest request)
	{ModelAndView mv=new ModelAndView(); 
		 try
		 {
			 String userid=request.getParameter("userid").toString().trim();
			 int examId=Integer.parseInt(request.getParameter("examId").trim()); 
			 JavaFuns jf=new JavaFuns();
			 Vector v=jf.getValue("select userid from studanswers where examId="+examId+" and userid='"+userid+"'", 1);
			 if(v.size()>0)
			 {
				 mv.setViewName("forwardAns.jsp");
				 mv.addObject("path",GetURL.getPythonServerURL()+"/Evaluation.py?examId="+examId+"&userid="+userid);
			 }
			 else
			 {
				 mv.setViewName("viewExamResult?examId="+examId+"&userid="+userid);
			 }
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 System.out.println("err="+e.getMessage());
			 mv.setViewName("Failure.jsp");
			 mv.addObject("activity","SubmitAns");
		}
		 return mv;
	} 
	@RequestMapping("/SubmitAns")
	@SessionScope
	public ModelAndView SubmitAns(ExamAnswers ans,HttpSession ses,HttpServletRequest request) {
		List<ExamQuestions> lst=new ArrayList<ExamQuestions>();
		String ansids="",param="",page="NA";
		ses.setAttribute("endTime", System.currentTimeMillis());
		ans.setUserid(ses.getAttribute("userid").toString().trim());
		
		if(ans.getQuesType().trim().equals("Objective"))
		{
			ans.setAns(ans.getObjective());
			ans.setAnsType("Objective");
			ans.trackExamDetails(ses);
			ans.insertExamAns(ses);
			ansids=String.valueOf(ans.getAnsid());
			 //page="FIndKeywords2.py";
		}
		else if(ans.getQuesType().trim().equals("YesNoType"))
		{
			System.out.println("ans="+ans.getYesNoType());
			ans.setAns(ans.getYesNoType());
			ans.setAnsType("YesNoType");
			ans.trackExamDetails(ses);
			ans.insertExamAns(ses);
			ansids=String.valueOf(ans.getAnsid());
			
		}
		else
		{
			ans.setAns(ans.getAnswer());
			ans.setAnsType("Answer");
			try {
			ans.trackExamDetails(ses);
			if(ans.insertExamAns(ses))
			{
			ansids=String.valueOf(ans.getAnsid());
			}
			else
			{
				ans.setAnsid(0);
			}page="SQLAttackDetection.py";}
			catch (Exception e) {
				// TODO: handle exception
				ans.setAnsid(0);
				System.out.println("errSQLAttackDetection");
				page="SQLAttackDetection.py";
			}
			//page="FIndKeywords3.py";
		} 
		System.out.println("page="+page+"ansids="+ansids);
		JavaFuns jf=new JavaFuns();
		if(ans.getAnsid()>0)
		{
		if(jf.execute("delete from saveCurrentState where userid='"+ses.getAttribute("userid").toString().trim()+"'" )) {}
		String qr="insert into saveCurrentState(userid,examId,quesNo,enddt) values('"+ses.getAttribute("userid").toString().trim()+"',"+request.getParameter("examId").trim()+","+request.getParameter("quesNo").trim()+",'"+request.getParameter("enddt").trim()+"')";
		if(jf.execute(qr))
		{
			
		}
		}
		//param=Integer.parseInt(request.getParameter("examId").trim())+"|"+ses.getAttribute("userid").toString().trim()+"|"+ansids;
		ModelAndView mv=new ModelAndView();
		if(page.equals("SQLAttackDetection.py"))
		{
			beans.Base64Encoder encoder=new beans.Base64Encoder();
			
			 mv.setViewName("gotoPython.jsp");
			  param= request.getParameter("examId").trim()+"|"+ses.getAttribute("userid").toString().trim()+"|"+ansids+"|"+ans.getAnswer();
			  param=encoder.encode(param.getBytes());
				
			 mv.addObject("path",beans.GetURL.getPythonServerURL()+"SQLAttackDetection1.py?param="+param);
			  
		}
		else
		{
		mv.setViewName("fromPythonStud?examId="+request.getParameter("examId").trim()+"&userid="+ses.getAttribute("userid").toString().trim());
		}
		//mv.addObject("path",beans.GetURL.getPythonServerURL()+page+"?param="+param);
		System.out.println("done");
		return mv;
	}
	@RequestMapping("fromPythonEval")
	public ModelAndView fromPythonEval(HttpServletRequest request)
	{ModelAndView mv=new ModelAndView(); 
		 try
		 {
			 String userid=request.getParameter("userid").toString().trim();
			 int examId=Integer.parseInt(request.getParameter("examId").trim()); 
			 mv.setViewName("viewExamResult?examId="+examId+"&userid="+userid);
				
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 System.out.println("err="+e.getMessage());
			 mv.setViewName("Failure.jsp");
			 mv.addObject("activity","SubmitAns");
		}
		 return mv;
	}
	@RequestMapping("fromPythonStud")
	public ModelAndView fromPythonStud(HttpServletRequest request)
	{ModelAndView mv=new ModelAndView(); 
		 try
		 {
			 String param=request.getParameter("param").toString().trim();
			 Base64Decoder decoder=new Base64Decoder();
			 byte[] paramDecrypted=decoder.decode(param);
			 String str=new String(paramDecrypted);
			 String str1[]=str.split("\\|");
			 String userid=str1[0].trim();
			 int examId=Integer.parseInt(str1[1].trim());
			 JavaFuns jf=new JavaFuns();
			 Vector v=jf.getValue("select quesNo,enddt from saveCurrentState where userid='"+userid.trim()+"' and examId="+examId ,2);
			 int quesNo=Integer.parseInt(v.elementAt(0).toString().trim());
			 String enddt=(v.elementAt(1).toString().trim());
			 List<ExamQuestions> lst=new ArrayList<ExamQuestions>();
			 ExamQuestions exques=new ExamQuestions();
			 exques.setExamId(examId);
			 exques.setUserid(userid); 
			 exques.getQuestionsStud();
			 lst=exques.getLstques();
			 
			mv.addObject("stf",lst);
			
			mv.addObject("examId",examId);
			mv.addObject("quesNo",quesNo+1);
			mv.addObject("enddt",enddt);
			mv.addObject("userid",userid);
			if(lst.size()==0)
			{
				if(jf.execute("udpate appearedexams set sts='appeared' where examId="+examId+" and userid='"+userid.trim()+"'")) {}
				mv.setViewName("Success.jsp");
				mv.addObject("activity","ExamDone");
			}
			else
			{
				System.out.println("in st"+enddt);
				mv.setViewName("StartExam.jsp?enddt="+enddt);
			}
			 
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 System.out.println("err="+e.getMessage());
			 mv.setViewName("Failure.jsp");
			 mv.addObject("activity","SubmitAns");
		}
		 return mv;
	}
	@RequestMapping("fromPythonStud1")
	public ModelAndView fromPythonStud1(HttpServletRequest request)
	{ModelAndView mv=new ModelAndView(); 
		 try
		 {
			 String param=request.getParameter("sts").toString().trim();
			 String result=request.getParameter("result").toString().trim();
			 String ansid=request.getParameter("ansid").toString().trim();
			System.out.println(result);
			 Base64Decoder decoder=new Base64Decoder();
			 byte[] paramDecrypted=decoder.decode(param);
			 String str=new String(paramDecrypted);
			 String str1[]=str.split("\\|");
			 String userid=str1[1].trim();
			 int examId=Integer.parseInt(str1[0].trim());
			 
			 if(result.toString().trim().equals("SQLINJECTION"))
			{
				mv.setViewName("Failure.jsp");
				mv.addObject("activity","SQLAttack");
				JavaFuns jf=new JavaFuns();
   	   			if(jf.execute("delete from studanswers where studAnsId="+ansid)) {}
   	   		if(jf.execute("delete from appearedexams where examId="+examId+" and userid='"+userid+"'")) {}
   			CloudFuns cf=new CloudFuns();
   			Vector vcolg=cf.getValue("select collegeid from users where userid='"+userid.trim()+"'", 1);
   			String colgid=vcolg.elementAt(0).toString().trim();
   			cf.recordusage(colgid, "sqlattacks");
			}
			else
			{
			try {
			JavaFuns jf=new JavaFuns();
			 Vector v=jf.getValue("select quesNo,enddt from saveCurrentState where userid='"+userid.trim()+"' and examId="+examId ,2);
			 int quesNo=Integer.parseInt(v.elementAt(0).toString().trim());
			 String enddt=(v.elementAt(1).toString().trim());
			 List<ExamQuestions> lst=new ArrayList<ExamQuestions>();
			 ExamQuestions exques=new ExamQuestions();
			 exques.setExamId(examId);
			 exques.setUserid(userid); 
			 exques.getQuestionsStud();
			 lst=exques.getLstques();
			 
			mv.addObject("stf",lst);
			
			mv.addObject("examId",examId);
			mv.addObject("quesNo",quesNo+1);
			mv.addObject("enddt",enddt);
			mv.addObject("userid",userid);
			if(lst.size()==0)
			{
				if(jf.execute("udpate appearedexams set sts='appeared' where examId="+examId+" and userid='"+userid.trim()+"'")) {}
				mv.setViewName("Success.jsp");
				mv.addObject("activity","ExamDone");
			}
			else
			{
				System.out.println("in st"+enddt);
				mv.setViewName("StartExam.jsp?enddt="+enddt);
			}
			
			}
catch (Exception e) {
	mv.setViewName("Failure.jsp");
	mv.addObject("activity","SQLAttack");
	JavaFuns jf=new JavaFuns();
			if(jf.execute("delete from studanswers where studAnsId="+ansid)) {}
		if(jf.execute("delete from appearedexams where examId="+examId+" and userid='"+userid+"'")) {}
	CloudFuns cf=new CloudFuns();
	Vector vcolg=cf.getValue("select collegeid from users where userid='"+userid.trim()+"'", 1);
	String colgid=vcolg.elementAt(0).toString().trim();
	cf.recordusage(colgid, "sqlattacks");

	// TODO: handle exception
}
			}
			 
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 System.out.println("err="+e.getMessage());
			 mv.setViewName("Failure.jsp");
			 mv.addObject("activity","SubmitAns");
		}
		 return mv;
	}
	@RequestMapping("/UnitReg")
	public ModelAndView UnitReg(Units rb) {
		ModelAndView mv=new ModelAndView();
		String st="Failure.jsp";
		if(rb.insertUnits())
		{
			st="Success.jsp";
		}
		 
		mv.setViewName(st);
		mv.addObject("activity","UnitReg");
		return mv;
	}
	@RequestMapping("/AllocateSubject")
	public ModelAndView AllocateSubject(SubjectsAllocation rb) {
		ModelAndView mv=new ModelAndView();
		String st="Failure.jsp";
		if(rb.allocateSubject())
		{
			st="Success.jsp";
		}
		 
		mv.setViewName(st);
		mv.addObject("activity","SubAllocation");
		return mv;
	}
	@RequestMapping("/SubjectReg")
	public ModelAndView SubjectReg(Subjects rb) {
		ModelAndView mv=new ModelAndView();
		String st="Failure.jsp";
		if(rb.registerSubject())
		{
			st="Success.jsp";
		}
		 
		mv.setViewName(st);
		mv.addObject("activity","SubReg");
		return mv;
	}
	@RequestMapping("/registerExam")
	public ModelAndView registerExam(Exam rb,HttpSession ses) {
		ModelAndView mv=new ModelAndView();
		String st="Failure.jsp";
		rb.setCollegeid(ses.getAttribute("collegeid").toString().trim());
		if(rb.insertExam())
		{
			st="Success.jsp";
		}
		 
		mv.setViewName(st);
		mv.addObject("activity","ExamReg");
		return mv;
	}
	@RequestMapping("/registernewbranch")
	public ModelAndView registernewbranch(RegisterBranch rb) {
		
		String st=rb.registerBranch();
		ModelAndView mv=new ModelAndView();
		mv.setViewName(st);
		mv.addObject("activity","branchReg");
		return mv;
	}

	@RequestMapping("/activatestudent")
	public ModelAndView activatestudent(String uid) {
		ModelAndView mv=new ModelAndView();
		ApproveStudents ap=new ApproveStudents();
		String sts=ap.updateStudentStatus(uid);
		if(sts.equals("success"))
			 mv.setViewName("Success.jsp");
		else
			 mv.setViewName("Failure.jsp");
		mv.addObject("activity","studActivation");
		 return mv;
	}
	@RequestMapping("/viewstudent")
	@SessionScope
	public ModelAndView viewstudent(HttpSession ses) {
		
		List<ViewStudent> lst = new ArrayList<ViewStudent>();
		ViewStudent vs = new ViewStudent();
		vs.setCollegeid(ses.getAttribute("collegeid").toString().trim());
		lst=vs.getStudentReport();
		ModelAndView mv=new ModelAndView();
		mv.addObject("std",lst);
		mv.setViewName("ViewStudentReport.jsp");
		return mv;
	}
	
	@RequestMapping("/editProfile")
	@SessionScope
	public ModelAndView editProfile(HttpSession ses) {
		ModelAndView mv=new ModelAndView();
		try
		{
		List<Student> lst = new ArrayList<Student>();
		Student vs = new Student();
		lst=vs.getStudentReport(ses.getAttribute("userid").toString().trim());
		
		mv.addObject("std",lst);
		}
		catch (Exception e) {
		System.out.println("errr in edit="+e.getMessage());
		}
		mv.setViewName("EditProfileStud.jsp");
		return mv;
	}
	@RequestMapping("/editProfile1")
	@SessionScope
	public ModelAndView editProfile1(HttpSession ses) {
		
		List<Staff> lst = new ArrayList<Staff>();
		Staff vs = new Staff();
		lst=vs.getStaff(ses.getAttribute("userid").toString().trim());
		ModelAndView mv=new ModelAndView();
		mv.addObject("std",lst);
		mv.setViewName("EditProfileStaff.jsp");
		return mv;
	}
	@RequestMapping("/approvestudentlist")
	@SessionScope
	public ModelAndView approvestudentlist(HttpSession ses) {
		
		List<ViewStudentList> lst = new ArrayList<ViewStudentList>();
		ViewStudentList vls= new ViewStudentList();
		vls.setCollegeid(ses.getAttribute("collegeid").toString().trim());
		lst=vls.getapprovalList();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stal",lst);
		mv.setViewName("UpdateStudentStatus.jsp");
		return mv;
	
	}
	@RequestMapping("/check")
	public ModelAndView check(CheckUser cu,HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		System.out.println("in check");
		System.out.println(request.getParameter("userid").toString().trim());
		try {
		DataSanitization dobj=new DataSanitization();
		if(dobj.containsSQLLoginBypassWords(request.getParameter("userid").toString().trim()))
		{ 
			mv.addObject("activity","SQLAttack");
			mv.setViewName("Failure2.jsp");
		}
		else if(dobj.containsSQLLoginBypassWords(request.getParameter("pswd").toString().trim()))
		{ 
			mv.addObject("activity","SQLAttack");
			mv.setViewName("Failure2.jsp");
		}
		else
		{		System.out.println("in sdfcheck");
		String st=cu.checkUser(request);
		mv.setViewName(st);
		}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("err="+e.getMessage());
		}
		return mv;
	}
	
	@RequestMapping("/registerstaff")
	@SessionScope
	public String registerstaff()
	{
		return "RegisterStaff.jsp";
	}
	
	@RequestMapping("/viewstaff")
	@SessionScope
	public ModelAndView viewstaff(HttpSession ses) {
		List<ViewStaff> lst=new ArrayList<ViewStaff>();
		ViewStaff vs = new ViewStaff();
		vs.setCollegeid(ses.getAttribute("collegeid").toString().trim());
		lst=vs.getStaff();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		mv.setViewName("ViewStaffReport.jsp");
		return mv;
	}
	
	@RequestMapping("/DelQues")
	@SessionScope
	public ModelAndView DelQues(HttpSession ses,HttpServletRequest request) {
		JavaFuns jf=new JavaFuns();
		if(jf.execute("delete from examquestions where exQuesId="+request.getParameter("exQuesId").trim()))
		{}
		List<ExamQuestions> lst=new ArrayList<ExamQuestions>();
		ExamQuestions vs = new ExamQuestions();
		vs.setExamId(Integer.parseInt(request.getParameter("examId").trim()));
		//vs.setUserid(ses.getAttribute("userid").toString().trim());
		 vs.getQuestions();
		 lst=vs.getLstques() ;
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		mv.setViewName("viewExamQuestions.jsp");
		return mv;
	}
	@RequestMapping("/viewAddedQues")
	@SessionScope
	public ModelAndView viewAddedQues(HttpSession ses,HttpServletRequest request) {
		List<ExamQuestions> lst=new ArrayList<ExamQuestions>();
		ExamQuestions vs = new ExamQuestions();
		vs.setExamId(Integer.parseInt(request.getParameter("examId").trim()));
		//vs.setUserid(ses.getAttribute("userid").toString().trim());
		 vs.getQuestions();
		 lst=vs.getLstques() ;
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		mv.setViewName("viewExamQuestions.jsp");
		return mv;
	}
	
	 
	@RequestMapping("/StartExam")
	@SessionScope
	public ModelAndView StartExam(HttpSession ses,HttpServletRequest request) {
		List<ExamQuestions> lst=new ArrayList<ExamQuestions>();
		Exam vs = new Exam();
		vs.setExamId(Integer.parseInt(request.getParameter("examId").trim()));
		vs.setUserid(ses.getAttribute("userid").toString().trim());
		 vs.insertAExam();
		 ExamQuestions exques=new ExamQuestions();
		 exques.setExamId(Integer.parseInt(request.getParameter("examId").trim()));
		 exques.setUserid(ses.getAttribute("userid").toString().trim());
		 
		 exques.getQuestionsStud();
		 lst=exques.getLstques();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		mv.setViewName("StartExam.jsp");
		mv.addObject("examId",Integer.parseInt(request.getParameter("examId").trim()));
		mv.addObject("quesNo",1);
		mv.addObject("enddt",(request.getParameter("enddt").trim()));
		if(lst.size()==0)
		{
			mv.setViewName("ExitExam?userid="+ses.getAttribute("userid").toString().trim()+"&examId="+Integer.parseInt(request.getParameter("examId").trim()));
		}
		return mv;
	}
	@RequestMapping("/viewExamResult")
	@SessionScope
	public ModelAndView viewExamResult(HttpServletRequest request) {
		List<ExamQuestions> lst=new ArrayList<ExamQuestions>();
		ExamQuestions vs = new ExamQuestions();
		vs.setUserid(request.getParameter("userid").toString().trim());
		vs.setExamId(Integer.parseInt(request.getParameter("examId").toString().trim()));
		String userid=request.getParameter("userid").toString().trim();
		int examId=Integer.parseInt(request.getParameter("examId").toString().trim());
		lst=vs.getResult(); 
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		JavaFuns jf=new JavaFuns();
		Vector v=jf.getValue("select sum(marks) as totalMarks from result where userid='"+userid+"' and examId="+examId , 1);
		Vector v1=jf.getValue("select marks,title from appearedexams where examId="+examId , 2);
		double score=Double.parseDouble(v.elementAt(0).toString().trim());
		double totalMarks=Double.parseDouble(v1.elementAt(0).toString().trim());
		double percent=(score*100)/totalMarks;
		mv.addObject("score",v.elementAt(0).toString().trim());
		mv.addObject("totalMarks",v1.elementAt(0).toString().trim());
		mv.addObject("percent",percent);
		mv.addObject("examTitle",v1.elementAt(1).toString().trim());
		mv.setViewName("viewResult.jsp");
		return mv;
	}
	@RequestMapping("/ExitExam")
	@SessionScope
	public ModelAndView ExitExam(HttpSession ses,HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		try
		{
			JavaFuns jf=new JavaFuns();
			if(jf.execute("update appearedexams set sts='appeared' where examId="+request.getParameter("examId").trim()))
			{
				mv.addObject("examId",request.getParameter("examId").trim());
				mv.addObject("userid",request.getParameter("userid").trim());
				mv.setViewName("Success.jsp");
				mv.addObject("activity","ExamDone");
				
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		 
		return mv;
	}
	@RequestMapping("/viewPendingExams")
	@SessionScope
	public ModelAndView viewPendingExams(HttpSession ses) {
		List<Exam> lst=new ArrayList<Exam>();
		Exam vs = new Exam();
		vs.setUserid(ses.getAttribute("userid").toString().trim());
		 vs.getExam();
		 lst=vs.getLstexam();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		mv.setViewName("viewPendingExams.jsp");
		return mv;
	}
	@RequestMapping("/viewConductedExams")
	@SessionScope
	public ModelAndView viewConductedExams(HttpSession ses) {
		List<Exam> lst=new ArrayList<Exam>();
		Exam vs = new Exam();
		vs.setUserid(ses.getAttribute("userid").toString().trim());
		 vs.getConductedExams(); 
		 lst=vs.getLstexam();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		mv.setViewName("viewMyConductedExams.jsp");
		return mv;
	}
	@RequestMapping("/viewConductedExamsStud")
	@SessionScope
	public ModelAndView viewConductedExamsStud(HttpSession ses) {
		List<Exam> lst=new ArrayList<Exam>();
		Exam vs = new Exam();
		vs.setUserid(ses.getAttribute("userid").toString().trim());
		 vs.getConductedExamsStud(); 
		 lst=vs.getLstexam();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		mv.setViewName("viewCondExamsStud.jsp");
		return mv;
	} 
	@RequestMapping("/viewScheduledExams")
	@SessionScope
	public ModelAndView viewScheduledExams(HttpSession ses) {
		List<Exam> lst=new ArrayList<Exam>();
		Exam vs = new Exam();
		vs.setUserid(ses.getAttribute("userid").toString().trim());
		 vs.getScheduledExams1(); 
		 lst=vs.getLstexam();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		System.out.println("size="+lst.size());
		mv.setViewName("viewMyExams.jsp");
		return mv;
	}
	@RequestMapping("/viewScheduledExamsStud")
	@SessionScope
	public ModelAndView viewScheduledExamsStud(HttpSession ses) {
		List<Exam> lst=new ArrayList<Exam>();
		Exam vs = new Exam();
		vs.setUserid(ses.getAttribute("userid").toString().trim());
		vs.setBranchname(ses.getAttribute("branch").toString().trim());
		vs.setCourse(ses.getAttribute("course").toString().trim());
		vs.setSemester(Integer.parseInt(ses.getAttribute("sem").toString().trim()));
		vs.setUserid(ses.getAttribute("userid").toString().trim());
		vs.setCollegeid(ses.getAttribute("collegeid").toString().trim());
		vs.getScheduledExam(); 
		 lst=vs.getLstexam();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		mv.setViewName("viewScheduledExams.jsp");
		return mv;
	}
	@RequestMapping("/submitExam")
	@SessionScope
	public ModelAndView submitExam(HttpSession ses,HttpServletRequest request) {
		JavaFuns jf=new JavaFuns();
		double m1=0,m2=0;
		ModelAndView mv=new ModelAndView();
		m1=Double.parseDouble(request.getParameter("m1").trim());
		m2=Double.parseDouble(request.getParameter("m2").trim());
		if(m1>m2)
		{
			mv.setViewName("Failure.jsp");	
			mv.addObject("activity","SubmitExam");
		}
		else
		{
		if(jf.execute("update exams set sts='scheduled' where examId="+request.getParameter("examId").trim()))
		{}
		
		mv.addObject("activity","SubmitExam");
		mv.setViewName("Success.jsp");
		}
		return mv;
	}
}

