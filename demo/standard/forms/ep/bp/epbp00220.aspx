<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Purchasing Order Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";



var G1_CO_COST_CENTER_PK    = 0,
    G1_CENTER_ID            = 1,
    G1_CENTER_NAME          = 2,
    G1_ITEM_PK              = 3,
    G1_ITEM_CODE            = 4,
    G1_ITEM_NAME            = 5,
    G1_PR_QTY               = 6,
    G1_PR_UOM               = 7,
    G1_PO_QTY               = 8,
    G1_PO_UOM               = 9,
    G1_IN_QTY               = 10,
    G1_IN_UOM               = 11;
                   

//==================================================================
         
function BodyInit()
{       
    System.Translate(document);

    //---------------------------------- 
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;   
    //-----------------------------------------   
    FormatGrid();
    OnSearch();
 
}
//==================================================================
  
function FormatGrid()
{
    var ctrl = grdDetail.GetGridControl();   
     
    ctrl.ColFormat(G1_PR_QTY)   = "###,###,###.##" ;
    ctrl.ColFormat(G1_PO_QTY)   = "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_QTY)   = "###,###,###.##" ;
    //---------------------

}

//==================================================================
function OnSearch()
{
    data_epbp00220.Call("SELECT");
}

//==================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
         case 'POConfirm':
            if ( grdDetail.row > 0 )
            {
                var path = System.RootURL + '/standard/formsep/bp/epbp00031.aspx?po_pk=' + grdDetail.GetGridData( grdDetail.row, G1_PO_PK);
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
                if ( object != null )                    
                {
                    OnSearch('grdDetail');
                }
            }  
	        else
	        {
	            alert('Pls select P/O.');
	        }                   
         break ;
         
         case 'POApprove':
            if ( grdApprove.row > 0 )
            {
                var path = System.RootURL + '/standard/formsep/bp/epbp00032.aspx?po_pk=' + grdApprove.GetGridData( grdApprove.row, G2_PO_PK);
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
                
                if ( object != null )                    
                {
                    OnSearch('grdDetail');
                }
	        }
	        else
	        {
	            alert('Pls select P/O.');
	        }         	        
         break;                        
     }       
}

//==================================================================

function OnDataReceive(obj)
{
    switch(obj)
    {
        case'data_epbp00220':
            alert("111111");
        break;
    }
    
}
 
//==================================================================

//==================================================================
   
 
//==================================================================
         
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_epbp00220" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00220" > 
                <input bind="grdDetail" >
					<input bind="dtConfirmFrom" /> 
                    <input bind="dtConfirmTo" /> 
                    <input bind="txtCostCenter" /> 
                    <input bind="txtItem" /> 
                    <input bind="radType" /> 
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            P/O Date</td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtConfirmFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtConfirmTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Cost Center</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtCostCenter" maxlen="100" styles='width:100%' />
                        </td>
                        <td align="right" style="width: 1%; white-space: nowrap">
                            Item
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:textbox id="txtItem" maxlen="100" styles='width:100%' />
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:radio id="radType" value="ITEM" styles="width:100%"> 
                                <span value="ITEM" id="tab_INVItem">Item</span> 
                                <span value="GROUP" id="tab_INVGroup">Group</span>
                            </gw:radio>
                        </td>
                        <td style="width: 27%; text-align: center; white-space: nowrap">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch1" onclick="OnSearch()" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10">
                            <gw:grid id='grdDetail' header='_CO_COST_CENTER_PK|Center ID|Center Name|_ITEM_PK|Item Code|Item Name|PR Qty|PR Uom|PO Qty|PO Uom|In Qty|In Uom'
                                format='0|0|0|0|0|0|1|0|1|0|1|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0' check='|||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1500|2000|1000|1500|2000|1100|800|1100|800|1100|800'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtArrayPOPK" styles='width:100%;display:none' />
    <gw:textbox id="txtCancelChargerPK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
