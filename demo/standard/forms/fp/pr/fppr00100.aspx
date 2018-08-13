<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Product Incoming Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
             
var G1_CHK              = 0,           
    G1_STATUS           = 1,
    G1_PK               = 2,
    G1_SLIP_NO          = 3,
    G1_PROD_DATE        = 4,
    G1_NULL_01          = 5,
    G1_PO_NO            = 6,
    G1_WH_NAME          = 7,
    G1_LINE_NAME        = 8,   
    G1_FULL_NAME        = 9,
    G1_DESCRIPTION      = 10,
	G1_CRT_BY			= 11,
	G1_SUBMIT_BY		= 12,
	G1_APPROVE_BY		= 13,
	G1_CANCEL_BY		= 14;
    
var G2_STATUS           = 0, 
    G2_PK               = 1,
    G2_SLIP_NO          = 2,
    G2_PROD_DATE        = 3,
    G2_NULL_01          = 4,
    G2_PO_NO            = 5,
    G2_WH_NAME          = 6,
    G2_LINE_NAME        = 7,   
    G2_FULL_NAME        = 8, 
    G2_DESCRIPTION      = 9,
	G2_CRT_BY			= 10,
	G2_SUBMIT_BY		= 11,
	G2_APPROVE_BY		= 12,
	G2_CANCEL_BY		= 13;
//==================================================================
         
function BodyInit()
{       
    System.Translate(document); 
    //---------------------------------- 
    txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ; 
	txtUser_PK.text = "<%=session("USER_PK")%>";	
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtApproveFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtApproveFrom.value=ldate ; 
    
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;     
	
	var data;   
	//PRODUCT_YN = 'Y'
    data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0   order by wh_id ")%>||SELECT ALL";   
    cboWH_Approve.SetDataText(data);
	cboWH_Approve.value = '';
	cboWH_Cancel.SetDataText(data);
	cboWH_Cancel.value = '';
    //----------------------------------            
    FormatGrid();
	pro_fppr00100_lst.Call();
    //-----------------------------------
}
//==================================================================
  
function FormatGrid()
{
    var ctrl = grdConfirm.GetGridControl();       
    
    ctrl.Cell( 7, 0, G1_STATUS, 0, G1_STATUS) = 0x3300cc;
    //--------------------- 
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':
            data_fppr00100.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_fppr00100_1.Call('SELECT')
        break;
    }
}

//==================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
         case 'POConfirm':
            if ( grdConfirm.row > 0 )
            {
                var path = System.RootURL + '/standard/forms/fp/pr/fppr00101.aspx?income_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_PK);
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this);
                 
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
            }    
         break ;
         
         case 'POApprove':
            if ( grdApprove.row > 0 )
            {
                    var path = System.RootURL + '/standard/forms/fp/pr/fppr00102.aspx?income_pk=' + grdApprove.GetGridData( grdApprove.row, G2_PK);
                    var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this);
                     
                    if ( object != null )                    
                    {
                        OnSearch('grdConfirm');
                    }
	        }      	        
         break;                         
     }       
}
//==================================================================
function OnPrint()
{    
    txtDateFrom.text=dtFrom2.value;
    txtDateTo.text=dtTo2.value;
    
    var url =System.RootURL + "/standard/reports/fp/pr/rpt_fppr00100.aspx?dtFrom="+txtDateFrom.text+"&dtTo="+txtDateTo.text ;
	System.OpenTargetPage(url); 
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fppr00100':
            if ( grdConfirm.rows > 1 )
            {
                grdConfirm.SetCellBold( 1, G1_WH_NAME, grdConfirm.rows - 1, G1_WH_NAME, true);
            }
            lbConfirmRecord.text = grdConfirm.rows-1 + " record(s)";
            OnSearch('grdApprove');
        break;    
        
        case 'data_fppr00100_1':                    
            if ( grdApprove.rows > 1 )
            {
                grdApprove.SetCellBold( 1, G2_WH_NAME, grdApprove.rows - 1, G2_WH_NAME, true);
            }  
            lbApproveRecord.text = grdApprove.rows-1 + " record(s)";      
        break;  
                 
        case 'pro_fppr00100' :
            alert(txtReturnValue.text);
            data_fppr00100.Call('SELECT')   
        break;
        
        case'pro_fppr00100_1':
            alert(txtReturnValue.text);
            data_fppr00100.Call('SELECT');
        break;
		case 'pro_fppr00100_lst':
            cboWH_Cancel.SetDataText(txtWHStr.text);
            cboWH_Approve.SetDataText(txtWHStr.text);
     			 
        break; 
    }
}
 
