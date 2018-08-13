<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Web" %>
<%@ Import Namespace = "System.Web.Security" %>
<%@ Import Namespace = "System.Security.Principal" %>
<%@ Import Namespace = "System.Runtime.InteropServices" %>

<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  ESysLib.SetUser(Session["APP_DBUSER"].ToString())%>

<script>

function BodyInit()
{
    var idDsql   = "<%=Request["dsqlid"]%>";
    var idCommCd = "<%=Request["comm_code"]%>";
    var idCommNm = "<%=Request["comm_nm"]%>";
    var idCompany= "<%=Request["company"]%>";
    var idvalue1 = "<%=Request["val1"]%>";
    var idvalue2 = "<%=Request["val2"]%>";
    var idvalue3 = "<%=Request["val3"]%>";

    var col_code = "<%=Request["col_code"]%>";
    var col_nm   = "<%=Request["col_nm"]%>";
	idcode1.SetDataText(col_code + "&nbsp;");
	idname1.SetDataText(col_nm + "&nbsp;");
	idcode3.SetDataText("Center code" + "&nbsp;");
	idname3.SetDataText("Center Name" + "&nbsp;");
    
    if(idDsql != "pm_sel_62060040_PL_POPUP" && idDsql != "pm_sel_62060040_pl_popup_plpk" && idDsql != "pm_sel_62060050_PL_POPUP_CENT" )	 
    {
    	idcode3.style.display = "none";
    	idcode2.style.display = "none";
    	idname3.style.display = "none";
    	idname2.style.display = "none";    	
	}
	else
	{
	    var ctrl = idGrid.GetGridControl();
	    ctrl.ColHidden(3) = false ;
	    ctrl.ColHidden(4) = false ;
	    ctrl.Cell(0, 0, 3, 0, 3) = "Center Code";
	    ctrl.ColWidth(3) = "1500";
	    ctrl.Cell(0, 0, 4, 0, 4) = "Center Name";
	    ctrl.ColWidth(4) = "1500";
	}
	
	txtCompany.SetDataText(idCompany);
    if (idcode1.text == "")  {
    	idcode1.SetDataText("Code");
    }
    if (idname1.text == "")  {
    	idname1.SetDataText("Code Name");
    }    
	idGrid.SetGridText( 0, 0 , col_code  );
	idGrid.SetGridText( 0, 1 , col_nm  );
	txtItem.text = idCommNm;
	txtVal.text  = idvalue1;
	idcode2.text = idCommNm;
	idname2.text = idvalue1;
	OnSearch();
}

function OnSearch()
{
    txtItem.text = idcode2.text;
    txtVal.text = idname2.text;
	idData_Dsql.Call("SELECT");
}

function Select()
{
	var code_data=new Array();
	var ctrl = idGrid.GetGridControl();
	if(ctrl.SelectedRows == 0)
	{
	   alert("Please Select an Item.");
	   return ;
	}
	else
	{
		//code
		code_data[0] = idGrid.GetGridData( ctrl.row , 0 );
		//code name
		code_data[1] = idGrid.GetGridData( ctrl.row , 1 );
		// value1 --> PK
		code_data[2] = idGrid.GetGridData( ctrl.row , 2 );
		// value2
		code_data[3] = idGrid.GetGridData( ctrl.row , 3 );
		// value3
		code_data[4] = idGrid.GetGridData( ctrl.row , 4 );
		// value4
		code_data[5] = idGrid.GetGridData( ctrl.row , 5 );	
		code_data[6] = idGrid.GetGridData( ctrl.row , 6 );	
		
		//code_data[7] = idGrid.GetGridData( ctrl.row , 7 );	
		window.returnValue = code_data;
		this.close();
	}
}

function OnCancel()
{
	var code_data=new Array()
	    code_data[0] = 0;
		window.returnValue = code_data; 
		this.close();
}
</script>
<body>

    <gw:data id="idData_Dsql" onreceive="" >
        <xml>
            <dso type="grid" parameter="0,1" function="<%=Request["dsqlid"]%>">
                <input bind="idGrid" >
                    <input bind="idcode"/>
                    <input bind="idname"/>
                    <input bind="txtItem"/>
					<input bind="txtCompany"/>
					<input bind="txtVal" />
                </input>
                <output bind="idGrid" />
            </dso>
        </xml>
    </gw:data>
    
<table  border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" >
  <tr> 
    <td width="100%" height="100%">
    	<table width="100%" height="100%" cellpadding=0 cellspacing=0 border=1>
            <tr height="15%">
	            <td class="itable_title">
			        <table class="table" CELLSPACING="0" CELLPADDING="0" width="100%" height="100%">
						<tr>
							<td class="table_title" width="25%" align="right"><b><gw:label id="idcode1" styles="width:100%;height:" text =""/></b></td>
							<td class="table_content"><gw:textbox id="idcode" styles="width:100%;height:25" onenterkey="OnSearch()"/></td>
							<td class="table_title" width="25%" align="right"><b><gw:label id="idname1" styles="width:100%;height:" text =""/></b></td>
							<td class="table_content"><gw:textbox id="idname" styles="width:100%;height:25" onenterkey="OnSearch()"/></td>
		                </tr>
		                <tr>
							<td class="table_title" width="25%" align="right"><b><gw:label id="idcode3" styles="width:100%;height:" text =""/></b></td>
							<td class="table_content"><gw:textbox id="idcode2" styles="width:100%;height:25" onenterkey="OnSearch()"/></td>
							<td class="table_title" width="25%" align="right"><b><gw:label id="idname3" styles="width:100%;height:" text =""/></b></td>
							<td class="table_content"><gw:textbox id="idname2" styles="width:100%;height:25" onenterkey="OnSearch()"/></td>							
						</tr>  
				    </table>
		        </td>
	    	</tr>
	    	
	    	<tr height="80%"> 
	    		<td>
	    			<table class="table" CELLSPACING="0" CELLPADDING="0" width="100%" height="100%">
	    				<tr>
					    	<td class="itable_content" height="80%">   
							<gw:grid   
							    id="idGrid"  
							    header="||_VALUE1|_VALUE2|_VALUE3|_VALUE4|_VALUE5"
							    format="0|0|0|0|0|0"  
							    aligns="0|0|0|0|0|0"  
							    defaults="|||||"  
							    editcol="0|0|0|0|0|0"
							    widths="2000|2500|0|0|0|0"  
							    styles="width:100%; height:100%"   
							    sorting="T"   
							    param="0,1,2,3,4,5,6" 
							    oncelldblclick="Select()"/> 					    		    
				            </td>
		            	</tr>
		            </table>
            	<td>
	    	</tr>
	    	
		    <tr height="5">
				<td>
			    <table class="table" border=1 CELLSPACING="0" CELLPADDING="0" width="100%" height="100%" >
					<tr align="center"> 
					    <td>
					    	<table>
					    	    <tr>
									<td> 
									<gw:icon id="idBtnSelect" img="in" text="OK" styles="width:100"  onclick="Select()" />  
									</td> 
									<td> 
									<gw:icon id="idBtnSelect2" img="in" text="EXIT" styles="width:100"  onclick="OnCancel()" />  
									</td> 
								</tr>
							</table>	
						<td>	
					</tr>
				</table>
				</td>
			</tr>
	
		</table>  
		
    </td>
	</tr>
</table>
<gw:textbox id="txtCompany" styles="width:100%;height:25" style="display:none"/>
<gw:textbox id="txtItem"    styles="width:100%;height:25" style="display:none"/>
<gw:textbox id="txtVal"     styles="width:100%;height:25" style="display:none"/>
</body>

</html>
