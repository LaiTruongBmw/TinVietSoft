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
 function OnToggle()
 {
 
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand"){
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/right1.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../system/images/left1.gif";
    }
 }    
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    BindingDataList();
        
    txtAssetPK.SetEnable(false);
    txtAssetCode.SetEnable(false);
    txtAssetName.SetEnable(false);
    
    txtProcessPK.SetEnable(false);
    txtProcessCode.SetEnable(false);
    txtProcessName.SetEnable(false);
    
    txtReqEmployeePK.SetEnable(false);
    txtReqEmployeeCode.SetEnable(false);
    txtReqEmployeeName.SetEnable(false);
    
    txtChargerPK.SetEnable(false);
    txtChargerCode.SetEnable(false);
    txtChargerName.SetEnable(false);
    lstReqType.SetEnable(false);
    txtReqDescription.SetEnable(false);
    btnCancel.SetEnable(false);
    btnApprove.SetEnable(false);
    
    dtReqFrDate.SetDataText(System.AddDate(dtReqFrDate.GetData(),-30));
    dtReqToDate.SetDataText(System.AddDate(dtReqToDate.GetData(),30));
    
    var ctrl = grdTask.GetGridControl();
    ctrl.ColFormat(G1_SEQ) = "###,###,###,###,###";
    ctrl = grdCons.GetGridControl();
    ctrl.ColFormat(G2_SEQ) = "###,###,###,###,###";    
    ctrl.ColFormat(G2_QTY) = "###,###,###,###,###";    

    
    OnSearch('grdItem');
    
}

//=================================================================================
function BindingDataList()
{  
     var data="";   
     data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( SALE_YN ='Y' or PUR_YN ='Y' or PROD_YN ='Y' or SEMI_PROD_YN ='Y' or MAT_YN ='Y' or SUB_MAT_YN = 'Y'  ) order by grp_nm ") %>||";
     lstItemGroup.SetDataText(data);   
     lstItemGroup.value="";
     
     data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC1140') FROM DUAL")%>"; //ma type
     lstReqType.SetDataText(data);
     lstReqType.value='';  
     
     data = "DATA|1|SAVED|2|SUBMIT|3|APPROVED|4|CANCEL|5|RESOLVED||"; //ma type
     lstStatus.SetDataText(data);
     lstStatus.value='';
     
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
function FormatGird(objGrid)
{
    for(var i =1 ; i < objGrid.rows; i ++)
    {
        switch(objGrid.GetGridData(i, G0_STATUS))
        {
            case '1'://save: white
                objGrid.SetCellBgColor(i,0,i,objGrid.cols -1,0xFFFFFF);
            break;
            case '2'://submit: yellow
                objGrid.SetCellBgColor(i,0,i,objGrid.cols -1,0xAFFAFF);
            break;
            case '3'://approve green
                objGrid.SetCellBgColor(i,0,i,objGrid.cols -1,0xFFFFCC);
            break;
            case '4'://cancel gray
                objGrid.SetCellBgColor(i,0,i,objGrid.cols -1,0xC0C0C0);
            break;
            case '5'://resolved linghte green
                objGrid.SetCellBgColor(i,0,i,objGrid.cols -1,0xFFFF33);
            break;
            default:
            break;
        }
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
    case 'data_fpma00060_2':
        data_fpma00060_3.Call('SELECT');
    break;
    case 'data_fpma00060_1':
        data_fpma00060_1.StatusSelect(); 
        OnChangeStatus(lblStatusCode.text);
        data_fpma00060_2.Call("SELECT");
    break;
    case 'pro_fpma00060':
        if(txtReturnValue.text != '')
        {
            data_fpma00060_1.Call('SELECT');
        }
    break;
    case 'pro_fpma00060_1':
        if(txtReturnValue.text != '')
        {
            data_fpma00060_1.Call('SELECT');
        }
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
                    data_fpma00060_1.StatusSelect();
                    txtReq_PK.text=objGrid.GetGridData(objGrid.row,G0_MA_REQ_M_PK);
                    OnChangeStatus(objGrid.GetGridData(objGrid.row,G0_STATUS));
                    data_fpma00060_1.Call('SELECT');                    
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
        btnApprove.SetEnable(true);
        btnCancel.SetEnable(false);
    }
    else
    {
        btnApprove.SetEnable(false);
        btnCancel.SetEnable(true);
    }
}
//=================================================================================
function OnSearch(pos)
{     
    switch(pos)
    {
        case'grdItem':
            txtAssetPK.text = '';
            data_fpma00060.Call("SELECT");
        break;
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
                pro_fpma00060.Call();
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
                pro_fpma00060_1.Call();
            } 
        break;
        default:
        break;
    }
    
}