//==================================================================

function OnProcess(pos)
{
    switch (pos)
    {        
        case'Approve':
            var income_pk = "";
            var t_link = "";
            
            for( var i=1; i<grdConfirm.rows; i++)
            {
                var a = grdConfirm.GetGridData(i,0);
                var b = grdConfirm.GetGridData(i,2);
                
                if (a == "-1" )
                {
                   income_pk = income_pk + t_link + b ;
                   t_link = ",";
                }
            }
            
            txtInComePK.text = income_pk;
            
            if(txtInComePK.text=="")
            {
                alert('You must select one slip to approve.');
            }
            else
            {
                 if ( confirm ('Do you want to Approve ?') )
                 {
                        pro_fppr00100.Call();
                 }       
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel Slip : ' + grdApprove.GetGridData( grdApprove.row, G2_SLIP_NO) ))
                {
                    txtInComePK.text = grdApprove.GetGridData( grdApprove.row, G2_PK);
                    
                    pro_fppr00100_1.Call();
                }    
            }
            else
            {
                alert('Pls select one slip to cancel.');
            }     
        break;       
    }    
}

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
        imgArrow.src = "../../../../system/images/down.gif";
    }
    else
    {
        tab_top.style.display="";
        imgArrow.status = "expand";
        tab_bottom.style.height="50%";
        imgArrow.src = "../../../../system/images/up.gif";
    }
 }    

//==================================================================         
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fppr00100" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_SEL_fppr00100"  >
                <input bind="grdConfirm" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />
			        <input bind="cboWH_Approve" />
			        <input bind="txtConfirmNo" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />					
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fppr00100_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="st_lg_SEL_fppr00100_1"  >
                <input bind="grdApprove" >
                    <input bind="dtApproveFrom" />
                    <input bind="dtApproveTo" />                
			        <input bind="cboWH_Cancel" />
			        <input bind="txtApproveNo" />					
					<input bind="txtEmpPK" />
					<input bind="chkUser2" />					
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!----------------------------------------------------------------->
    <gw:data id="pro_fppr00100" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_fppr00100" > 
                <input>
                    <input bind="txtInComePK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00100_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_fppr00100_1" > 
                <input>
                    <input bind="txtInComePK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="pro_fppr00100_lst" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_fppr00100_3" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtConfirmFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtConfirmTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td>
                            W/H
                        </td>
                        <td style="width: 40%">
                            <gw:list id="cboWH_Approve" styles="width:100%;" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtConfirmNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="N">User</gw:checkbox>
                        </td>
                        <td style="width: 37%; text-align: center; white-space: nowrap">
                            <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnApprove" img="approve" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnViewDetail" img="popup" text="Detail" onclick="OnPopUp('POConfirm')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdConfirm' header='Chk|Status|_pk|Slip No|Prod Date|_null|Ref No|W/H Name|Line Name|Charger|Remark|Create|Submit|Approve|Cancel'
                                format='3|0|0|0|4|0|0|0|0|0|0|0|0|0|0' aligns='0|1|0|0|1|0|0|0|0|0|0|0|0|0|0' check='||||||||||||||'
                                editcol='0|1|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='500|1200|0|1200|1200|0|1200|2000|2000|2000|1000|2000|2000|2000|2000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%" id="tab_bottom">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%">
                            <img id="imgArrow" status="expand" id="imgUp" src="../../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtApproveFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtApproveTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td>
                            W/H
                        </td>
                        <td style="width: 40%">
                            <gw:list id="cboWH_Cancel" styles="width:100%;" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtApproveNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:checkbox id="chkUser2" styles="color:blue" defaultvalue="Y|N" value="N">User</gw:checkbox>
                        </td>
                        <td style="width: 21%; white-space: nowrap" align="center">
                            <gw:label id="lbApproveRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Print Report" id="btnPrint" onclick="OnPrint()" styles="display:none" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnViewDetail1" img="popup" text="Detail" onclick="OnPopUp('POApprove')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="13">
                            <gw:grid id='grdApprove' header='Status|_pk|Slip No|Prod Date|_tsa_saleorder_pk|Ref No|W/H Name|Line Name|Charger|Remark|Create|Submit|Approve|Cancel'
                                format='0|0|0|4|0|0|0|0|0|0|0|0|0|0' 								        
								aligns='1|0|0|1|0|0|0|0|0|0|0|0|0|0' 
								check='||||||||||||||' 
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='1200|0|1200|1200|0|1200|2000|2000|2000|1000|2000|2000|2000|2000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
	<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
	<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
    <!----------------------------------------------------------->
    <gw:textbox id="txtInComePK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
