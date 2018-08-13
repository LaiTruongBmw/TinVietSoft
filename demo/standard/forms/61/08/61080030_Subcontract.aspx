<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Subcontract</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script language="javascript">
function BodyInit()
{
	System.Translate(document);
	var _Project_pk =  "<%=request.QueryString("Project_pk")%>";
	txtProject_Pk.SetDataText(_Project_pk);
    txtSubcontract_No.GetControl().focus();
	//OnSearch();
}
//============================================================================================

//============================================================================================

//============================================================================================
function OnSearch()
{
	dso_Subcont.Call('SELECT');
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
		code_data[3] = Grid_Asset.GetGridData( ctrl.row , 4 );//acc subcontract cd
		code_data[4] = Grid_Asset.GetGridData( ctrl.row , 7 );//pk
		window.returnValue = code_data; 
	   	this.close(); 	
}
</script>

<body>
    <gw:data id="dso_Subcont" onreceive=""> 
    <xml> 
        <dso id="1" type="grid"   function="pm_sel_61080030_subcontract" > 
            <input bind="Grid_Asset">                    
                <input bind="txtProject_Pk" />
                <input bind="txtSubcontract_No" />
            </input> 
            <output bind="Grid_Asset" /> 
        </dso> 
    </xml> 
</gw:data>
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td>
                <fieldset style="padding: 0">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="right" width="25%">
                                Subcontract No&nbsp;
                            </td>
                            <td width="75%">
                                <gw:textbox id="txtSubcontract_No" onenterkey="OnSearch()" styles='width:100%' />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 98%">
            <td width="100%">
                <gw:grid id="Grid_Asset" header="_PK|No|Subcontract No|Subcontract Name|Request No|Order Work Code|Order Work Name|_tac_crsubcontract_pk"
                    format="0|0|0|0|0|0|0|0" aligns="0|1|0|0|0|0|0|0" defaults="|||||||" editcol="0|0|0|0|0|0|0|0"
                    widths="0|600|2000|3000|1500|1500|2000|100" styles="width:100%; height:100%" sorting="T"
                    oncelldblclick="OnDblClick()" />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtProject_Pk" style="display: none" />
</body>
</html>
