<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Customer PopUp</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script language="javascript">
function BodyInit()
{
	System.Translate(document);
	var _Project_Pk =  "<%=request.QueryString("Project_Pk")%>";
	txtProject_Pk.SetDataText(_Project_Pk);
	//OnSearch();
}
//============================================================================================

//============================================================================================

//============================================================================================
function OnSearch()
{
	dso_Cus.Call('SELECT');
}
//============================================================================================

//============================================================================================
function OnDblClick()
{
		var code_data=new Array()
	    var ctrl = Grid_Asset.GetGridControl();
        code_data[0] = Grid_Asset.GetGridData( ctrl.row , 0 );//pk
		code_data[1] = Grid_Asset.GetGridData( ctrl.row , 2 );//code
		code_data[2] = Grid_Asset.GetGridData( ctrl.row , 3 );//name
		code_data[3] = Grid_Asset.GetGridData( ctrl.row , 4 );//local name
		code_data[4] = Grid_Asset.GetGridData( ctrl.row , 5 );//taxcode
		window.returnValue = code_data; 
	   	this.close(); 	
}
</script>
<body>
<gw:data id="dso_Cus"  onreceive="" > 
    <xml> 
        <dso id="1" type="grid"   function="pm_sel_61030070_popup_customer" > 
            <input bind="Grid_Asset">                    
                <input bind="txtCustomer" />
                <input bind="txtProject_Pk" />
            </input> 
            <output bind="Grid_Asset" /> 
        </dso> 
    </xml> 
</gw:data>  
<table style="width:100%;height:100%">
	<tr style="height:2%">
    	<td>
        	<fieldset style="padding:0">
            	<table width="100%" cellpadding="0" cellspacing="0">
                	<tr>
                    	<td align="right" width="15%">Customer&nbsp;</td>
                        <td width="85%"><gw:textbox id="txtCustomer" onenterkey="OnSearch()" styles='width:100%' /></td>
                        
                    </tr>
                </table>
            </fieldset>
        </td>
    </tr>
    <tr style="height:98%">
    	<td width="100%">
            <gw:grid   
            id="Grid_Asset"  
            header="_PK|No|Cust ID|Cust Name|Local Name|TAX CODE|SERIAL NO|FORM NO|ADDRESS"   
            format  ="0|0|0|0|0|0|0|0|0"  
            aligns  ="0|1|0|0|0|0|0|0|0"  
            defaults="||||||||"  
            editcol ="0|0|0|0|0|0|0|0|0"  
            widths  ="0|600|1500|3000|3000|1500|1500|1500|3000"  
            styles="width:100%; height:100%"   
            sorting="T" 
            oncelldblclick="OnDblClick()"  
             /> 
        </td>
    </tr>
</table>
 <gw:textbox id="txtProject_Pk"  style="display:none " />
</body>
</html>
