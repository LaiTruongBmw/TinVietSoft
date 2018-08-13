<%@ Page Language="C#"%>
<html xmlns:gw>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<LINK REL="SHORTCUT ICON" HREF="">
<title> <%= Application["APP_NAME"] %> </title>
<LINK href="default.css" rel="stylesheet" />
<style>

@media all 
{
	gw\:textbox  {  behavior: url(controls/textbox.htc) ;  }
	gw\:button  {  behavior: url(controls/button.htc) ;  }
	gw\:icon {  behavior: url(controls/icon.htc) ;  }
}
</style>
<SCRIPT LANGUAGE="JavaScript" SRC="lib/system.js"></script>
<SCRIPT LANGUAGE="JavaScript" SRC="lib/common.js"></script>
<SCRIPT LANGUAGE="JavaScript" SRC="lib/appsystem.js"></script>
<SCRIPT LANGUAGE="JavaScript" SRC="lib/globalVar.js"></script>
</head>
<script>

RootURL = location.pathname;

var index = RootURL.lastIndexOf ( "/"  );

SystemURL = RootURL.substr( 0, index );
RootURL = RootURL.substr( 0, index - 7);
HostURL = "http://" + document.location.host ;

SysImgPath = SystemURL + "/images";
var lastLog;
function Init()
{
	      idSystemFrm.document.location.href = "../login.aspx";
          var logger;
          
          lastLog = top.frames("lastLog");
          lastLog.document.write ( '<html><LINK href="default.css" rel="stylesheet" ><body>' );
          
          <%if(Convert.ToString(Session["DebugLog"])=="TRUE") {%>
              logger =    top.frames("debugLog");
              logger.document.write ( '<html><LINK href="default.css" rel="stylesheet" ><body>' );
          <%} %>
          HideProgress();
}

var debug_height = 0;
var debug_remain = "";
function showdebug()
{
	var obj = document.all( "idDebugDiv" );

	if ( obj.style.display == "none" ) 
	{
		ondebugclick();
	}

}
//lastLog.
function ondebugclick()
{
	var obj = document.all( "idDebugDiv" );
	
	if ( idDebugDiv.style.display == "none" ) 
	{
		idDebugDiv.style.display = "block";
	}
	else
	{
		idDebugDiv.style.display = "none";
	}
	
}

function Size( delta )
{

	var obj = document.all( "idDebugTable" );
	
	delta = obj.height * 1 + delta;
	
	if ( delta  > 20 ) 
		obj.height = delta;

}

function DebugLog()
{
	var obj = document.all( "idBtnLog" ); 
	if ( obj.mode == "stop" )
	{
		obj.mode = "start";
		obj.SetDataText(  "<nobr>Start Logging</nobr>" );
	}
	else
	{
		obj.mode = "stop";
		obj.SetDataText(   "<nobr>Stop Logging</nobr>" );
	}
		
	if ( logger )
	{
		logger = null;
	}
	else
	{
		logger = 	top.frames("debugLog");		
		logger.document.write ( '<LINK href="default.css" rel="stylesheet" />' );
	}

}

function OpenSDE()
{
	window.open( SystemURL + "/sde/sdemainfrm.aspx" );
}

function GoHome()
{
	OpenPage( SystemURL + "/Main.aspx" );
}

function DeleteLog()
{
	top.frames("debugLog").document.close();
	top.frames("debugLog").document.write ( '<LINK href="default.css" rel="stylesheet" />' );
}

function GoTutorial()
{
	OpenPage( RootURL + "/form/_samples/tutorial.aspx" );
}

function callLogout() {
	System.AppLogout();
}

function checkSysAdmin( val ) {
	if (val == "Y") {
		imgDebug.style.display = "";
	} 
	else 
	{
		imgDebug.style.display = "none";	
	}
}

function ShowProgress()
{ 
    //window.document.body.style.cursor="wait";
    var obj = document.all("divProgress");
    obj.style.left = getWidth()- 50;
    obj.style.display = "";
}

function HideProgress()
{  
   var obj = document.all("divProgress");
     obj.style.display = "none";
}

function ShowProgress2()
{ 
    //window.document.body.style.cursor="wait";
    var obj = document.all("divProgress");
    obj.style.left = 0;//getWidth()/2 - 50;
    obj.style.top = 0;//getHeight()/2 -50;
    obj.style.display = "";
}

function HideProgress2()
{  
   var obj = document.all("divProgress");
     obj.style.display = "none";
}

