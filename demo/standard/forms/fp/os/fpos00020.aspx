<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>OS Payment Request</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G_PP_ORDPLAN_PK         = 0,
    G_TCO_BUSPARTNER_PK     = 1,
    G_PARTNER_ID            = 2,
    G_PARTNER_NM            = 3,
    G_PROD_DATE             = 4,
    G_REF_PO_NO             = 5,
    G_ITEM_CD               = 6,
    G_ITEM_NM               = 7,
    G_PT_COMPONENT_PK       = 8,
    G_COMPONENT_ID          = 9,
    G_COMPONENT_NM          = 10,
    G_PEOD_QTY              = 11,
    G_DEFECT_QTY            = 12,
    G_PAY_QTY               = 13,
    G_BAL_QTY               = 14,
    G_UNIT_PRICE            = 15,
    G_BAL_AMOUNT            = 16,
    G_CHK                   = 17,
    G_MASTER_PK             = 18;
    
var G2_Pc_payment_PK      = 0,
    G2_Status             = 1,
    G2_Pay_type           = 2,
    G2_Req_dt             = 3,
    G2_Slip_no            = 4,
    G2_Item_amt           = 5,
    G2_Vat_amt            = 6,
    G2_Total_amt          = 7,
    G2_CCY                = 8,
    G2_Ex_rate            = 9,
    G2_Bill_to            = 10,
    G2_Req_Emp            = 11,
    G2_Desc               = 12;
  //==================================================================
         
function BodyInit()
{         
    System.Translate(document); 
    txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
    txtChargerId.text = "<%=Session("EMP_ID")%>"  ;
    txtChargerNm.text = "<%=Session("USER_NAME")%>"  ;   
    
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));  
    dtFrom2.SetDataText(System.AddDate(dtTo2.GetData(),-30));
    
    
    var data = "<%=ESysLib.SetListDataFUNC("SELECT lg_F_LOGISTIC_CODE('LGPC0502') FROM DUAL" )%>"; 
    lstOsType.SetDataText(data);
    
    
    FormatGrid();
    //-----------------------------------
    if ( chkClose.value == "Y" ) 
    {
        btnClose.style.display   = "none" ;
        btnUnClose.style.display = "" ;
    }
    else
    {
        btnClose.style.display   = "" ;
        btnUnClose.style.display = "none" ;
    }
    OnSearch('grdPO')    
}
//==================================================================
  
function FormatGrid()
{
//    var data="";    
//  	
//    var ctrl = grdPO.GetGridControl();   
//     
//    ctrl.ColFormat(grdPO_Total_Amt) = "###,###,###.##" ;
//    //---------------------
//    ctrl = grdPayReq.GetGridControl();  
//    
//    ctrl.ColFormat(G2_Item_amt)= "###,###,###,###.##";
//    ctrl.ColFormat(G2_Vat_amt) = "###,###,###,###.##";
//    ctrl.ColFormat(G2_Total_amt)= "###,###,###,###.##";    
    
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case'grdMaster':
            data_fpos00020.Call("SELECT");
        break;
        case'grdDetail':
            data_fpos00020_2.Call("SELECT");
        break;
    }
}

