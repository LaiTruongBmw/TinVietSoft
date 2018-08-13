<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Request Maintenance Approve</title>
</head>

<script type="text/javascript">

var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var  user_name  = "<%=Session("USER_NAME")%>" ;
    

var G0_REQ_NO               = 0,
    G0_PK                   = 1,
    G0_ITEM_CODE            = 2,
    G0_ITEM_NAME            = 3,
    G0_UOM                  = 4,
    G0_STATUS               = 5,
    G0_MA_REQ_M_PK          = 6;
    
var G1_PK		        = 0,
    G1_MA_REQ_M_PK		= 1,
    G1_SEQ		        = 2,
    G1_MA_TASK_PK		= 3,
    G1_MA_TASK_NAME		= 4,
    G1_MA_PROCESS_PK	= 5,
    G1_PROCESS_NAME		= 6,
    G1_MA_TASK_TYPE		= 7,
    G1_MA_TASK_TYPE_NAME= 8;
   
var G2_PK		        = 0,
    G2_MA_REQ_M_PK		= 1,
    G2_SEQ		        = 2,
    G2_ITEM_PK	        = 3,
    G2_ITEM_CODE		= 4,
    G2_ITEM_NAME		= 5,
    G2_QTY		        = 6,
    G2_MA_PROCESS_PK	= 7,
    G2_REMARK			= 8;
    

//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    BindingDataList();
        
    txtReq_PK.text =  "<%=request.QueryString("MaReqPK")%>";
    txtReqNo.SetEnable(false);
    txtAssetPK.SetEnable(false);
    txtAssetCode.SetEnable(false);
    txtAssetName.SetEnable(false);
    
    txtProcessPK.SetEnable(false);
    txtProcessCode.SetEnable(false);
    txtProcessName.SetEnable(false);
    
    txtReqEmployeePK.SetEnable(false);
    txtReqEmployeeCode.SetEnable(false);
    txtReqEmployeeName.SetEnable(false);
    dtReqDate.SetEnable(false);
    txtChargerPK.SetEnable(false);
    txtChargerCode.SetEnable(false);
    txtChargerName.SetEnable(false);
    lstReqType.SetEnable(false);
    txtReqDescription.SetEnable(false);
    txtMaAmount.SetEnable(false);
    txtMa_PartnerCode.SetEnable(false);
    txtMa_PartnerName.SetEnable(false);
    dtMaDate.SetEnable(false);
        
    var ctrl = grdTask.GetGridControl();
    ctrl.ColFormat(G1_SEQ) = "###,###,###,###,###";
    ctrl = grdCons.GetGridControl();
    ctrl.ColFormat(G2_SEQ) = "###,###,###,###,###";    
    ctrl.ColFormat(G2_QTY) = "###,###,###,###,###";    

    
    data_fpma00091_1.Call('SELECT');
    
}

//=================================================================================
function BindingDataList()
{  
     var data = "<%=ESysLib.SetListDataFUNC("SELECT COMM.f_logistic_code('LGPC1160') FROM DUAL")%>"; //ma type
     lstEvaluationType.SetDataText(data);
}

//=================================================================================
function ClearValue(pos)
{
    switch(pos)
    {
        case 1:
            txtSupplierPK.text = '';
            txtSupplierCode.text = '';
            txtSupplierName.text = '';              
        break;
        case 2:
            txtWarrantyPartnerPK.text = '';
            txtWarrantyPartnerCode.text = '';
            txtWarrantyPartnerName.text = '';              
        break;
        case 3:
            txtChargerPK.text = '';
            txtChargerCode.text = '';
            txtChargerName.text = '';              
        break;
        default:
        break;
    }
}

//=================================================================================
function OnDataReceive(p_oData)
{
  switch(p_oData.id)
  {
    case 'data_fpma00060':
        lblRecord.text = (grdItem.rows - 1 )+ ' record(s)';
        if(grdItem.rows - 1 > 0)
        {
            FormatGird(grdItem);
        }
    break;
    case 'data_fpma00091_2':
        data_fpma00091_3.Call('SELECT');
    break;
    case 'data_fpma00091_1':
        data_fpma00091_1.StatusSelect(); 
        OnChangeStatus(lblStatusCode.text);
        data_fpma00091_2.Call("SELECT");
    break;
    case 'pro_fpma00090':
         if(txtReturnValue.text != '')
        {
            alert(txtReturnValue.text);
            window.returnValue =  1;
        }
        else
        {
             window.returnValue =  null;
        }
        window.close();
    break;
    case 'pro_fpma00090_1':
        if(txtReturnValue.text != '')
        {
            alert(txtReturnValue.text);
            //data_fpma00091_1.Call('SELECT');
            window.returnValue =  1;
        }
        else
        {
             window.returnValue =  null;
        }
        window.close();
    break;
    
  }
}

