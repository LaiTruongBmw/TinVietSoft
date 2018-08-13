<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Popup Asset Movement Entry</title>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
</head>

<script type="text/javascript">

var caller = dialogArguments;

//alias for detail

var G1_SEQ		        = 0,
    G1_PK		        = 1,
    G1_MA_MOVE_M_PK		= 2,
    G1_MA_ASSET_PK		= 3,
    G1_ASSET_CODE		= 4,
    G1_ASSET_NAME		= 5,
    G1_UOM		        = 6,
    G1_DESCRIPTION		= 7;
    
var arr_FormatNumber = new Array();  
//====================================================================================
function BodyInit()
{
    System.Translate(document);
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
	txtMasterPK.text = "<%=request.QueryString("ma_move_m_pk")%>";
	var _Action =  "<%=request.QueryString("Action")%>";
	if(_Action == '1')
	{
	    btnCancel.style.display = '';
	    btnApprove.style.display = 'none';
	}
	else
	{
	    btnCancel.style.display = 'none';
	    btnApprove.style.display = '';
	}
    txtSlipNo.SetEnable(false);
    txtRequestorPK.SetEnable(false);
    txtRequestName.SetEnable(false);
    txtCrrChargerPK.SetEnable(false);
    txtCrrChargerName.SetEnable(false);
    txtNextChargerPK.SetEnable(false);
    txtNextChargerName.SetEnable(false);
    txtFromDept_Pk.SetEnable(false);
    txtFromDept_Id.SetEnable(false);
    txtFromDept_Name.SetEnable(false);
    txtToDept_Pk.SetEnable(false);
    txtToDept_Id.SetEnable(false);
    txtToDept_Name.SetEnable(false);
    txtEmployeePK.SetEnable(false);
    txtEmployeeName.SetEnable(false);
    document.getElementById("lend").style.display="none";  
    
    SetGridFormat();
    BindingDataList();
    
    data_fpma00110_1.Call('SELECT');
   
    
 }
//====================================================================================

function BindingDataList()
{
    
    var data="";
        
    data = "<%=ESysLib.SetListDataSQL("SELECT  a.trans_code, a.trans_code||'-'||a.trans_name  FROM tlg_in_trans_code a WHERE a.del_if = 0 and trans_type='A' order by a.trans_code ")%>"; //move type
    lstMoveType.SetDataText(data);
    lstMoveType.value='';  
    
}
//====================================================================================
 function SetGridFormat()
 {
    var ctrl = grdDetail.GetGridControl(); 
    
    ctrl.ColFormat(G1_SEQ)    = "#,###,###,###,###,###";
 }

//====================================================================================
 
function OnSearch(pos)
{
    switch (pos)
    {
       
        case 'Master':
            data_fpma00110_1.Call('SELECT');
        break;
    }
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_fpma00110_1":   
               data_fpma00110_2.Call('SELECT');           
        break;  
        //----------------------
        case "data_fpma00110_2":   
            lblRecord.text = (grdDetail.rows - 1) + ' record(s)';
        break; 
           
        case "pro_fpma00120_1": 
            alert(txtReturnValue.text); 
            window.returnValue =  1;
		    window.close();
        break;        
        
        case "pro_fpma00120":  
             alert(txtReturnValue.text);
            window.returnValue =  1;
		    window.close();
        break;
       
    }
} 
//====================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Cancel':            
            if ( confirm ('Do you want to Cancel ?'))
                {
                     pro_fpma00120_1.Call();
                }         
            
        break;
        case 'Approve':
            if ( confirm ('Do you want to Approve ?') )
                 {
                     pro_fpma00120.Call();
                 }            
        break;
        default:
        break;
        
    }
}


</script>

