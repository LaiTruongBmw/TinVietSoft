<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>STOCK CLOSING</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script language="javascript" type="text/javascript">
//-----------------------------------------------------

var flag;

var G_PK    = 0 ;
//---------------------------------------------------------
 
var G1_DETAIL_PK    = 0, 
    G1_MASTER_PK    = 1,    
    G1_SEQ          = 2,
    G1_ITEM_PK      = 3,
    G1_ITEM_CODE    = 4,
    G1_ITEM_NAME    = 5,
    G1_UOM          = 6,   
    G1_LOT_NO       = 7,
    G1_PRICE        = 8,
    G1_BEGIN_QTY    = 9,
    G1_BEGIN_AMOUNT = 10,
    G1_IN_QTY       = 11,
    G1_IN_AMOUNT    = 12,
    G1_OUT_QTY      = 13,   
    G1_OUT_AMOUNT   = 14,
    G1_END_QTY      = 15,
    G1_END_AMOUNT   = 16,
    G1_REMARK       = 17;
		
//===================================================================================

function BodyInit()
{  
    System.Translate(document);  // Translate to language session    
    //----------  
    txtChargerName.SetEnable(false);
    //-------------------------
    var now = new Date(); 
    //----------------------------    
    BindingDataList();    
    //----------------------------
    txtMasterPK.text = "<%=Request.querystring("slip_pk")%>";
	
	p_type = "<%=Request.querystring("type")%>";  
	
	if ( p_type == 'APPROVE' )
	{ 
		btnCancel.style.display = "none";
	}
	else
	{
		btnApprove.style.display = "none";
	}
		
    OnSearch('Master');
 }
 
 //======================================================================================
 
 function BindingDataList()
 {  
     var data ;
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name  ASC" )%>";    
     lstWarehouse.SetDataText(data);
     
    
     //-----------------------  
     
     var ctrl = grdDetail.GetGridControl(); 
    
     ctrl.ColFormat(G1_BEGIN_QTY)    = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_BEGIN_AMOUNT) = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_IN_QTY)       = "#,###,###,###,###,###.###";        
     ctrl.ColFormat(G1_IN_AMOUNT)    = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_OUT_QTY)      = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_OUT_AMOUNT)   = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_END_QTY)      = "#,###,###,###,###,###.###";
     ctrl.ColFormat(G1_END_AMOUNT)   = "#,###,###,###,###,###.###";                  
 }
  
//=====================================================================================
function OnProcess(pos)
{
     switch(pos)
     {
        case 'Approve' :
                pro_bimc00061.Call();  
        break;
		
		case 'Cancel' :
                pro_bimc00061_1.Call();  
        break;		
     }
}

//=====================================================================================
function OnSearch(pos)
{
    switch (pos)
    {    
        case 'Master':
            data_bimc00061_1.Call("SELECT");
        break;
        
        case 'grdDetail':            
            data_bimc00061_2.Call("SELECT");
        break;
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bimc00061_1": 
            OnSearch('grdDetail');                
        break;

        case "data_bimc00061_2":            
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_BEGIN_QTY, grdDetail.rows - 1, G1_BEGIN_QTY, true);	
                grdDetail.SetCellBold( 1, G1_IN_QTY,    grdDetail.rows - 1, G1_IN_QTY,    true);
                grdDetail.SetCellBold( 1, G1_OUT_QTY,   grdDetail.rows - 1, G1_OUT_QTY,   true);
                grdDetail.SetCellBold( 1, G1_END_QTY,   grdDetail.rows - 1, G1_END_QTY,   true);                
                grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE, true);			
            }    
            //----------------------                
        break;
        
        case 'pro_bimc00061':
                alert(txtReturnValue.text);
                window.returnValue = 1; 
                this.close();
		break;
		
		case 'pro_bimc00061_1':
                alert(txtReturnValue.text);
                window.returnValue = 1; 
                this.close();
		break;		
   }            
}
 
//===================================================================================

</script>

<body>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bimc00061_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5" function="st_lg_sel_bimc00061_1"  > 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="lstWarehouse" />   
                     <inout  bind="dtStockDate" />                                            
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />   
					 <inout  bind="lbStatus" />                                             
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bimc00061_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_lg_sel_bimc00061_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bimc00061" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bimc00060" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------->
    <gw:data id="pro_bimc00061_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bimc00060_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="right" style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="background-color: #B4E7FF" colspan="11">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 97%" align="center">
									 	<gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt;align:center' text='-' />				
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="btnApprove" img="Approve" text="Approve" alt="" onclick="OnProcess('Approve')" />
										<gw:button id="btnCancel" img="Cancel" text="Cancel" alt="" onclick="OnProcess('Cancel')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 2%">						 
                        <td align="right" style="width: 5%">
                            W/H
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstWarehouse" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Stock Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtStockDate" lang="1" />
                        </td>                       
                        <td align="right" style="width: 5%">
                            Charger
                        </td>
                        <td style="width: 35%">
                            <gw:textbox id="txtChargerName" styles="width:100%" />
                            <gw:textbox id="txtChargerPK" styles="display:none" />
                        </td>
                    </tr>                      
                    <tr style="height: 94%">
                        <td colspan="7">
                            <gw:grid id='grdDetail' header='_PK|_M_PK|Seq|_ITEM_PK|Item Code|Item Name|UOM|Lot No|Unit Price|Begin Qty|Begin Amount|In Qty|In Amount|Out Qty|Out Amount|End Qty|End Amount|Remark'
                                format='0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1' 
								aligns='0|0|0|0|0|0|1|1|3|3|3|3|3|3|3|3|3|0'
                                editcol='0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1' widths='0|0|800|0|1500|2500|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<!---------------------------------------------------------------------------------->
</html>
