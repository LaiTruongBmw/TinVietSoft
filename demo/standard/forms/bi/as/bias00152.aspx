<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Discard Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//=================================================================================
var G1_DETAIL_PK     = 0,
    G1_SEQ           = 1,
    G1_REF_NO        = 2,    
    G1_OUT_ITEM_PK   = 3,
    G1_OUT_ITEM_CODE = 4,
    G1_OUT_ITEM_NAME = 5,    
    G1_OUT_QTY       = 6,
    G1_OUT_UOM       = 7,    
    G1_LOT_NO        = 8,     
    G1_REMARK        = 9,
    G1_MASTER_PK     = 10;
    

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document); 
    txtSlipNo.SetEnable(false);
    txtStaffName.SetEnable(false);
    txtPLName.SetEnable(false);    
   
    //----------------------------         
    SetGridFormat();  
	
	txtMasterPK.text = "<%=Request.querystring("master_pk")%>";
    OnSearch('grdMaster');
 }
  
 //==================================================================================

 function SetGridFormat()
 {
 	 var data = ""; 
     //-----------------------------------------------
     data = "<%=CtlLib.SetListDataSQL("SELECT TRANS_CODE ,TRANS_CODE || ' - ' || trans_name  FROM tlg_in_trans_code  WHERE del_if = 0 and type = 'O' and TRANS_CODE = 'O110' ORDER BY trans_code" )%>";    
     lstTransType.SetDataText(data);     
     	 
     data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_name  FROM inv.tin_warehouse  WHERE del_if = 0  ORDER BY wh_name  ASC" )%>";    
     lstWH.SetDataText(data);  
	 //-----------------------------------------------
     var ctr = grdDetail.GetGridControl(); 
         
     ctr.ColFormat(G1_OUT_QTY) = "#,###,###,###,###,###.###";               
 }  
 
//=============================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdMaster':                
            data_bias00152_1.Call("SELECT");                              
        break;
        
        case 'grdDetail':            
            data_bias00152_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bias00152_1": 
                //---------------------------- 
                OnSearch('grdDetail');                            
        break;

        case "data_bias00152_2":
           
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G1_OUT_ITEM_CODE, grdDetail.rows - 1, G1_OUT_ITEM_CODE,  true);
	            
                grdDetail.SetCellBold( 1, G1_OUT_QTY, grdDetail.rows - 1, G1_OUT_QTY, true);            
                
                grdDetail.SetCellBold( 1, G1_REF_NO, grdDetail.rows - 1, G1_REF_NO, true);
                                  
                //--------------------------------                
            }         
        break;

        case 'pro_bias00152':
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
        case 'Cancel' :
            if ( txtMasterPK.text != '' )
            {         
                if ( confirm('Do you want to cancel this Slip?'))
                {
                    pro_bias00152.Call();
                } 
            }              
        break;
    }
}
 
//=================================================================================
</script>

<body>       
    <!------------------------------------------------------------------------->
    <gw:data id="data_bias00152_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_lg_sel_bias00152_1"  procedure="st_lg_upd_bias00152_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtVoucherDate" />                          
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffName" />
                     <inout  bind="lstWH" />
                     <inout  bind="txtPLPK" />
                     <inout  bind="txtPLName" />
                     <inout  bind="lstTransType" />
                     <inout  bind="txtRemark" /> 
                     <inout  bind="lblStatus" />     
                     <inout  bind="txtRefNo" />                      
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bias00152_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="st_lg_sel_bias00152_2"   procedure="st_lg_upd_bias00152_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bias00152" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00152" > 
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
                            <gw:datebox id="dtVoucherDate" lang="1" onchange="OnChangeDate()" />
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
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                Charger</b></a>
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
                            <a title="P/L" onclick="OnPopUp('PL')" href="#tips" style="color=#0000ff"><b>P/L</b></a>
                        </td>
                        <td colspan="7">
                            <gw:textbox id="txtPLPK" styles="display:none" />
                            <gw:textbox id="txtPLName" styles="width:100%" />
                        </td>
                    </tr>                                    
                    <tr style="height: 1%">
                        <td align="right" style="white-space: nowrap" >
						    Trans Type
						</td>
						<td colspan="3">
							 <gw:list id="lstTransType" styles='width:100%' csstype="mandatory" />
						</td>
                        <td style="width: 10%" align="right">
                            Remark
                        </td>
                        <td colspan="9">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                    </tr>
                    
                    <tr style="height: 97%">
                        <td colspan="12">
                            <gw:grid id='grdDetail' 
								header='_PK|Seq|Ref No|_OUT_ITEM_PK|Out Item Code|Out Item Name|Out Qty|UOM|Lot No|Remark|_MASTER_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|1|1|0|0|0|3|1|1|0|0'
                                check='||||||||||' 
								editcol='0|1|1|0|0|0|1|0|1|1|0'
                                widths='0|800|1500|0|2000|3000|1500|800|1500|1000|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" 
								/>
                            />
                        </td>
                    </tr>
                </table>
            
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
</html>
