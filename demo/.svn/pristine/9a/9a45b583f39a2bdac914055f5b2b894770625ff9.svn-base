<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Request Maintenance</title>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
</head>

<script type="text/javascript" language="javascript">

var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var  user_name  = "<%=Session("USER_NAME")%>" ;
var l_NewTextStatus = '<< New Request >>';
var _flag = '';
var p_update = 0;
var G0_REQ_NO               = 0,
    G0_PK                   = 1,
    G0_ITEM_CODE            = 2,
    G0_ITEM_NAME            = 3,
    G0_UOM                  = 4,
    G0_STATUS               = 5,
    G0_MA_REQ_M_PK          = 6;
 
var G2_PK                        =0,
    G2_SEQ                       =1,
    G2_ASSET_PK                  =2,
    G2_ITEM_CODE                 =3,
    G2_ITEM_NAME                 =4,
    G2_DESCRIPTION               =5,
    G2_PART_PK                   =6;
    
var G3_PK		        = 0,
    G3_MA_REQ_M_PK		= 1,
    G3_SEQ		        = 2,
    G3_MA_TASK_PK		= 3,
    G3_MA_TASK_NAME		= 4,
    G3_MA_PROCESS_PK	= 5,
    G3_PROCESS_NAME		= 6,
    G3_MA_TASK_TYPE		= 7,
    G3_MA_TASK_TYPE_NAME= 8;
   
