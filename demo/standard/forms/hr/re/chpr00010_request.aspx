<!-- #include file="../../../../system/lib/form.inc"  -->
  <head>
    <title>genuwin</title>
  </head>  
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>  
 <script>
var flag=0; //chua co modify thong tin
var bAdd=false;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    grdRequest.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document); 
   
    datRequest.Call();
}

//--------------------------------
function OnSearch()
{
   	datRequest.Call();
}

function OnDataReceive(obj)
{ 
        auto_resize_column(grdRequest,0,grdRequest.cols-1,10);    
  
}
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//-------------------------
function ExitOnClick()
{
   
	window.returnValue = null; 
	window.close();
}
//--------------------------
function OnSelectClick()
{
   var obj=null;    
    
    if (grdRequest.row >= 1)
    { obj=new Array();   
      obj[0]=grdRequest.GetGridData(grdRequest.row,0);
      obj[1]=grdRequest.GetGridData(grdRequest.row,3)+" - " + grdRequest.GetGridData(grdRequest.row,4);
      obj[2]=grdRequest.GetGridData(grdRequest.row,1);
      obj[3]=grdRequest.GetGridData(grdRequest.row,2)
    }
    
	window.returnValue = obj; 
	window.close();
}
 </script>

<body>
<!---------------------------------------------------------->
<gw:data id="datRequest" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9," function="hr_CHPR10190001_request" procedure=""> 
                <input bind="grdRequest" >
                    <input bind="txtInput" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                </input>
                <output  bind="grdRequest" />
            </dso> 
        </xml> 
</gw:data> 
<!------------------------------------------->
    
<!-- MainTable -->
<table    style='margin-left:10px' cellpadding="0" cellspacing="0" border="1" style="width:100%;height:100%">
	<tr style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top">
	    <td>
	        <table border=1 cellpadding="0" cellspacing="0"  style="height:100%" width="100%">
                <tr style="width:100%;height:5%;border:0" valign="middle" cellpadding="0" cellspacing="0">
                    <td align=right style="width:10%;border:0" align="center">
                        Request No
                    </td>						
		            <td width="20%"  align=left valign="middle" style="border:0"><gw:textbox id="txtInput"  csstype="mandatory" styles='width:95%' onenterkey ="OnSearch()" />&nbsp;</td>
		            <td width="10%"  align=right valign="middle" style="border:0">Period </td>
		            <td width="20%" align=left valign="middle" style="border:0; white-space:nowrap"><gw:datebox id="dtFrom"  text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept  /> ~ <gw:datebox id="dtTo"  text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept  /></td>
		            <td align=right style="width:20%;border:0" align="center"></td>
		            <td width="4%" style="border:0" align="right"><gw:imgBtn id="ibtnSearch" alt="Search" img="search" onclick="OnSearch()" />  <td>
                    <td width="4%"style="border:0" align="right"><gw:imgBtn img="cancel"    alt="Close"     id="ibtnClose" 	onclick="ExitOnClick()" /></td>
	            </tr>
	            <tr style="width:100%;height:5%;border:0" valign="middle" cellpadding="0" cellspacing="0">
                    <td colspan=6 style="width:30%;border:0;color:Red;font-size:large" align="center" >
                        Please double click to select 
                    </td>						
		            
	            </tr>
            	
            	<tr style="width:100%;height:95%;border:1" valign=top cellpadding="0" cellspacing="0">
		            <td width="100%" colspan=11 >
				             <gw:grid   
                                        id="grdRequest"  
                                        header="_PK|_org|_pos_type|Request No|Position|Education|Experience (Years)|Language|Language Certificate|Computer Skill|Other|Remark|Employee(s) Request|Employee(s) Apply|Employee(s) Passed"   
                                        format="0|0|0|0|0|0|0|0|0|0|0|0|-0|-0|-0"   
                                        aligns="0|0|0|0|0|0|0|0|0|0|0|0|1|1|1"     
                                        defaults="||||||||||||||"     
                                        editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"     
                                        widths="0|0|0|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"     
                                        styles="width:100%; height:100%"   
                                        sorting="F"  oncelldblclick="OnSelectClick()"
                                        /> 

		            </td>
	            </tr>
            </table>
        </td>
	</tr>
</table>
	   
    <gw:textbox id="txtCodeGrp_PK"  styles="display:none" />
    <gw:textbox id="txtInput_CODEGRP"  styles="display:none" />
    <gw:textbox id="txtInput_CODEGRP_NM"  styles="display:none" />
    <gw:textbox id="txtInput_CODE" styles="display:none"/>
    <gw:textbox id="txtInput_CODE_NM" styles="display:none"/>
    <gw:textbox id="txtFlag" styles="display:none"/>	
	

</body>
</html>
