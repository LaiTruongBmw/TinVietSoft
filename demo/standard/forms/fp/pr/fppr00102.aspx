<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Prod Income Cancel</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//-----------------------------------------------------

var flag;

var G_PK        = 0,
    G_Status    = 1,
    G_SLip_No   = 2,
    G_Date      = 3,
    G_Line      = 4;

//=================================================================================
var G1_DETAIL_PK   = 0,
    G1_MASTER_PK   = 1,
    G1_SEQ         = 2,
    G1_REF_NO      = 3,
    G1_ITEM_PK     = 4,
    G1_ITEM_CODE   = 5,
    G1_ITEM_NAME   = 6,
    G1_IN_QTY      = 7,
    G1_IN_UOM      = 8,
    G1_LOT_NO      = 9,
    G1_DESCRIPTION = 10,
    G1_TABLE_PK    = 11,
    G1_TABLE_NM    = 12; 
    
var arr_FormatNumber = new Array();    
 //===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    
    txtMasterPK.text = "<%=Request.querystring("income_pk")%>";
    txtSlipNo.SetEnable(false);
    txtPONo.SetEnable(false);
    txtStaffID.SetEnable(false);
    txtStaffName.SetEnable(false);
    //----------------------------         
    SetGridFormat();  
    OnSearch('grdMaster');
 }
 //==================================================================================
 
 function SetGridFormat()
 {    
     var data = ""; 
     
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and wh_type ='04'  ORDER BY wh_name  ASC" )%>";    
     lstWH.SetDataText(data);
     
     data = "<%=ESysLib.SetListDataSQL("SELECT pk,line_id || ' - ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id  ASC" )%>";    
     lstLine.SetDataText(data);                

     var ctr = grdDetail.GetGridControl(); 
    
     ctr.ColFormat(G1_IN_QTY) = "#,###,###,###,###,###.##"; 
     
     arr_FormatNumber[G1_IN_QTY] = 2;        
 }
//=============================================================================================
function OnSearch(pos)
{
    switch (pos)
    {    
        case 'grdMaster':
              data_fppr00102_1.Call("SELECT");
        break;
        
        case 'grdDetail':            
            data_fppr00102_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fppr00102_1": 
        
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_MASTER_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_MASTER_PK, txtMasterPK.text);
                    } 
                }
                OnSave('Detail');                
            }
            else
            {
                OnSearch('grdDetail');   
            }
                            
        break;

        case "data_fppr00102_2":
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE,  true);	            
                grdDetail.SetCellBold( 1, G1_IN_QTY, grdDetail.rows - 1, G1_IN_QTY, true);                
                grdDetail.SetCellBold( 1, G1_REF_NO, grdDetail.rows - 1, G1_REF_NO, true);
                
                grdDetail.SetCellBgColor( 1, G1_ITEM_CODE , grdDetail.rows - 1, G1_ITEM_NAME , 0xCCFFFF );       
                //-------------------------------
               var sumAmount =0
                for(var i =1 ; i<grdDetail.rows; i++ )
                 {
                    sumAmount = sumAmount + Number(grdDetail.GetGridData(i,G1_IN_QTY));
                }
                lblSumQty.text = sumAmount;
            }                  
        break;

        case 'pro_fppr00102_cancel':
            alert(txtReturnValue.text);
            window.returnValue = 1;
            window.close();
        break;              
   }            
}
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Cancel' :
            if ( confirm('Do you want to cancel this Slip?'))
            {
                pro_fppr00102_cancel.Call();
            }         
        break;      
    }
}
//=================================================================================
</script>

<body>
    <!------------------------------------------------------------------------->
    <gw:data id="data_fppr00102_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppr00102_1"  procedure="<%=l_user%>lg_upd_fppr00102_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtVoucherDate" /> 
                     
                     <inout  bind="txtSOPK" />
                     <inout  bind="txtPONo" />
                                             
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffID" />
                     <inout  bind="txtStaffName" />
                     
                     <inout  bind="lstLine" /> 
                     <inout  bind="lstWH" />
                                          
                     <inout  bind="txtRemark" /> 
                     <inout  bind="lblStatus" />                                
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00102_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fppr00102_2"   procedure="<%=l_user%>lg_upd_fppr00102_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00102_cancel" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00102" > 
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
            <td id="t-right" style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Slip No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 10%" align="left">
                            <gw:datebox id="dtVoucherDate" lang="1" />
                        </td>
                        <td align="right" style="width: 10%">
                        </td>
                        <td style="width: 40%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="idBtnCancel" img="2" text="Cancel" styles='width:100%' onclick="OnProcess('Cancel')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            P/O
                        </td>
                        <td style="white-space: nowrap" colspan="3">
                            <gw:textbox id="txtSOPK" styles="display:none" />
                            <gw:textbox id="txtPONo" styles="width:100%" />
                        </td>
                        <td align="right" style="width: 10%">
                            Charger
                        </td>
                        <td colspan="8" style="white-space: nowrap">
                            <gw:textbox id="txtStaffID" styles="width:30%" />
                            <gw:textbox id="txtStaffName" styles="width:70%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Line
                        </td>
                        <td colspan="3">
                            <gw:list id="lstLine" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            W/H
                        </td>
                        <td style="white-space: nowrap" colspan="8">
                            <gw:list id="lstWH" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Remark
                        </td>
                        <td colspan="12">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="13">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 50%" align="right">
                                        Sum Qty:
                                    </td>
                                    <td style="width: 30%" align="left">
                                        <gw:label id="lblSumQty" styles='width:100%;color:blue;font:9pt;align:left' />
                                    </td>
                                    <td align="right" style="width: 1%">
                                    </td>
                                    <td align="right" style="width: 1%; display: none">
                                    </td>
                                    <td align="right" style="width: 1%">
                                    </td>
                                    <td align="right" style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="13">
                            <gw:grid id='grdDetail' header='_PK|_MASTER_PK|Seq|Ref No|_ITEM_PK|Item Code|Item Name|In Qty|UOM|Lot No|Description|_table_pk|_table_nm'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|1|0|0|0|3|1|1|0|0|0' check='||||||||||||'
                                editcol='0|0|1|1|0|0|0|1|0|1|1|0|0' widths='0|0|1000|1500|0|2000|3000|1500|1000|2000|1000|0|0'
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
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
</html>
