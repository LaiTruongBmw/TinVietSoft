<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Others In/Out Entry</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//-----------------------------------------------------

var flag;

var G_MASTER_PK = 0,
    G_Status    = 1,
    G_Date      = 2,
    G_SLIP_NO   = 3;

//=================================================================================
var G1_TLG_ST_OTHERS_D_PK       = 0,
    G1_TLG_ST_OTHERS_M_PK       = 1,
    G1_SEQ                      = 2,    
    G1_REF_NO                   = 3,
    G1_TLG_IT_ITEM_PK           = 4,
    G1_ITEM_CODE                = 5,    
    G1_ITEM_NAME                = 6,
    G1_TR_QTY                   = 7,    
    G1_TR_UOM                   = 8,     
    G1_LOT_NO                   = 9,
    G1_DESCRIPTION              = 10;
    
var arr_FormatNumber = new Array();    

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    
    txtUser_PK.text = "<%=session("USER_PK")%>";
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
    txtSlipNo.SetEnable(false);
    txtStaffName.SetEnable(false);
    txtCostNM.SetEnable(false);    
    txtRemark.SetEnable(false);    
    //----------------------------         
    SetGridFormat();  
    //----------------------------
	txtMasterPK.text = "<%=Request.querystring("master_pk")%>";
	
	p_type = "<%=Request.querystring("type")%>";  
	
	if ( p_type == 'APPROVE' )
	{ 
		idBtnCancel.style.display = "none";
	}
	else
	{
		idBtnApprove.style.display = "none";
	}    
    
    OnSearch('grdMaster');
 }
  
 //==================================================================================

 function SetGridFormat()
 {
 	 var data = ""; 
     //-----------------------------------------------
     data = 'DATA|I130|OTHERS IN|O130|OTHERS OUT';
     lstTransCode.SetDataText(data);     
     	 
     data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_id||' * '||wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name  ASC" )%>||"; 
     lstWH.SetDataText(data);
	 //-----------------------------------------------
     var ctr = grdDetail.GetGridControl(); 
         
     ctr.ColFormat(G1_TR_QTY) = "#,###,###,###,###,###.##";        
    
     arr_FormatNumber[G1_TR_QTY] = 2;       
 }  
//=============================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdMaster':
            data_bias00191_1.Call("SELECT");                             
        break;
        
        case 'grdDetail':            
            data_bias00191_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bias00191_2":
           
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE,  true);
	            
                grdDetail.SetCellBold( 1, G1_TR_QTY, grdDetail.rows - 1, G1_TR_QTY, true);            
                
                grdDetail.SetCellBold( 1, G1_REF_NO, grdDetail.rows - 1, G1_REF_NO, true);
                                  
                //--------------------------------                
            }         
        break;
        
        case "data_bias00191_1":
                data_bias00191_2.Call('SELECT');
        break;
        
        case 'pro_bias00191':
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;
		
		case 'pro_bias00191_1':
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;	         
   }            
}

//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Approve' :
            if ( txtMasterPK.text != '' )
            {         
                if ( confirm('Do you want to approve this Slip?'))
                {
                    pro_bias00191.Call();
                } 
            }              
        break;
        case 'Cancel' :
            if ( txtMasterPK.text != '' )
            {         
                if ( confirm('Do you want to cancel this Slip?'))
                {
                    pro_bias00191_1.Call();
                } 
            }              
        break;
    }
}
//=================================================================================
</script>

<body>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bias00191_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_lg_sel_bias00191_1"> 
                <inout> 
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtRemark" />
                     <inout  bind="dtSlip" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="lblStatus" />   
                     <inout  bind="lstWH" />  
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffName" />
                     <inout  bind="lstTransCode" />
                     <inout  bind="txtRefNo" />
                     <inout  bind="txtCostPK" />
                     <inout  bind="txtCostNM" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bias00191_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="st_lg_sel_bias00191_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bias00191" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00190" > 
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
    <gw:data id="pro_bias00191_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00190_1" > 
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
                            <gw:datebox id="dtSlip" lang="1" onchange="OnChangeDate()" />
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
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idBtnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />
                            <gw:button id="idBtnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Ref No
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtRefNo" styles="width:100%;" />
                        </td>
                        <td align="right" style="width: 10%">
                            Charger
                        </td>
                        <td colspan="7">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            W/H
                        </td>
                        <td style="white-space: nowrap" colspan="3">
                            <gw:list id="lstWH" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Cost Center
                        </td>
                        <td colspan="7">
                            <gw:textbox id="txtCostPK" styles="display:none" />
                            <gw:textbox id="txtCostNM" styles="width:100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="white-space: nowrap">
                            Trans Code
                        </td>
                        <td colspan="3">
                            <gw:list id="lstTransCode" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td style="width: 10%" align="right">
                            Remark
                        </td>
                        <td colspan="9">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="12">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 64%" align="right">
                                    </td>
                                    <td style="width: 19%; white-space: nowrap" align="center">
                                    </td>
                                    <td align="right" style="width: 1%">
                                    </td>
                                    <td align="right" style="width: 1%">
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
                        <td colspan="12">
                            <gw:grid id='grdDetail' header='_PK|_TLG_ST_OTHERS_M_PK|Seq|Ref No|_tlg_it_item_pk|Item Code|Item Name|Qty|UOM|Lot No|Description'
                                format='0|0|0|0|0|0|0|1|0|0|0' aligns='0|0|1|0|0|0|0|0|0|0|0' check='||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0' widths='0|0|500|1000|0|1400|2200|1200|1000|1200|1000'
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
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
</html>
