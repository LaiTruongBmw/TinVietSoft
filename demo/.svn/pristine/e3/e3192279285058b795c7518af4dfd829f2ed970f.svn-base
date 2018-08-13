<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Asset</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script language="javascript">
function BodyInit()
{
	System.Translate(document);
	var _Company_pk =  "<%=request.QueryString("company_pk")%>";
	txtCompany_pk.SetDataText(_Company_pk);
	//OnSearch();
}
//============================================================================================

//============================================================================================

//============================================================================================
function OnSearch()
{
	dso_Asset.Call('SELECT');
}
//============================================================================================

//============================================================================================
function OnDblClick()
{
		var code_data=new Array()
	    var ctrl = Grid_Asset.GetGridControl();
        code_data[0] = Grid_Asset.GetGridData( ctrl.row , 0 );//pk
		code_data[2] = Grid_Asset.GetGridData( ctrl.row , 2 );//code
		code_data[3] = Grid_Asset.GetGridData( ctrl.row , 3 );//name
		window.returnValue = code_data; 
	   	this.close(); 	
}
</script>
<body>
<gw:data id="dso_Asset"  onreceive="" > 
    <xml> 
        <dso id="1" type="grid"   function="ac_pro_60130180_popup_Asset" > 
            <input bind="Grid_Asset">                    
                <input bind="txtAsset" />
                <input bind="txtCompany_pk" />
            </input> 
            <output bind="Grid_Asset" /> 
        </dso> 
    </xml> 
</gw:data>  
<table style="width:100%;height:100%">
	<tr style="height:4%">
    	<td>
        	<fieldset style="padding:0">
            	<table width="100%" cellpadding="0" cellspacing="0">
                	<tr>
                    	<td align="right" width="5%">Asset&nbsp;</td>
                        <td width="45%"><gw:textbox id="txtAsset" onenterkey="OnSearch()" styles='width:100%' /></td>
                        <td width="50%"></td>
                    </tr>
                </table>
            </fieldset>
        </td>
    </tr>
    <tr style="height:96%">
    	<td width="100%">
            <gw:grid   
            id="Grid_Asset"  
            header="_PK|No|Asset No|Asset Name"   
            format  ="0|0|0|0"  
            aligns   ="0|1|0|0"  
            defaults="|||"  
            editcol ="0|0|0|0"  
            widths  ="0|600|2000|3000"  
            styles="width:100%; height:100%"   
            sorting="T" 
            oncelldblclick="OnDblClick()"  
             /> 
        </td>
    </tr>
</table>
 <gw:textbox id="txtCompany_pk" lang="1" style="display:none " />
</body>
</html>
