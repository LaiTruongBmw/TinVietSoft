<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Web" %>
<%@ Import Namespace = "System.Web.Security" %>
<%@ Import Namespace = "System.Security.Principal" %>
<%@ Import Namespace = "System.Runtime.InteropServices" %>
<!-- #include file="../../../../system/lib/form.inc"  -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POPUP REGISTER PROGRESS RATIO</title>
</head>
<%CtlLib.SetUser(Session["APP_DBUSER"].ToString());%>

<script>
function BodyInit()
{
	var p_CODE_GROUP_PK  ="<%=Request["p_CODE_GROUP_PK"]%>";
	var p_mon ="<%=Request["p_month"]%>";
	txtpCodeGroupPk.text = p_CODE_GROUP_PK;
	dtPeriod.value = p_mon;
	OnSearch();
}

function OnSearch()
{
	 dsoForm.Call("SELECT");
}

function  OnSave(){

for (var i =1;i< idGrid.rows;i++){

	if(idGrid.GetGridData(i,0)==""){
	idGrid.SetRowStatus( i , 48);
	}
}
dsoForm.Call();
}

</script>

<body>
<gw:data id="dsoForm" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid" parameter="0,1,4,5" function="ac_sel_60170480_popup" procedure="ac_UPD_60170480">
			<input bind="idGrid" >
				<input bind="dtPeriod" />
				<input bind="txtpCodeGroupPk"/>
			</input>
			<output bind="idGrid" />
			
			
		</dso>
	</xml>
</gw:data>
  
<table style="margin-left:5;height:100%" align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr style="height:5%">
    <td>
     <fieldset style="width: 100%; height: 100%; padding: 2">
        <table border="0" width="100%" cellpadding="0" cellspacing="2"  id="table1">
			<tr>
      
                <td width="15%" align="right">Month:</td>
	           	<td width=""><gw:datebox type='month' id="dtPeriod" onchange="OnSearch()" styles="width: 100%" /></td>
	            <td width="2%"><gw:imgbtn id="ibtnSave1" img="save" alt="Save" onclick="OnSave()" /></td>
             </tr>
			 
			
			 
		 </table>  
     </fieldset>
    </td>
  </tr>
  <tr style="height:95%">
        <td colspan = "9">
                                <div style="width:100%; height:96%; overflow:auto;">
					            <gw:grid  
							    id="idGrid"  
							    header="_pk|_PK_code_Group|CODE TYPE ID|CODE TYPE NM|Progress Ratio|_P_MONTH"
							    format="0|0|0|0|1|0"
							    aligns="1|0|0|0|0|0"  
							    defaults="|||||"  
							    editcol="0|0|0|0|1|0"  
							    widths="0|2000|2000|2000|2000|0"  
							    styles="width:100%; height:100%"   
							    sorting="T"   
                                paging="true"  pageview="20"
							    param="0,1,2"
							    oncelldblclick="Select()" />
                                </div>
	</td>
  </tr>
</table>
<gw:textbox id="txtpCodeGroupPk" styles="width: 100%;display:none" />
<gw:textbox id="txtRtn" styles="width: 100%;display:none" />
</body>
</html>