<body>
    
    <!------------------------------------------------------------------------->
    <gw:data id="data_fpma00110_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="<%=l_user%>lg_sel_fpma00110_1"> 
                <inout>             
                    <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtMoveDate" />
                     <inout  bind="txtFromDept_Pk" />
                     <inout  bind="txtFromDept_Id" />
                     <inout  bind="txtFromDept_Name" />
                     <inout  bind="txtToDept_Pk" />
                     <inout  bind="txtToDept_Id" />
                     <inout  bind="txtToDept_Name" />
                     <inout  bind="txtResDescription" /> 
                     <inout  bind="lblStatus" />
                     <inout  bind="lblApproveBy" />
                     <inout  bind="lblCancelBy" />
                     <inout  bind="lstMoveType" />
                     <inout  bind="txtRequestorPK" />                         
                     <inout  bind="txtRequestName" />
                     <inout  bind="txtCrrChargerPK" />
                     <inout  bind="txtCrrChargerName" />
                     <inout  bind="txtNextChargerPK" />
                     <inout  bind="txtNextChargerName" />
                     <inout  bind="txtEmployeePK" />
                     <inout  bind="txtEmployeeName" />
                     <inout  bind="dtReturn" />
                     <inout  bind="txtRSlipNo" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_fpma00110_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="grid" parameter="0,1,2,3,7" function="<%=l_user%>lg_sel_fpma00110_2" procedure="<%=l_user%>lg_upd_fpma00110_2"> 
                <input> 
                    <input bind="txtMasterPK" />                
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_fpma00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00120" > 
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
    <gw:data id="pro_fpma00120_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00120_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------LAYOUT------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 1%">
            <td style="width: 95%" align="center">
                <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='' />
            </td>
            <td style="width: 1%" align="right">
            </td>
            <td style="width: 1%" align="right">
            </td>
            <td style="width: 1%" align="right">
            </td>
            <td style="width: 1%" align="right">
                <gw:icon id="btnCancel" img="2" text="Cancel" styles='width:100%' onclick="OnProcess('Cancel')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:icon id="btnApprove" img="2" text="Approve" styles='width:100%' onclick="OnProcess('Approve')" />
            </td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td style="width: 100%; height: 1%" colspan="6">
                 <table style="width: 100%; height: 100%" border="0">
                        <tr style="height: 1%">
                            <td style="width: 5%;" align="right">
                                Slip No
                            </td>
                            <td style="width: 20%">
                                <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                            </td>
                            <td style="width: 5%">
                                Date
                            </td>
                            <td style="width: 20%; white-space: nowrap;" colspan="2">
                                <gw:datebox id="dtMoveDate" lang="<%=Session("Lang")%>" mode="01" onchange="" />
                            </td>                                   
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Move Type
                            </td>
                            <td style="width: 45%; white-space: nowrap" colspan="2">
                                <gw:list id="lstMoveType" styles='width:100%' />
                            </td>
                        </tr>                                
                        <tr style="height: 1%">
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Curr Dept
                            </td>
                            <td style="width: 44%; white-space: nowrap" colspan="3">
                                <gw:textbox id="txtFromDept_Pk" styles="width:100%;display:none" csstype="mandatory" />
                                <gw:textbox id="txtFromDept_Id" styles="width:30%;" csstype="mandatory" />
                                <gw:textbox id="txtFromDept_Name" styles="width:70%;" csstype="mandatory" />
                            </td>
                            <td style="width: 1%;">
                                
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                 Curr Charger
                            </td>
                            <td style="width: 44%; white-space: nowrap">
                                <gw:textbox id="txtCrrChargerPK" styles="width:100%;display:none" csstype="mandatory" />
                                <gw:textbox id="txtCrrChargerName" styles="width:100%;" csstype="mandatory" />
                            </td>
                            <td style="width: 1%;">
                              
                            </td>
                        </tr>
                        <tr style="height: 1%">
                            <td style="width: 5%; white-space: nowrap" align="right">
                                 To Dept
                            </td>
                            <td style="width: 44%; white-space: nowrap" colspan="3">
                                <gw:textbox id="txtToDept_Pk" styles="width:100%;display:none" csstype="mandatory" />
                                <gw:textbox id="txtToDept_Id" styles="width:30%;" csstype="mandatory" />
                                <gw:textbox id="txtToDept_Name" styles="width:70%;" csstype="mandatory" />
                            </td>                               
                           
                            <td style="width: 1%;">
                               
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Next Charger
                            </td>
                            <td style="width: 44%; white-space: nowrap">
                                <gw:textbox id="txtNextChargerPK" styles="width:100%;display:none" csstype="mandatory" />
                                <gw:textbox id="txtNextChargerName" styles="width:100%;" csstype="mandatory" />
                            </td>
                            <td style="width: 1%;">
                               
                            </td>
                        </tr>
                        <tr style="height: 1%">
                            <td style="width: 5%; white-space: nowrap" align="right">
                                Employee
                            </td>
                            <td style="width: 44%; white-space: nowrap;" colspan="3">
                                <gw:textbox id="txtEmployeePK" styles="width:100%;display:none"  />
                                <gw:textbox id="txtEmployeeName" styles="width:100%;"  />
                            </td>
                            <td style="width: 1%;">
                                
                            </td>
                             <td style="width: 5%" align="right">
                                Requestor
                            </td>
                            <td style="width: 45%; white-space: nowrap" colspan="2">
                                <gw:textbox id="txtRequestorPK" styles="display:none" />
                                <gw:textbox id="txtRequestName" styles="width:100%" />
                            </td>
                        </tr>
                        <tr id="lend">
                            <td style="width: 5%;" align="right">
                                Return DT
                            </td>
                            <td style="width: 20%">
                                <gw:datebox id="dtReturn" lang="<%=Session("Lang")%>" mode="01" onchange=""  nullaccept/>
                            </td>
                            <td style="width: 5%">
                                <gw:icon id="idBtnReturn" img="2" text="Return" styles='width:100%' onclick="OnProcess('Return')" />                                      
                            </td>
                            <td style="width: 20%; white-space: nowrap;" colspan="2">
                                
                            </td>  
                              <td style="width: 5%;" align="right">
                                Return Slip
                            </td>
                            <td style="width: 20%">
                                <gw:textbox id="txtRSlipNo" csstype="mandatory" styles="width:100%;" />
                            </td>                                       
                        </tr>
                        <tr style="height: 1%">
                            <td style="width: 5%; white-space: nowrap">
                                Description
                            </td>
                            <td style="width: 95%; white-space: nowrap" colspan="7">
                                <gw:textarea id="txtResDescription" onchange="" styles="width:100%;height:100px;border:1px solid;border-color:#6B9EB8;background-color:#ffffff" />
                            </td>
                        </tr>                                
                    </table>
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="6">
                <table>
                    <tr>
                        <td style="width: 20%; white-space: nowrap;" align="left">
                            Approve By:
                            <gw:label id="lblApproveBy" styles='width:100%;color:cc0000;font:9pt;align:left'
                                text='' />
                        </td>
                        <td style="width: 56%" align="center">
                            <gw:label id="lblRecord" styles='width:100%;color:cc0000;font:9pt;align:left' text='0 record(s)' />
                        </td>
                        <td style="width: 20%; white-space: nowrap;" align="left">
                            Cancel By:
                            <gw:label id="lblCancelBy" styles='width:100%;color:cc0000;font:9pt;align:left' text='' />
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            
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
            <td colspan="6">
                <gw:grid id='grdDetail' header='Seq|_PK|_MA_MOVE_M_PK|_MA_ASSET_PK|Asset Code|Asset Name|UOM|Tra. Qty|Remark'
                    format='1|1|1|1|0|0|0|1|0' aligns='1|0|0|0|0|0|1|0|0' check='||||||||' editcol='0|0|0|0|0|0|0|0|0'
                    widths='1000|1000|1000|1000|1000|1000|500|1000|1000' sorting='T' autosize='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="display:none"></gw:textbox>
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <!------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!------------------------------------------------------------------->
</body>
</html>