//==================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case'partner':
            var fpath = System.RootURL + "/form/fp/ab/fpab00120.aspx";
            var object = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes'); 
            if (object != null)
            {                  
                txtPartner.text=object[2];
            }
        break;
        case'style':
            var fpath = System.RootURL + "/form/fp/ab/fpab00080.aspx?group_type=Y|Y|Y|Y|Y|Y";
            var object = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes'); 
            if (object != null)
            {                  
                txtStyle.text = object[2];
            }
        break;
        case'ostype':
            var fpath = System.RootURL + "/form/fp/ab/fpab00220.aspx?code_group=LGPC0502";
            var object = System.OpenModal( fpath , 750 , 500 , 'resizable:yes;status:yes'); 
            var data = "<%=ESysLib.SetListDataFUNC("SELECT COMM.F_LOGISTIC_CODE('LGPC0502') FROM DUAL" )%>"; 
            lstOsType.SetDataText(data);
        break;
        case'MakeReq':
            var flag = false;
            for(i=1;i<grdMaster.rows;i++ )
            {
                if(grdMaster.GetGridData(i,G_CHK)=='-1')
                {   
                    flag = true;
                }
            }
            if(flag == true)
            {
                if(CheckPartner())
                {
                    var fpath = System.RootURL + "/form/fp/os/fpos00021.aspx";
                    var object = System.OpenModal( fpath , 900 , 600 , 'resizable:yes;status:yes',this);  
                    OnSearch("grdMaster");
                } 
            }
            else
            {
                alert("Please check item to create !!!");
            }  
        break;
        case 'Modify':
            if(grdDetail.row>0)
            {
                var master_pk = grdDetail.GetGridData(grdDetail.row,0);
                var fpath = System.RootURL + "/form/fp/os/fpos00022.aspx?MasterPK="+master_pk;
                var object = System.OpenModal( fpath , 900 , 600 , 'resizable:yes;status:yes',this);
            }
            else
            {
                alert("Please Select P/R!!!");
            }
        break; 
    }
}
//==================================================================
function OnPrint()
{    
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fpos00020' :
            data_fpos00020_2.Call("SELECT");
        break;
        case 'data_fpos00020_1':
            for(var i=1;i<grdMaster.rows;i++)
            {
                if(grdMaster.GetGridData(i,G_CHK)=="-1")
                {
                    grdMaster.SetGridText(i,G_MASTER_PK,txtReturnValue.text);
                    grdMaster.SetRowStatus(i,32);
                }
            }
            
            data_fpos00020.Call();
        break;
    }
}
//==================================================================
function OnProcess(obj)
{
    switch(obj)
    {
        case'MakeReq':
            if(CheckPartner())
            {
                
                CreateMaster();
            }
        break;
    }
}
//==================================================================
function CheckPartner()
{
    var partner_pk="";
    for (i = 1;i<grdMaster.rows;i++)
    {
        if(grdMaster.GetGridData(i,G_CHK)=='-1')
        {
            if(partner_pk!=""&&partner_pk!=grdMaster.GetGridData(i,G_TCO_BUSPARTNER_PK))
            {
                alert("Can not select more than one Partner, Please check again!!!");
                return false ;
            }
            partner_pk = grdMaster.GetGridData(i,G_TCO_BUSPARTNER_PK);
        }
    }
    return true;
} 
//==================================================================
function CreateMaster()
{
    var flag = false;
    var partner_pk ="";
    for(i=1;i<grdMaster.rows;i++ )
    {
        if(grdMaster.GetGridData(i,G_CHK)=='-1')
        {   
            flag = true;
            partner_pk = grdMaster.GetGridData(i,G_TCO_BUSPARTNER_PK);
        }
    }
    if(flag == true)
    {
        txtPartnerPK.text = partner_pk;
        data_fpos00020_1.Call();
    }
    else
    {
        alert("Please check item to create !!!");
    }
}
//==================================================================

function OnChangeClose()
{
    if ( chkClose.value == "Y" ) 
    {
        btnClose.style.display   = "none" ;
        btnUnClose.style.display = "" ;
    }
    else
    {
        btnClose.style.display   = "" ;
        btnUnClose.style.display = "none" ;
    }
    
    OnSearch('grdPayReq') ;
}

//==================================================================
function OnRowClick(pos)
{
    switch(pos)
    {
        case'Master':
           var total =0 ;
           for(i=1;i<grdMaster.rows;i++)
           {
                if(grdMaster.GetGridData(i,G_CHK)=="-1")
                {
                    total = Number(total) + Number(grdMaster.GetGridData(i,G_BAL_AMOUNT));
                }
           }
           txtTotalAmt.text=total;
        break;
        case'Detail':
            var row = event.row;
            var col = event.col;
            txtTotalAmt.text = grdDetail.GetGridData(row,5);
        break;
   }
}
//=========================================================

//==================================================================
 function OnToggle()
 {
    var tab_top  = document.all("tab_top");    
    var tab_bottom = document.all("tab_bottom");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        tab_top.style.display="none";       
        imgArrow.status = "collapse";
        tab_bottom.style.width="100%";
        imgArrow.src = "../../../system/images/down.gif";
    }
    else
    {
        tab_top.style.display="";
        imgArrow.status = "expand";
        tab_bottom.style.height="50%";
        imgArrow.src = "../../../system/images/up.gif";
    }
 }    
