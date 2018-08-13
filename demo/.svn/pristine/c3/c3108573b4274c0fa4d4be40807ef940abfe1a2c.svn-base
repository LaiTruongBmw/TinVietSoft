<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Accounting Contract No</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script language="javascript">
function BodyInit()
{
	System.Translate(document);
	var _TAC_ABPK_pk =  "<%=request.QueryString("TAC_ABPL_pk")%>";
	txtTAC_ABPK_pk.SetDataText(_TAC_ABPK_pk);
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
		code_data[2] = Grid_Asset.GetGridData( ctrl.row , 4 );//pk
		code_data[3] = Grid_Asset.GetGridData( ctrl.row , 5 );
		code_data[4] = Grid_Asset.GetGridData( ctrl.row , 3 );
		window.returnValue = code_data; 
	   	this.close(); 	
}
</script>
<body>
<gw:data id="dso_Subcont"  onreceive="" > 
    <xml> 
        <dso id="1" type="grid"   function="pm_sel_61030070_popup_acc" > 
            <input bind="Grid_Asset">                    
                <input bind="txtSubcontract_No" />
                <input bind="txtTAC_ABPK_pk" />
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
                    	<td align="right" width="25%">Contract No&nbsp;</td>
                        <td width="75%"><gw:textbox id="txtSubcontract_No" onenterkey="OnSearch()" styles='width:100%' /></td>
                        
                    </tr>
                </table>
            </fieldset>
        </td>
    </tr>
    <tr style="height:98%">
    	<td width="100%">
            <gw:grid   
            id="Grid_Asset"  
            header="_PK|No|Contract|Customer|_Tco_buspartner_pk|_customer_cd"   
            format  ="0|0|0|0|0|0"  
            aligns   ="0|1|0|0|0|0"  
            defaults="|||||"  
            editcol ="0|0|0|0|0|0"  
            widths  ="0|600|2000|2000|0|0"  
            styles="width:100%; height:100%"   
            sorting="T" 
            oncelldblclick="OnDblClick()"  
             /> 
        </td>
    </tr>
</table>
 <gw:textbox id="txtTAC_ABPK_pk"  style="display:none " />
</body>
</html>
