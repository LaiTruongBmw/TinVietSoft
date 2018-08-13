<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<%
  Dim user_id, key
  user_id = Request.Form("userid")
  key = Request.Form("key")
  
  Set objDecryptor = Server.CreateObject("DecryptPwd.PwdCom")  

   If Not objDecryptor Is Nothing Then 

       strPlanID = objDecryptor.GetPwd(key, user_id) 

       Set objDecryptor = Nothing 
       Response.Redirect("outside_login.aspx?userid=" & strPlanID)    

   End If   
%>
</body>
</html>