//==================================================================
   
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpos00020" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpos00020" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18"  procedure="<%=l_user%>lg_upd_fpos00020" >
                <input bind="grdMaster" >
			        <input bind="dtFrom" />
			        <input bind="dtTo" />
			        <input bind="txtPartner" />
			        <input bind="txtStyle" />
			        <input bind="chkBal" />
			        <input bind="lstOsType" />
                </input>
                <output bind="grdMaster" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpos00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpos00020_1" > 
                <input>
                    <input bind="txtPartnerPK" /> 
                    <input bind="txtTotalAmt" /> 
                    <input bind="txtChargerPK" /> 
                    <input bind="txtChargerPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpos00020_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="<%=l_user%>lg_sel_fpos00020_2"  >
                <input bind="grdDetail" >
				   <input bind="dtFrom2" />
			        <input bind="dtTo2" />
			        <input bind="txtPOStyle2" />
			        <input bind="chkClose" />
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <%--<gw:data id="pro_dsap00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_dsap00010_2" > 
                <input>
                    <input bind="txtReqPayPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_dsap00010_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_dsap00010" > 
                <input>
                    <input bind="txtArrayPOPK" />
                    <input bind="txtSOPO" />
                    <input bind="txtChargerPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>--%>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Incoming Date
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 1%" align="right">
                            <a title="Partner" onclick="OnPopUp('partner')" href="#tips" style="color: #0000ff">
                                Partner</a>
                        </td>
                        <td style="width: 17%">
                            <gw:textbox id="txtPartner" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdPO')" />
                        </td>
                        <td style="width: 1%; white-space: nowrap" align="right">
                            <a title="Style" onclick="OnPopUp('style')" href="#tips" style="color: #0000ff">Style</a>
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtStyle" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdPO')" />
                        </td>
                        <td style="width: 1%; white-space: nowrap" align="right">
                            <a title="OS Type" onclick="OnPopUp('ostype')" href="#tips" style="color: #0000ff">OS
                                Type</a>
                        </td>
                        <td style="width: 16%">
                            <gw:list id="lstOsType" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdPO')" />
                        </td>
                        <td style="width: 1%; text-align: center; white-space: nowrap">
                            Balance YN
                        </td>
                        <td style="width: 10%; text-align: center">
                            <gw:checkbox id="chkBal" maxlen="100" styles='width:100%' defaultvalue="Y|N" value="Y" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnMakeOrdPlanAuto" img="2" text="Auto Plan" onclick="OnProcess('MakeReq')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnMakeOrdADV" img="2" text="Manual Plan" onclick="OnPopUp('MakeReq')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="13">
                            <gw:grid id='grdMaster' header='_PP_ORDPLAN_PK|_TCO_BUSPARTNER_PK|_PARTNER_ID|Partner|Pro Date|Ref PO No|_ITEM_CODE|Item|_PT_COMPONENT_PK|_COMPONENT_ID|Component|Prod Qty|Defect Qty|Pay Qty|Bal Qty|Unit Price|Bal Amount|Chk|_pc_payment_req_m'
                                format='0|0|0|0|4|0|0|0|0|0|0|-0|-0|-0|-0|1|1|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                check='||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                sorting='T' autosize='T' styles='width:100%; height:100%' oncellclick="OnRowClick('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%" id="tab_bottom">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%" align="left">
                            <img id="imgArrow" status="expand" id="imgUp" src="../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Req Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom2" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo2" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Slip/Ref No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtPOStyle2" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdPayReq')" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Total Amt
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtTotalAmt" maxlen="100" styles='width:100%' readonly="true" type="number"
                                format="###,###.##" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
                            Close
                            <gw:checkbox id="chkClose" defaultvalue="Y|N" value="N" onchange="OnChangeClose()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Print Report" id="btnPrint" onclick="OnPrint()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                        </td>
                        <td>
                            <%--<gw:label id="lbRecord1" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>--%>
                        </td>
                        <td>
                            <gw:icon id="btnClose" img="2" text="Close" onclick="OnProcess('Close')" />
                            <gw:icon id="btnUnClose" img="2" text="UnClose" onclick="OnProcess('UnClose')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnModifyOrdPlan" img="2" text="Modify" onclick="OnPopUp('Modify')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="14">
                            <gw:grid id='grdDetail' header='_PK|Partner|Req Date|Pay Method|Item Amount|Total Amount|Slip No|Ref No|Payment Desc|Partner Desc'
                                format='0|0|4|0|1|1|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0' check='|||||||||' editcol='1|1|1|1|1|1|1|1|1|1'
                                widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
                                styles='width:100%; height:100%' oncellclick="OnRowClick('Detail')"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtDateFrom" styles='width:100%;display:none' />
    <gw:textbox id="txtDateTo" styles='width:100%;display:none' />
    <gw:textbox id="txtReqPayPK" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtPartnerPK" styles='width:100%;display:none' />
    <gw:textbox id="txtArrayOrdPlanPK" styles='width:100%;display:none' />
    <gw:textbox id="txtSOPO" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtChargerPK" styles="display:none" />
    <gw:textbox id="txtChargerNm" styles="display:none" />
    <gw:textbox id="txtChargerId" styles="display:none" />
    
</body>
</html>