var G4_PK		        = 0,
    G4_MA_REQ_M_PK		= 1,
    G4_SEQ		        = 2,
    G4_ITEM_PK	        = 3,
    G4_ITEM_CODE		= 4,
    G4_ITEM_NAME		= 5,
    G4_QTY		        = 6,
    G4_MA_PROCESS_PK	= 7,
    G4_REMARK	= 8;



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
    txt_ReqPK.text =  "<%=request.QueryString("MA_REQ_PK")%>";
    System.Translate(document);  // Translate to language session
    BindingDataList();
    
    txtLoacationLoad.text = '';
    txtAssetPK.SetEnable(false);
    txtAssetCode.SetEnable(false);
    txtAssetName.SetEnable(false);
    
    txtProcessPK.SetEnable(false);
    txtProcessCode.SetEnable(false);
    txtProcessName.SetEnable(false);
    
    txtChargerPK.SetEnable(false);
    txtChargerCode.SetEnable(false);
    txtChargerName.SetEnable(false);
    
    txtReqEmployeePK.SetEnable(false);
    txtReqEmployeeCode.SetEnable(false);
    txtReqEmployeeName.SetEnable(false);
    
    dtMaDate.SetEnable(false);
    txtMaAmount.SetEnable(false);
    txtResDescription.SetEnable(false);
    
    txtMa_PartnerPK.SetEnable(false);
    txtMa_PartnerCode.SetEnable(false);
    txtMa_PartnerName.SetEnable(false);
    
        
    
    dtReqFrDate.SetDataText(System.AddDate(dtReqFrDate.GetData(),-30));
    dtReqToDate.SetDataText(System.AddDate(dtReqToDate.GetData(),30));
    
    if(txt_ReqPK.text == '')
    {
         data_fpma00050_1.StatusInsert();
        txtReqEmployeePK.text = user_pk;
        txtReqEmployeeName.text = user_name;
        lblStatus.text = l_NewTextStatus;
       OnSearch('grdItem');
    }
    else
    {
        OnToggle();
        _flag = 'POPUP';
        document.getElementById("imgArrow").style.display = 'none';
        data_fpma00050_1.Call('SELECT');
    }
    
}
//=================================================================================
function OnAddNew()
{
    if( data_fpma00050_1.GetStatus() != 20)
    {
        data_fpma00050_1.StatusInsert();
        lblStatus.text = l_NewTextStatus;
        grdCons.ClearData();
        grdTask.ClearData();
    }
    OnPopUp('Asset');
}
//=================================================================================
function BindingDataList()
{  
    var ctrl = grdTask.GetGridControl();
    ctrl.ColFormat(G3_SEQ) = "###,###,###,###,###";
    ctrl = grdCons.GetGridControl();
    ctrl.ColFormat(G4_SEQ) = "###,###,###,###,###";  
    ctrl.ColFormat(G4_QTY) = "###,###,###,###,###";    
    
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
function OnSave(pos)
{ 
    switch(pos)
    {
        case 'MASTER':  
            p_update = 1;
            data_fpma00050_1.Call();
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
    case 'data_fpma00050':
        lblRecord.text = (grdItem.rows - 1 )+ ' record(s)';
        if(grdItem.rows > 0)
        {
            FormatGird(grdItem);
        }
    break;
    case 'data_fpma00050_1':
        /*data_fpma00050_1.StatusSelect(); 
        for(var j = 1; j < grdTask.rows; j ++)
        {
            var s =  grdTask.GetRowStatus(j);
            grdTask.SetGridText(j, G3_MA_REQ_M_PK, txt_ReqPK.text);
            grdTask.SetRowStatus(j,s);
        }*/
        if(p_update == 1)
        {
            for(var i =1; i < grdTask.rows; i ++)
            {
                grdTask.SetGridText(i, G3_MA_REQ_M_PK, txt_ReqPK.text);
                if(grdTask.GetGridData(i,G3_PK)=="")
                    {
                    grdTask.SetRowStatus(i,0x20);
                    }
            }  
            data_fpma00050_2.Call();
        }
        else
        {
            data_fpma00050_2.Call('SELECT');
        }
    break;
    case 'pro_fpma00050':
        if(txtReturnValue.text != '')
        {
            data_fpma00050_1.Call('SELECT');
        }
    break;
    case 'pro_fpma00050_1':
        if(txtCopyRtnValue.text != '')
        {
            txt_ReqPK.text = txtCopyRtnValue.text;
            data_fpma00050_1.Call('SELECT');
        }
    break;
    case 'data_fpma00050_2':
        lblRecordTask.text = (grdTask.rows - 1 )+ ' record(s)';
        txtLoacationLoad.text =''
        if(p_update == 1)
        {
             for(var i =1; i < grdCons.rows; i ++)
            {
                grdCons.SetGridText(j, G4_MA_REQ_M_PK, txt_ReqPK.text);
                
                if(grdTask.GetGridData(i,G4_PK)=="")
                    {
                        grdCons.SetRowStatus( i , 0x20 );
                    }
            }
            data_fpma00050_3.Call();
        }
        else
        {
            data_fpma00050_3.Call('SELECT');
        }
    break
    case 'data_fpma00050_3':
        lblRecordCons.text = (grdCons.rows - 1 )+ ' record(s)';
        p_update = 0
        txtLoacationLoad.text ='';       
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
function OnDelete(pos) 
{
    switch (pos)
    {
        case 'MASTER':
            if ( confirm ("Do you want to delete this order?" ))
            {
                data_fpma00050_1.StatusDelete();            
                if (txtAssetPK.text!="")            
                    data_fpma00050_1.Call()                
                else            
                    alert("Please,Select a Item !")
            }
        break;  
        case 'grdCons':
            if(grdCons.GetGridData(grdCons.row,G3_PK)=="")
            {
                grdCons.RemoveRow();
            }else
            {
                grdCons.DeleteRow();
            }
        break;  
        case 'grdTask':
             if(grdTask.GetGridData(grdTask.row,G4_PK)=="")
            {
                grdTask.RemoveRow();
            }else
            {
                grdTask.DeleteRow();
            }
            
        break;  
        default:
        break;	   
    }     
}
//=================================================================================
function OnUnDelete(pos)
{
    switch(pos)
    {
        case 'grdCons':
            grdCons.UnDeleteRow();
        break;
        case 'grdTask':
            grdTask.UnDeleteRow();
        break;
        default:
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
                if(data_fpma00050_1.GetStatus()!= 20)
                    data_fpma00050_1.StatusUpdate();
            }
        break;
        case 'Process':
            var path = System.RootURL + "/form/fp/ma/fpma00012.aspx";
	         var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
	         if ( obj != null )
	         {
	            txtLoacationLoad.text = 'POPUP';
	            txtProcessPK.text   = obj[0];
	            txtProcessCode.text = obj[3];                
                txtProcessName.text = obj[4];    
                if(data_fpma00050_1.GetStatus()!= 20)
                    data_fpma00050_1.StatusUpdate();  
                data_fpma00050_2.Call('SELECT');     
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
                if(data_fpma00050_1.GetStatus()!= 20)
                    data_fpma00050_1.StatusUpdate();              
             }
        break;
        case 'Ma_Partner':
            var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AP";
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                txtMa_PartnerPK.text   = object[0];
                txtMa_PartnerCode.text = object[1];                
                txtMa_PartnerName.text = object[2];                
             }
        break;
        case 'Asset':
            var path = System.RootURL + '/form/fp/ma/fpma00052.aspx?AssetLine=&group_type=Y|Y||||';
	        var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
	        if(obj!=null)
	        {
	            txtAssetPK.text = obj[0];
	            txtAssetCode.text = obj[1];
	            txtAssetName.text = obj[2];
	            if(data_fpma00050_1.GetStatus()!= 20)
                    data_fpma00050_1.StatusUpdate();
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
                var _val_Status = objGrid.GetGridData(objGrid.row,G0_STATUS);
                if(_val_Status == '3' || _val_Status == '5')
                {
                    btnDelete.SetEnable(false);
                    btnSave.SetEnable(false);
                }
                else
                {
                    btnDelete.SetEnable(true);
                    btnSave.SetEnable(true);
                }
                //if(objGrid.GetGridData(objGrid.row,G0_PK)!=txtAssetPK.text)
                //{
                    //data_fpma00050_1.StatusSelect();
                    txt_ReqPK.text=objGrid.GetGridData(objGrid.row,G0_MA_REQ_M_PK);
                    data_fpma00050_1.Call('SELECT');                    
               // }
                
            }
        break;
        default:
        break;
    }
}
//=================================================================================
function OnSearch(pos)
{     
    switch(pos)
    {
        case'grdItem':
            txtAssetPK.text = '';
            data_fpma00050.Call("SELECT");
        break;
    }   
	
}

//================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Submit':
            if ( confirm('Do you want to submit this Request?'))
            {
                pro_fpma00050.Call();
            }   
        break;
        case 'Copy':
            if (txtAssetPK.text != '')
            {
                pro_fpma00050_1.Call();
            }
            else
            {
                alert('Pls choose one asset to copy info!');
            }
        break;
        default:
        break;
    }
    
}
//================================================================================
 function OnReport(pos)
 {
    if(pos == '1')
    {
        var url =System.RootURL + "/reports/fp/ma/rpt_fpma00050.aspx?txtMasterPK="+txt_ReqPK.text; 
        System.OpenTargetPage(url);
    }
    else if(pos == '2')
    {
        var url =System.RootURL + "/reports/fp/ma/rpt_fpma00050_1.aspx?txtMasterPK="+txt_ReqPK.text; 
        System.OpenTargetPage(url);
    }
 }
 
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpma00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00050" > 
                <input>
                    <input bind="txtAssetPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpma00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00050_1" > 
                <input>
                    <input bind="txt_ReqPK" /> 
                    <input bind="txtAssetPK" />
                </input> 
                <output>
                    <output bind="txtCopyRtnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00050"> 
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
    <gw:data id="data_fpma00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="<%=l_user%>lg_sel_fpma00050_1"  procedure="<%=l_user%>lg_upd_fpma00050_1"> 
                <inout> 
                    <inout bind="txt_ReqPK" />
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
    <gw:data id="data_fpma00050_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,5,7" function="<%=l_user%>lg_sel_fpma00050_2"  procedure="<%=l_user%>lg_upd_fpma00050_2" > 
                <input bind="grdTask" >
                    <input bind="txtProcessPK" />
                    <input bind="txt_ReqPK" />
                    <input bind="txtLoacationLoad" />                    
                </input>
                <output  bind="grdTask" />
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00050_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,6,7" function="<%=l_user%>lg_sel_fpma00050_3" procedure="<%=l_user%>lg_upd_fpma00050_3"> 
                <input bind="grdCons" >
                    <input bind="txtProcessPK" />
                    <input bind="txt_ReqPK" />
                    <input bind="txtLoacationLoad" />
                </input>
                <output  bind="grdCons" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%;">
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
                    <tr style="height: 94%">
                        <td colspan="3">
                            <gw:grid id='grdItem' header='Req No|_PK|Asset Code|Asset Name|UOM|_status|_MA_REQ_M_PK'
                                format='0|1|0|0|0|0|0' aligns='1|0|0|0|1|0|0' defaults='||||||' editcol='0|0|0|0|0|0|0'
                                widths='1000|1000|1200|2000|1000|1000|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick='OnGridCellClick(this)' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                         <td style="padding: 0 0 0 0; margin: 0 0 0 0; white-space: nowrap;" align="center">
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
            <td style="width: 70%; height: 100%" id="right">
                <table style="width: 100%; height: 100%;" cellpadding="0" cellspacing="0" border="0">
                    <tr style="width: 100%; height: 1%; padding: 0 0 0 0; margin: 0 0 0 0;">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 45%">
                                        &nbsp;
                                    </td>
                                    <td style="width: 50%; white-space: nowrap;" align="center">
                                        <gw:label id="lblStatus" styles="font-weight: bold; color:red; font-size: 12" text="" />
                                        <gw:label id="lblStatusCode" styles="font-weight: bold; color:red; font-size: 12;display:none;"></gw:label>
                                    </td>
                                    <td>
                                        <gw:imgbtn img="excel" alt="Report" id="btnReport1" onclick="OnReport('1')" />
                                    </td>
                                    <td>
                                        <gw:imgbtn img="excel" alt="Report Vendor" id="btnReport2" onclick="OnReport('2')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnAddProcess" img="new" alt="Add New Request" text="Add New Request"
                                            onclick="OnAddNew()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('MASTER')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('MASTER')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnCopy" img="2" text="Copy" styles='width:100%' onclick="OnProcess('Copy')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnSubmit" img="2" text="Submit" styles='width:100%' onclick="OnProcess('Submit')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 35%">
                        <td valign="top">
                             <table style="width: 100%; height: 1%" border="0">
                                <tr>
                                    <td style="width: 5%; height: 1%" align="right">
                                        Request No
                                    </td>
                                    <td style="width: 45%; height: 1%; white-space: nowrap;" colspan="2">
                                        <gw:textbox id="txtReqNo" onchange="" csstype="mandatory" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; height: 1%; white-space: nowrap" align="right">
                                        Req Date
                                    </td>
                                    <td style="width: 45%; height: 1%; white-space: nowrap"  colspan="2">
                                        <gw:datebox id="dtReqDate" lang="<%=Session("Lang")%>" onchange="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; height: 1%" align="right">
                                        <a title="Asset" onclick="OnPopUp('Asset')" href="#tips" style="color: #0000ff"><b>Asset</b></a>
                                    </td>
                                    <td style="width: 45%; height: 1%; white-space: nowrap;" colspan="2">
                                        <gw:textbox id="txtAssetPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtAssetCode" csstype="mandatory" styles='width:30%' />
                                        <gw:textbox id="txtAssetName" csstype="mandatory" styles='width:70%' />
                                    </td>
                                    <td style="width: 5%; height: 1%; white-space: nowrap;" align="right">
                                        <a title="ReqEmployee" onclick="OnPopUp('ReqEmployee')" href="#tips" style="color: #0000ff">
                                            <b>Req Employee</b></a>
                                    </td>
                                    <td style="width: 45%; height: 1%; white-space: nowrap;" colspan="2" >
                                        <gw:textbox id="txtReqEmployeePK" maxlen="100" styles='width:100%;display:none' onenterkey="" />
                                        <gw:textbox id="txtReqEmployeeCode" styles='width:30%' onenterkey="" />
                                        <gw:textbox id="txtReqEmployeeName" styles='width:70%' onenterkey="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; height: 1%" align="right">
                                        <a title="Process" onclick="OnPopUp('Process')" href="#tips" style="color: #0000ff">
                                            <b>Process</b></a>
                                    </td>
                                    <td style="width: 45%; height: 1%; white-space: nowrap" align="left" colspan="2">
                                        <gw:textbox id="txtProcessPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtProcessCode" csstype="mandatory" styles='width:30%' onenterkey="" />
                                        <gw:textbox id="txtProcessName" csstype="mandatory" styles='width:70%' onenterkey="" />
                                    </td>
                                    <td style="width: 5%; height: 1%; white-space: nowrap" align="right">
                                        Request Type
                                    </td>
                                    <td style="width: 45%; height: 1%; white-space: nowrap;" colspan="2">
                                        <gw:list id="lstReqType" styles="width:100%;" onchange="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; height: 97%" align="right">
                                        Description
                                    </td>
                                    <td style="width: 95%; height: 97%" colspan="5">
                                        <gw:textarea id="txtReqDescription" onchange='' styles="width:100%;height:55px;border:1px solid;border-color:#6B9EB8;background-color:#FFFFFF" />
                                    </td>
                                </tr>
                            </table>   
                                                                              
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 34%;">                                   
                            <td style=" width: 100%">                                          
                                 <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                    <tr style="height: 1%">
                                        <td style="width: 15% ; color:Gray">
                                            Task(s)
                                        </td>
                                        <td style="width: 29%" align="center">
                                            <gw:label img="new" id="lblRecordTask" styles="font-weight: bold; color:#CC0000;"
                                                text="0 record(s)" />
                                        </td>                                                        
                                        <td style="width: 1%">
                                            <gw:imgbtn id="btnDelete1" img="delete" alt="Delete" onclick="OnDelete('grdTask')" />
                                        </td>
                                        <td style="width: 1%">
                                            <gw:imgbtn id="btnUnDelete1" img="udelete" alt="Un Delete" onclick="OnUnDelete('grdTask')" />
                                        </td> 
                                        <td style="width: 5%"> </td>
                                         <td style="width: 15%; color:Gray">
                                            Tool(s)
                                        </td>
                                        <td style="width: 29%" align="center">
                                            <gw:label img="new" id="lblRecordCons" styles="font-weight: bold; color:#CC0000;"
                                                text="0 record(s)" />
                                        </td>                                                       
                                        <td style="width: 1%">
                                            <gw:imgbtn id="btnDelete2" alt="Delete" img="delete" onclick="OnDelete('grdCons')" />
                                        </td>
                                        <td style="width: 1%">
                                            <gw:imgbtn id="btnUnDelete2" alt="Un Delete" img="udelete" onclick="OnUnDelete('grdCons')" />
                                        </td>                                                        
                                    </tr>
                               <tr style="height: 99%">
                                        <td colspan="4">
                                            <gw:grid id='grdTask' header='_PK|_MA_REQ_M_PK|Seq|_MA_TASK_PK|Task Name|_MA_PROCESS_PK|_PROCESS_NAME|_MA_TASK_TYPE|Task Type'
                                                format='0|0|1|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0' check='||||||||' editcol='0|0|0|0|0|0|0|0|0'
                                                widths='1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
                                                defaults='||||||||' styles='width:100%; height:100%' />
                                        </td>
                                        <td  style="width: 5%"></td>
                                        <td colspan="4">
                                            <gw:grid id='grdCons' header='_PK|_MA_REQ_M_PK|Seq|_IITEM_PK|Item Code|Item Name|Qty|_MA_PROCESS_PK|Remark'
                                                format='0|0|1|0|0|0|1|0|0' aligns='0|0|1|0|0|0|3|0|0' check='|||||||' editcol='0|0|0|0|0|0|1|0|1'
                                                widths='1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
                                                defaults='0|1|2|3|4|5|6|7' styles='width:100%; height:100%' />
                                        </td>
                                    </tr>
                                </table>
                            </td>                                                                                    
                    </tr>
                     <tr style="width: 100%; height: 30%" >
                        <td >
                            <table style="width: 100%; height: 100%" border="0">
                                 <tr>
                                    <td style="width: 5%; height: 1%; color:Gray; white-space: nowrap" align="right">
                                        Response Info
                                    </td>
                                     <td colspan="5" style="white-space:nowrap">
                                        <hr style="color:gray" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; height: 1%; white-space: nowrap" align="right">
                                        Ma.Date
                                    </td>
                                    <td style="width: 20%; height: 1%;">
                                        <gw:datebox id="dtMaDate" lang="<%=Session("Lang")%>" onchange="" />
                                    </td>
                                    <td style="width: 10%; height: 1%; white-space: nowrap" align="right">
                                        <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color: #0000ff">
                                            <b>Charger</b></a>
                                    </td>
                                    <td style="width: 60%; height: 1%; white-space: nowrap" align="left">
                                        <gw:textbox id="txtChargerPK" maxlen="100" styles='width:100%;display:none' onenterkey="" />
                                        <gw:textbox id="txtChargerCode" styles='width:30%' onenterkey="" />
                                        <gw:textbox id="txtChargerName" styles='width:70%' onenterkey="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; height: 1%;" align="right">
                                        Amount
                                    </td>
                                    <td style="width: 20%; height: 1%;">
                                        <gw:textbox id="txtMaAmount" onchange="" csstype="mandatory" styles='width:100%' />
                                    </td>
                                    <td style="width: 10%; height: 1%; white-space: nowrap" align="right">
                                        <a title="Ma.Partner" onclick="OnPopUp('Ma_Partner')" href="#Ma_Partner" style="color: #0000ff">
                                            <b>Ma.Partner</b></a>
                                    </td>
                                    <td style="width: 60%; height: 1%; white-space: nowrap" align="left">
                                        <gw:textbox id="txtMa_PartnerPK" maxlen="100" styles='width:100%;display:none' onenterkey="" />
                                        <gw:textbox id="txtMa_PartnerCode" styles='width:30%' onenterkey="" />
                                        <gw:textbox id="txtMa_PartnerName" styles='width:70%' onenterkey="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; height: 98%;" align="right">
                                        Description
                                    </td>
                                    <td style="width: 95%; height: 98%;" colspan="5">
                                        <gw:textarea id="txtResDescription" onchange="" styles="width:100%;height:90%;border:1px solid;border-color:#6B9EB8;background-color:#e9e9e9" />
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
    <gw:textbox id="txtLoacationLoad" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_ReqPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtCopyRtnValue" maxlen="100" styles='width:100%;display:none' />
    <img status="expand" id="imgArrow" src="../../../system/images/left1.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!--------------------------------------------------------->
</body>
</html>