function OnSave()
{
    if (txtAssetPK.text != '')
    {
        data_fpma00060_1.StatusUpdate();
        data_fpma00060_1.Call();
    }
    else
    {
        alert('Pls choose one request!');
    }
}
 
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpma00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_PRO_FPMA00060" > 
                <input>
                    <input bind="txtReq_PK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="pro_fpma00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_PRO_FPMA00060_1" > 
                <input>
                    <input bind="txtReq_PK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00060"> 
                <input bind="grdItem" >
                    <input bind="lstItemGroup" />
                    <input bind="txtItemSearch" />  
                    <input bind="lstStatus" />
                    <input bind="txt_ReqNo" />
                    <input bind="dtReqFrDate" />
                    <input bind="dtReqToDate" />
                </input>
                <output  bind="grdItem" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpma00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="<%=l_user%>lg_sel_fpma00060_1"  procedure="<%=l_user%>lg_upd_fpma00060_1"> 
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
    <gw:data id="data_fpma00060_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00060_2" > 
                <input bind="grdTask" >
                    <input bind="txtProcessPK" />
                    <input bind="txtReq_PK" />
                </input>
                <output  bind="grdTask" />
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00060_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00060_3"> 
                <input bind="grdCons" >
                    <input bind="txtProcessPK" />
                    <input bind="txtReq_PK" />
                </input>
                <output  bind="grdCons" />
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr>
            <td style="width: 30%; height: 100%" id="left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap;" align="right">
                            Group
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="lstItemGroup" styles="width:100%;" onchange="OnSearch('grdItem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Asset
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:textbox id="txtItemSearch" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap;" align="right">
                            Status
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="lstStatus" styles="width:100%;" onchange="OnSearch('grdItem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap;" align="right">
                            Req No
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:textbox id="txt_ReqNo" styles='width:100%' onenterkey="OnSearch('grdItem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap;" align="right">
                            Req Date
                        </td>
                        <td style="width: 79%">
                            <gw:datebox id="dtReqFrDate" lang="<%=Session("Lang")%>" onchange="OnSearch('grdItem')" />
                            ~
                            <gw:datebox id="dtReqToDate" lang="<%=Session("Lang")%>" onchange="OnSearch('grdItem')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdItem')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id='grdItem' header='Req No|_PK|Asset Code|Asset Name|UOM|_status|_MA_REQ_M_PK'
                                format='0|1|0|0|0|1|0' aligns='1|0|0|0|1|1|0' defaults='||||||' editcol='0|0|0|0|0|0|0'
                                widths='1000|1000|1200|2000|200|1000|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick='OnGridCellClick(this)' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 100%; padding: 0 0 0 0; margin: 0 0 0 0;" align="center" colspan="3">
                            <table style="width: 100%; height: 100%" border="1" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="white-space: nowrap;" align="center">
                                        <gw:label img="new" id="lblRecord" styles="font-weight: bold; color:#CC0000;" text="0 record(s)" />
                                    </td>
                                    <td style="background-color: #FFFFFF; color: Black;" align="center">
                                        SAVED
                                    </td>
                                    <td style="background-color: #FFFAAF; color: Black;" align="center">
                                        SUBMIT
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #CCFFFF; color: Black;" align="center">
                                        APPROVED
                                    </td>
                                    <td style="background-color: #C0C0C0; color: Black;" align="center">
                                        CANCEL
                                    </td>
                                    <td style="background-color: #A6FFD2; color: Black;" align="center">
                                        RESOLVED
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%; height: 100%" align="center" valign="top" id="right">
                <table style="width: 100%; height: 100%;" cellpadding="0" cellspacing="0" border="0">
                    <tr style="width: 100%; height: 1%; margin: 0 0 0 0; padding: 0 0 0 0">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 45%; white-space: nowrap">
                                        &nbsp;
                                    </td>
                                    <td style="width: 50%; white-space: nowrap;" align="center">
                                        <gw:label id="lblStatusCode" styles="font-weight: bold; color:red; font-size: 12;display:none;"
                                            text="3" />
                                        <gw:label id="lblStatus" styles="font-weight: bold; color:red; font-size: 12" text="" />
                                    </td>
                                    <td style="width: 1%">
                                        &nbsp;
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%;">
                                        <gw:icon id="btnCancel" img="2" text="Cancel" styles='width:100%' onclick="OnProcess('Cancel')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnApprove" img="2" text="Approve" styles='width:100%' onclick="OnProcess('Approve')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 99%">
                        <td valign="top">
                            <table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0">
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
                                                    <td style="width: 45%; height: 1%; white-space: nowrap" align="left" colspan="3">
                                                        <gw:datebox id="dtReqDate" lang="<%=Session("Lang")%>" onchange="" />
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
                                                    <td style="width: 45%; height: 1%; white-space: nowrap;">
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
                                                    <td style="width: 45%; white-space: nowrap;" colspan="3">
                                                        <gw:list id="lstReqType" styles="width:100%;" onchange="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 5%">
                                                        Description
                                                    </td>
                                                    <td style="width: 95%" colspan="5">
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
                                                                            widths='1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T' defaults='0|1|2|3|4|5|6|7'
                                                                            styles='width:100%; height:100%' />
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
                                <tr style="width: 100%; height: 50%">
                                    <td>
                                        <fieldset style="height: 91%; width: 100%; border: solid 1 #66CCFF; margin-left: 2;">
                                            <legend>Response Info:</legend>
                                            <table style="width: 100%; height: 100%" border="0">
                                                <tr>
                                                    <td style="width: 5%; height: 1%; white-space: nowrap">
                                                        Ma.Date
                                                    </td>
                                                    <td style="width: 20%; height: 1%;">
                                                        <gw:datebox id="dtMaDate" lang="<%=Session("Lang")%>" onchange="" />
                                                    </td>
                                                    <td style="width: 10%; height: 1%; white-space: nowrap">
                                                        <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color: #0000ff">
                                                            <b>Charger</b></a>
                                                    </td>
                                                    <td style="width: 60%; height: 1%; white-space: nowrap" align="left">
                                                        <gw:textbox id="txtChargerPK" maxlen="100" styles='width:100%;display:none' onenterkey="ClearValue(3)" />
                                                        <gw:textbox id="txtChargerCode" styles='width:30%' onenterkey="ClearValue(3)" />
                                                        <gw:textbox id="txtChargerName" styles='width:70%' onenterkey="ClearValue(3)" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 5%; height: 1%;">
                                                        Amount
                                                    </td>
                                                    <td style="width: 20%; height: 1%;">
                                                        <gw:textbox id="txtMaAmount" onchange="txtMaAmount_OnChange()" csstype="mandatory"
                                                            format="#,###,###,###,###.##R" styles="width:100%;text-align: Right" type="number" />
                                                    </td>
                                                    <td style="width: 10%; height: 1%; white-space: nowrap">
                                                        <a title="Ma.Partner" onclick="OnPopUp('Ma_Partner')" href="#Ma_Partner" style="color: #0000ff">
                                                            <b>Ma.Partner</b></a>
                                                    </td>
                                                    <td style="width: 60%; height: 1%; white-space: nowrap" align="left">
                                                        <gw:textbox id="txtMa_PartnerPK" maxlen="100" styles='width:100%;display:none' onenterkey="ClearValue(3)" />
                                                        <gw:textbox id="txtMa_PartnerCode" styles='width:30%' onenterkey="ClearValue(3)" />
                                                        <gw:textbox id="txtMa_PartnerName" styles='width:70%' onenterkey="ClearValue(3)" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 5%; height: 100%">
                                                        Description
                                                    </td>
                                                    <td style="width: 95%; height: 100%" colspan="5">
                                                        <gw:textarea id="txtResDescription" onchange="" styles="width:100%;height:100%;border:1px solid;border-color:#6B9EB8;background-color:#FFFFFF" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtReq_PK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <img status="expand" id="imgArrow" src="../../../system/images/left1.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!--------------------------------------------------------->
</body>
</html>