//=================================================================================
function OnPopUp(pos)
{ 
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerCode.text = obj[1];
                txtChargerPK.text   = obj[0];
            }
        break;
        case 'Process':
            var path = System.RootURL + "/form/fp/ma/fpma00012.aspx";
	         var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
	         if ( obj != null )
	         {
	            txtProcessPK.text   = obj[0];
	            txtProcessCode.text = obj[3];                
                txtProcessName.text = obj[4];               
	         }
        break;
        case 'ReqEmployee':
            var path = System.RootURL + "/form/ch/ae/chae00010_search_emp.aspx";
             var object = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
             if ( object != null )
             {
                txtReqEmployeePK.text   = object[0];
                txtReqEmployeeCode.text = object[1];                
                txtReqEmployeeName.text = object[2];               
             }
        break;
        case 'Asset':
            var path = System.RootURL + '/form/fp/ma/fpma00052.aspx?group_type=Y|Y||||';
	        var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
	        if(obj!=null)
	        {
	            txtAssetPK.text = obj[0];
	            txtAssetCode.text = obj[1];
	            txtAssetName.text = obj[2];
	        }
	    case 'EvluationType':
	        var path = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC1160";
	        var obj = System.OpenModal( path ,800 ,600 ,'scroll:no;resizable:yes;status:yes');
	        if ( obj != null )
            {
                var data = "<%=ESysLib.SetListDataFUNC("SELECT COMM.f_logistic_code('LGPC1160') FROM DUAL")%>||";  //evaluation type
                lstEvaluationType.SetDataText(data);
                lstEvaluationType.value = obj[1];  
            }
	    break;
        default:
        break;
    }
 
} 

