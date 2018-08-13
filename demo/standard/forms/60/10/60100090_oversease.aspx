<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head> 
    <title>Transation Checking to Approve</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 

<body style="margin:0; padding:0;"  >	
	<iframe border="0"   style="width:100%; height:100%;" id="ifitffund" src="http://<%=   Request.Url.Host %>:8080/ilshin/overseasTransfer/bulk.gw?menuCd=034&erpIntergate=Y&erpUserName=<%=Session("USER_PK") %>;<%=Session("EMPLOYEE_PK") %>" >
	</iframe>
</body>

 
</html>