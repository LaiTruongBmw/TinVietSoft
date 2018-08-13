<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>STOCK ADJUST APPROVE : VIEW DETAIL</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//---------------------------------------------------------
var G1_DETAIL_PK    = 0, 
    G1_MASTER_PK    = 1,
    G1_SEQ          = 2,
    G1_ITEM_PK      = 3,
    G1_ITEM_CODE    = 4
    G1_ITEM_NAME    = 5,
    G1_UOM          = 6,
    G1_LOT_NO       = 7,
    G1_STOCK_QTY    = 8,
    G1_STOCK_AMOUNT = 9,
    G1_OPEN_QTY     = 10,
    G1_OPEN_AMOUNT  = 11,
    G1_ADJUST_QTY   = 12,
    G1_ADJUST_AMOUNT= 13,
    G1_REMARK       = 14;    

//-----------------------------------------------------

function BodyInit()
{  
    System.Translate(document);  // Translate to language session    
    
    //----------  
    txtChargerName.SetEnable(false);
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
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name  ASC" )%>";    
     lstWarehouse.SetDataText(data);
          
     //-----------------------  
     
     var ctrl = grdDetail.GetGridControl(); 
    
     ctrl.ColFormat(G1_STOCK_QTY)  = "#,###,###,###,###,###.##";
     ctrl.ColFormat(G1_OPEN_QTY)   = "#,###,###,###,###,###.##";
     ctrl.ColFormat(G1_ADJUST_QTY) = "#,###,###,###,###,###.##";        
                       
 }

//=====================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'Master':
            data_bisa00031_1.Call("SELECT");
        break;
        
        case 'grdDetail':            
            data_bisa00031_2.Call("SELECT");
        break;
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bisa00031_1": 
            //-------------------                       
            OnSearch('grdDetail');                  
                
        break;

        case "data_bisa00031_2":            
            if ( grdDetail.rows - 1 > 0 )
            {
                grdDetail.GetGridControl().Cell( 7, 1, G1_ADJUST_QTY, grdDetail.rows - 1, G1_ADJUST_AMOUNT ) = 0x3300cc;
            
                grdDetail.SetCellBold( 1, G1_STOCK_QTY,  grdDetail.rows - 1, G1_STOCK_QTY,  true);	
                grdDetail.SetCellBold( 1, G1_OPEN_QTY,   grdDetail.rows - 1, G1_OPEN_QTY,   true);
                grdDetail.SetCellBold( 1, G1_ADJUST_QTY, grdDetail.rows - 1, G1_ADJUST_QTY, true);
                
                grdDetail.SetCellBgColor( 1, G1_OPEN_QTY , grdDetail.rows - 1, G1_OPEN_AMOUNT , 0xCCFFFF );                
                
                grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE, true);			                			
            }    
            //----------------------                
        break;
        
        case "pro_bisa00031" :
			alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();  
        break;
		
		case "pro_bisa00031_1" :
			alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();  
        break;		
   }            
}

//===================================================================================
function OnProcess(pos)
{
    switch (pos)
    {        
        case 'Approve': 
            if ( txtMasterPK.text != '' )
            {                   
                pro_bisa00031.Call();
            }    
        break;  
		
		case 'Cancel': 
            if ( txtMasterPK.text != '' )
            {                   
                pro_bisa00031_1.Call();
            }    
        break;       
    }    
}
//===================================================================================
</script>

<body>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bisa00031_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7" function="st_lg_sel_bisa00031_1"  > 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="dtStockDate" />                        
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="lbStatus" />
                     <inout  bind="lstWarehouse" />
                     <inout  bind="txtRemark" />                    
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bisa00031_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_lg_sel_bisa00031_2" > 
                <input bind="grdDetail">                     
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bisa00031" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bisa00030" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="pro_bisa00031_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bisa00030_1" > 
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
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td align="right" style="width: 10%; white-space: nowrap">
                Stock Date
            </td>
            <td style="width: 25%" colspan="3">
                <gw:datebox id="dtStockDate" lang="1" />
            </td>
            <td align="right" style="width: 10%">
                Charger
            </td>
            <td style="width: 35%">
                <gw:textbox id="txtChargerName" styles="width:100%" />
                <gw:textbox id="txtChargerPK" styles="display:none" />
            </td>
            <td style="width: 19%; white-space: nowrap" align="center">
                <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt;align:center' text='-' />
            </td>
            <td style="width: 1%">
                <gw:button id="btnApprove" img="approve" text="Approve" onclick="OnProcess('Approve')" />
				<gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
            </td>
        </tr>
        <tr style="height: 2%">
            <td align="right" style="width: 10%">
                W/H
            </td>
            <td style="width: 25%" colspan="3">
                <gw:list id="lstWarehouse" styles='width:100%' csstype="mandatory" />
            </td>
            <td style="width: 10%" align="right">
                Remark
            </td>
            <td colspan="7">
                <gw:textbox id="txtRemark" styles="width:100%;" />
            </td>
        </tr>
        <tr style="height: 94%">
            <td colspan="11">
                <gw:grid id='grdDetail' header='_PK|_OPEN_M_PK|Seq|_ITEM_PK|Item Code|Item Name|UOM|Lot No|Stock Qty|Stock Amount|Check Qty|Check Amount|Adjust Qty|Adjust Amount|Description'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|1|1|3|3|3|3|3|3|0'
                    check='||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|0|800|0|2000|3000|1000|1200|1500|1500|1500|1500|1500|1500|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtReturnValue" styles="display:none;" />
<!---------------------------------------------------------------------------------->
</html>