function getHeight(){
     var height;
     /*Mozila IE 7, IE 6, OldIE*/
     if (typeof window.innerHeight != 'undefined')
        height = window.innerHeight;
     else if (typeof document.documentElement != 'undefined' && typeof document.documentElement.clientHeight != 'undefined' && document.documentElement.clientHeight != 0)
       height = document.documentElement.clientHeight;
     else height = document.getElementsByTagName('body')[0].clientHeight;
     return height;
}

function getWidth(){
     var width;
     /*Mozila IE 7, IE 6, OldIE*/
     if (typeof window.innerWidth != 'undefined')
        width = window.innerWidth;
     else if (typeof document.documentElement != 'undefined' && typeof document.documentElement.clientWidth != 'undefined' && document.documentElement.clientWidth != 0)
       width = document.documentElement.clientWidth;
     else width = document.getElementsByTagName('body')[0].clientWidth;
     return width;
}

</script>
<body style="margin:0 0 0 0; padding:0 0 0 0; overflow:hidden" onload="Init()">
<table width="100%" height="100%" cellpadding=0 cellspacing=0 border=0 > 
	<tr>
    <td style="position:relative"> 
      <!--img id="imgDebug" src="images/debug.gif" style="cursor:hand;position:absolute;left:2;top:2;display:none" align="right" onclick="ondebugclick()" /--> 
      <div id="divProgress"  style="position:absolute;left:600;top:35;background-color:#FFFFFF; display:none; z-index:1"><img src="images/loadgraphic.gif" /></div>
      <div id="idDebugDiv" style="display:none;border-width:0 0 2 0 ; border-color:black ; border-style:solid"> 
      <form id="idfrm" target="hiddenframe" style="position:absolute" method="POST"></form>
        <table  id="idDebugTable" width="100%" height="130" style="table-layout :fixed;background-color:#red" align="center">
          <tr>
            <td style="background-color:#49b919;" width="100%" algin="center"> 
              <table style="width:100%">
                <tr> 
                  <td width="100px" align="center"><b>Result Window </b></td>
                  <td align="right"> 
                      <table style="font-weight:bold" cellpadding="0" cellspacing="0">
						<tr>
							<!--td style="width:70px" align="center"><a href="#" onclick="GoTutorial()"><nobr> Tutorial </nobr></a></td>
							<td style="width:70px" align="center"><a href="#" onclick="OpenSDE()"><nobr> SDE </nobr></a></td-->
							<td style="width:70px" align="center"><a href="#" onclick="Size(-100)"><nobr> SizeUp </nobr></a></td>
							<td style="width:70px" align="center"><a href="#" onclick="Size(+100)"><nobr> SizeDown </nobr></a></td>
							<td style="width:70px" align="center"><a href="#" onclick="GoHome()"><nobr> Home </nobr></a></td>
							<td style="width:70px" align="center"><a href="#" onclick="ondebugclick()"><nobr> Close </nobr></a></td>
						</tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
            <td style="background-color:#49b919; font-color:white;display:none" width="50%" align="left"> 
              <table style="width:100%">
                <tr> 
                  <td width="30%" style="border:1px solid #FFFFFF;"  align="center"><b>Debug Window </b></td>
                  <td width="70%" align="right"> 
					<table>
						<tr>
							<td> 
							<gw:icon  id="idBtnLog"  onclick="DebugLog()"  mode="<% if(Convert.ToString(Session["DebugLog"])== "TRUE") Response.Write( "stop"); else Response.Write ("start"); %>"><nobr>
							<% if(Convert.ToString(Session["DebugLog"]) =="TRUE")  Response.Write ("Stop Logging"); else Response.Write( "Start Logging"); %> </nobr> </gw:icon > 
							</td>
							<td style="width:70px" align="center"><a href="#" onclick="DeleteLog()"><nobr> Delete Logging  </nobr></a></td>
						</tr>
                    </table>
                   </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td style="background-color:white" height="100%"> 
               <iframe id="lastLog"  style=" width:100%;height:100%; border:1 solid #49b919" frameborder="0" ></iframe> 
            </td>
            <td style="background-color:white;display:none" width="50%" height="100%"> 
               <iframe id="debugLog"   style=" width:100%;height:100%; border:1 solid #49b919" frameborder="0"> </iframe> 
            </td>
          </tr>
        </table>
      </div>
    </td>
  </tr>
  <tr>
     <td height="100%">
		<iframe id="idSystemFrm" src=""   frameborder="0" name="content" style="width:100%;height:100%" ></iframe>
	</td>
  </tr>
</table>	
</body>
</html>