//=================================================================================
function OnGridCellClick(objGrid)
{
    switch(objGrid.id)
    {
        case 'grdItem':
            if(objGrid.row>0)
            {        
                //if(objGrid.GetGridData(objGrid.row,G0_PK)!=txtAssetPK.text)
                //{
                    data_fpma00091_1.StatusSelect();
                    txtReq_PK.text=objGrid.GetGridData(objGrid.row,G0_MA_REQ_M_PK);
                    OnChangeStatus(objGrid.GetGridData(objGrid.row,G0_STATUS));
                    data_fpma00091_1.Call('SELECT');                    
                //}
            }
        break;
        default:
        break;
    }
}
//=================================================================================
function OnChangeStatus(vStatus)
{
    if(vStatus != '3')
    {
        btnApprove.style.display = '';//.SetEnable(true);
        btnCancel.style.display = 'none';//.SetEnable(false);
    }
    else
    {
        btnApprove.style.display = 'none';//.SetEnable(false);
        btnCancel.style.display = '';//.SetEnable(true);
    }
}         
//=================================================================================
function Upcase()
{
	 var c = String.fromCharCode (event.keyCode); 
	 var x = c.toUpperCase().charCodeAt(0) ; 
	 event.keyCode = x; 
}
//================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Approve':
            if(txtAssetPK.text =='')
            {
                alert('Pls choose one Request!');
                return;
            }
            if ( confirm('Do you want to Approve this Request?'))
            {
                pro_fpma00090.Call();
            }   
        break;
        case 'Cancel':
            if(txtAssetPK.text =='')
            {
                alert('Pls choose one Request!');
                return;
            }
            if ( confirm('Do you want to Cancel this Request?'))
            {
                pro_fpma00090_1.Call();
            } 
        break;
        default:
        break;
    }
    
}

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpma00090" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_PRO_FPMA00090" > 
                <input>
                    <input bind="txtReq_PK" /> 
                    <input bind="txtResDescription" />
                    <input bind="lstEvaluationType" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="pro_fpma00090_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_PRO_FPMA00090_1" > 
                <input>
                    <input bind="txtReq_PK" /> 
                    <input bind="txtResDescription" />
                    <input bind="lstEvaluationType" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpma00091_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="<%=l_user%>lg_sel_fpma00091_1"  procedure="<%=l_user%>lg_upd_fpma00091_1"> 
                <inout> 
                    <inout bind="txtReq_PK" />
                    <inout bind="txtAssetPK"/>                    
                    <inout bind="txtAssetCode"/>
                    <inout bind="txtAssetName"/>
                                        
                    <inout bind="lblStatus" />
                    <inout bind="lblStatusCode" />
                    
                    <inout bind="txtProcessPK"/>
                    <inout bind="txtProcessCode"/>
                    <inout bind="txtProcessName"/>                    
                    
                    <inout bind="txtReqEmployeePK"/>
                    <inout bind="txtReqEmployeeCode"/>
                    <inout bind="txtReqEmployeeName"/>
                    
                    <inout bind="txtChargerPK"/>
                    <inout bind="txtChargerCode"/>
                    <inout bind="txtChargerName"/>
                    
                    <inout bind="dtReqDate" />
                    <inout bind="lstReqType"/>
                    
                    <inout bind="txtReqDescription" />
                    
                    <inout bind="txtReqNo"/>
                    <inout bind="dtMaDate"/>
                    
                    <inout bind="txtMaAmount"/>
                    <inout bind="txtResDescription" />
                    
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00091_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00091_2" > 
                <input bind="grdTask" >
                    <input bind="txtProcessPK" />
                    <input bind="txtReq_PK" />
                </input>
                <output  bind="grdTask" />
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00091_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00091_3"> 
                <input bind="grdCons" >
                    <input bind="txtProcessPK" />
                    <input bind="txtReq_PK" />
                </input>
                <output  bind="grdCons" />
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr style="width: 100%; height: 50%">
            <td>
                <fieldset style="height: 100%; width: 100%; border: solid 1 #66CCFF; padding: 0 0 0 0;
                    margin: 0 0 0 2;">
                    <legend>Response Info:</legend>
                    <table style="width: 100%; height: 100%" border="0">
                        <tr style="height: 1%">
                            <td style="width: 5%; white-space: nowrap">
                                Ma.Date
                            </td>
                            <td style="width: 20%;">
                                <gw:datebox id="dtMaDate" lang="<%=Session("Lang")%>" onchange="" />
                            </td>
                            <td style="width: 10%; white-space: nowrap">
                                Charger
                            </td>
                            <td style="width: 40%; white-space: nowrap" align="left">
                                <gw:textbox id="txtChargerPK" maxlen="100" styles='width:100%;display:none' onenterkey="" />
                                <gw:textbox id="txtChargerCode" styles='width:30%' onenterkey="" />
                                <gw:textbox id="txtChargerName" styles='width:70%' onenterkey="" />
                            </td>
                            <td style="width: 5%; white-space: nowrap">
                            </td>
                            <td style="width: 20%; white-space: nowrap" align="left">
                                <gw:icon id="btnCancel" img="2" text="Cancel" styles='width:100%' onclick="OnProcess('Cancel')" />
                                <gw:icon id="btnApprove" img="2" text="Approve" styles='width:100%' onclick="OnProcess('Approve')" />
                            </td>
                        </tr>
                        <tr style="height: 1%">
                            <td style="width: 5%;">
                                Amount
                            </td>
                            <td style="width: 20%;">
                                <gw:textbox id="txtMaAmount" onchange="" csstype="mandatory" format="#,###,###,###,###.##R"
                                    styles="width:100%;text-align: Right" type="number" />
                            </td>
                            <td style="width: 10%; white-space: nowrap">
                                Ma.Partner
                            </td>
                            <td style="width: 40%; white-space: nowrap" align="left">
                                <gw:textbox id="txtMa_PartnerPK" maxlen="100" styles='width:100%;display:none' onenterkey="" />
                                <gw:textbox id="txtMa_PartnerCode" styles='width:30%' onenterkey="" />
                                <gw:textbox id="txtMa_PartnerName" styles='width:70%' onenterkey="" />
                            </td>
                            <td style="width: 5%; white-space: nowrap; font-weight: bold; color: red; font-size: 12">
                                <a title="Evaluation Type" onclick="OnPopUp('EvluationType')" href="#tips" style="color:red"><b>Evaluation Type</b></a>
                            </td>
                            <td style="width: 20%; white-space: nowrap" align="left">
                                <gw:list id="lstEvaluationType" styles="width:100%;font-weight: bold; color:red; font-size: 12"
                                    onchange="" />
                            </td>
                        </tr>
                        <tr style="height: 97%">
                            <td style="width: 5%;">
                                Description
                            </td>
                            <td style="width: 95%;" colspan="8">
                                <gw:textarea id="txtResDescription" onchange="" styles="width:100%;height:90%;border:1px solid;border-color:#6B9EB8;background-color:#FFFFFF" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="width: 100%; height: 10%;">
            <td>
                <fieldset style="height: 100%; width: 100%; border: solid 1 #66CCFF; border-bottom-style: none;
                    padding: 0 0 0 0; margin: 0 0 0 2;">
                    <legend>Request info :</legend>
                    <table style="width: 100%; height: 1%" border="0">
                        <tr>
                            <td style="width: 5%; height: 1%">
                                Request No
                            </td>
                            <td style="width: 45%; height: 1%; white-space: nowrap;">
                                <gw:textbox id="txtReqNo" onchange="" csstype="mandatory" styles='width:100%' />
                            </td>
                            <td style="width: 5%; height: 1%; white-space: nowrap" align="left">
                                Req Date
                            </td>
                            <td style="width: 15%; height: 1%; white-space: nowrap" align="left">
                                <gw:datebox id="dtReqDate" lang="<%=Session("Lang")%>" onchange="" />
                            </td>
                            <td style="width: 30%; white-space: nowrap;" align="center">
                                <gw:label id="lblStatusCode" styles="font-weight: bold; color:red; font-size: 12;display:none;"
                                    text="3" />
                                <gw:label id="lblStatus" styles="font-weight: bold; color:red; font-size: 12" text="" />
                            </td>
                            <td style="width: 1%; height: 1%; white-space: nowrap">
                            </td>
                            <td style="width: 1%; height: 1%; white-space: nowrap">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; height: 1%;">
                                Asset
                            </td>
                            <td style="width: 45%; height: 1%; white-space: nowrap;">
                                <gw:textbox id="txtAssetPK" maxlen="100" styles='width:100%;display:none' />
                                <gw:textbox id="txtAssetCode" csstype="mandatory" styles='width:30%' />
                                <gw:textbox id="txtAssetName" csstype="mandatory" styles='width:70%' />
                            </td>
                            <td style="width: 5%; height: 1%; white-space: nowrap;">
                                Req Employee
                            </td>
                            <td style="width: 45%; height: 1%; white-space: nowrap;" colspan="4">
                                <gw:textbox id="txtReqEmployeePK" maxlen="100" styles='width:100%;display:none' onenterkey="ClearValue(2)" />
                                <gw:textbox id="txtReqEmployeeCode" csstype="mandatory" styles='width:30%' onenterkey="ClearValue(2)" />
                                <gw:textbox id="txtReqEmployeeName" csstype="mandatory" styles='width:70%' onenterkey="ClearValue(2)" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; height: 1%">
                                Process
                            </td>
                            <td style="width: 45%; height: 1%; white-space: nowrap" align="left">
                                <gw:textbox id="txtProcessPK" maxlen="100" styles='width:100%;display:none' />
                                <gw:textbox id="txtProcessCode" csstype="mandatory" styles='width:30%' onenterkey="ClearValue(1)" />
                                <gw:textbox id="txtProcessName" csstype="mandatory" styles='width:70%' onenterkey="ClearValue(1)" />
                            </td>
                            <td style="width: 5%; white-space: nowrap" align="left">
                                Request Type
                            </td>
                            <td style="width: 45%; white-space: nowrap;" colspan="4">
                                <gw:list id="lstReqType" styles="width:100%;" onchange="" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%">
                                Description
                            </td>
                            <td style="width: 95%" colspan="6">
                                <gw:textarea id="txtReqDescription" onchange='' styles="width:100%;height:80px;border:1px solid;border-color:#6B9EB8;background-color:#e9e9e9" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="width: 100%; height: 40%;">
            <td>
                <fieldset style="height: 99%; width: 100%; border: solid 1 #66CCFF; border-top-style: none;
                    padding: 0 0 0 0; margin: 0 0 0 2;">
                    <table style="width: 100%; height: 100%" border="0">
                        <tr>
                            <td style="height: 100%; width: 50%">
                                <fieldset style="width: 100%; height: 100%; border-style: none; border-top: solid 1 #66CCFF;">
                                    <legend>Task List:</legend>
                                    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                        <tr style="height: 100%">
                                            <td>
                                                <gw:grid id='grdTask' header='_PK|_MA_REQ_M_PK|Seq|_MA_TASK_PK|Task Name|_MA_PROCESS_PK|_PROCESS_NAME|_MA_TASK_TYPE|Task Type'
                                                    format='0|0|1|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0' check='||||||||' editcol='1|1|1|1|1|1|1|1|1'
                                                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
                                                    defaults='||||||||' styles='width:100%; height:100%' />
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                            <td style="height: 100%; width: 0.2%; background-color: #66CCFF;" align="justify">
                            </td>
                            <td style="height: 100%; width: 49%">
                                <fieldset style="width: 100%; height: 100%; border-style: none; border-top: solid 1 #66CCFF;
                                    padding: 0 0 0 0; margin: 0 0 0 0;">
                                    <legend>Tool List:</legend>
                                    <table style="width: 100%; height: 100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr style="width: 100%; height: 100%">
                                            <td>
                                                <gw:grid id='grdCons' header='_PK|_MA_REQ_M_PK|Seq|_IITEM_PK|Item Code|Item Name|Qty|_MA_PROCESS_PK|Remark'
                                                    format='0|0|1|0|0|0|1|0|0' aligns='0|0|1|0|0|0|3|0|0' check='||||||||' editcol='0|0|0|0|0|0|0|0|0'
                                                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
                                                    defaults='0|1|2|3|4|5|6|7' styles='width:100%; height:100%' />
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtReq_PK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
