<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        Application["rooturl"] = "/demo";
	    Application["APP_NAME"] = "Ecosol System";
	    //date Type 0:Korea 1:Vietnam 
	    Application["Lang"] = "1"  ;
	    Application["SYSIMGPATH"] = "/images/sysImages" 	;
	    Application["SMTPSERVER"] = "mail.manage.com" ;
    }
    
    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown
        
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new Session is started
        //Session.Timeout = 120;
	    Session["Debug"] = "TRUE";
        Session["DebugLog"] = "FALSE";
        

	    Session["DBUser"] = Application["DBUser"];
	    Session["DBPass"] = Application["DBPass"];
    	
	    Session["Lang"] = Application["Lang"];
        Session["SESSION_LANG"] = "";
        Session["User_ID"] = "";
        Session["LOGIN_ID"] = "";
        Session["USER_PK"] = ""; 
        Session["DEPT_PK"] = "";
        Session["DEPT_CODE"] = "";
        Session["DEPT_NAME"] = "";
        Session["ROLE_NAME"] = "";
        Session["CODEADMIN_YN"] = "";
        Session["Debug_YN"] = "";
        Session["USER_NAME"] = ""; 
        Session["EMPLOYEE_PK"] = "";
        Session["COMPANY_PK"] = "";
        Session["HR_LEVEL"] = "";
	    
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a Session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If Session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        Response.Redirect("Login.aspx?ermsg=Your session timeout. Please login again to continue.", true);

    }
       
</script>
