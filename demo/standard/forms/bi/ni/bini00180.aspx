<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Stock Outgoing Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_Chk          = 0,           
    G1_OUTGO_PK     = 1,
    G1_Status       = 2,
    G1_Out_Date     = 3,
    G1_Slip_No      = 4,
    G1_Ref_No       = 5,
    G1_WH_Name      = 6,
    G1_PL           = 7,
    G1_Charger      = 8,   
    G1_Remark       = 9;
    G1_Approve      = 10,
    G1_Cancel       = 11;
        
var G2_OUTGO_PK     = 0,
    G2_Status       = 1,
    G2_Out_Date     = 2,
    G2_Slip_No      = 3,
    G2_Ref_No       = 4,
    G2_WH_Name      = 5,
    G2_PL           = 6,
    G2_Charger      = 7,   
    G2_Remark       = 8,
    G2_Approve      = 9,
    G2_Cancel       = 10;
//==================================================================
         
function BodyInit()
{          
    System.Translate(document); 
	
	txtUser_PK.text = "<%=session("USER_PK")%>";
    txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ; 
	
    //-----------------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtApproveFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtApproveFrom.value=ldate ; 
    
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;  

    //-----------------------------------
        
    FormatGrid();
    //-----------------------------------
	pro_bini00180_lst.Call();
}
//==================================================================
  
function FormatGrid()
{
    var ctrl = grdConfirm.GetGridControl();       
    
    ctrl.Cell( 7, 0, G1_Status, 0, G1_Status) = 0x3300cc;

}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':
            data_bini00180.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_bini00180_1.Call('SELECT')
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
                var path = System.RootURL + '/standard/forms/bi/ni/bini00181.aspx?type=APPROVE&OUTGO_PK=' + grdConfirm.GetGridData( grdConfirm.row, G1_OUTGO_PK);
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
                    var path = System.RootURL + '/standard/forms/bi/ni/bini00181.aspx?type=CANCEL&OUTGO_PK=' + grdApprove.GetGridData( grdApprove.row, G2_OUTGO_PK);
                    var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this);
                     
                    if ( object != null )                    
                    {
                        OnSearch('grdApprove');
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
    
    var url =System.RootURL + "/standard/reports/fp/ip/rpt_bini00180.aspx?dtFrom="+txtDateFrom.text+"&dtTo="+txtDateTo.text ;
	System.OpenTargetPage(url); 
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bini00180':
            if ( grdConfirm.rows > 1 )
            {
                lbConfirmRecord.text = grdConfirm.rows-1 + " record(s)";
                
                grdConfirm.SetCellBold( 1, G1_WH_Name, grdConfirm.rows - 1, G1_WH_Name, true);
            }
            OnSearch('grdApprove');
        break;    
        
        case 'data_bini00180_1':                    
            if ( grdApprove.rows > 1 )
            {
                lbApproveRecord.text = grdApprove.rows-1 + " record(s)";
                
                grdApprove.SetCellBold( 1, G2_WH_Name, grdApprove.rows - 1, G2_WH_Name, true);
            }          
        break;  
                 
        case 'pro_bini00180_3' :
            alert(txtReturnValue.text);
            data_bini00180.Call('SELECT')   
        break;
        
        case'pro_bini00180_4':
            alert(txtReturnValue.text);
            data_bini00180_1.Call('SELECT');
        break;
		
		case 'pro_bini00180_lst':
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
            var OUTGO_PK = "";
            var t_link = "";
            
            for( var i=1; i<grdConfirm.rows; i++)
            {
                var a = grdConfirm.GetGridData(i,G1_Chk);
                var b = grdConfirm.GetGridData(i,G1_OUTGO_PK);
                
                if (a == "-1" )
                {
                   OUTGO_PK = OUTGO_PK + t_link + b ;
                   t_link = ",";
                }
            }
            
            txtOutGoPK.text = OUTGO_PK;
            
            if(txtOutGoPK.text=="")
            {
                alert('You must select one slip to approve.');
            }
            else
            {
                 if ( confirm ('Do you want to Approve ?') )
                 {
                        pro_bini00180_3.Call();
                 }       
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel Slip : ' + grdApprove.GetGridData( grdApprove.row, G2_Slip_No) ))
                {
                    txtOutGoPK.text = grdApprove.GetGridData( grdApprove.row, G2_OUTGO_PK);
                    
                    pro_bini00180_4.Call();
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

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
	<!---------------------------------------------------------------->
    <gw:data id="pro_bini00180_lst" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bini00180_3" > 
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
    <gw:data id="data_bini00180" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_SEL_bini00180"  >
                <input bind="grdConfirm" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />
			        <input bind="txtConfirmNo" />
					<input bind="cboWH_Approve" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />					
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bini00180_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="st_lg_SEL_bini00180_1"  >
                <input bind="grdApprove" >
                    <input bind="dtApproveFrom" />
                    <input bind="dtApproveTo" />                
			        <input bind="txtApproveNo" />
					<input bind="cboWH_Cancel" />
					<input bind="txtEmpPK" />
					<input bind="chkUser2" />					
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_bini00180_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bini00180_3" > 
                <input>
                    <input bind="txtOutGoPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bini00180_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bini00180_4" > 
                <input>
                    <input bind="txtOutGoPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table id="main" style="width: 100%; height: 100%" class="eco_line" cellpadding="0" cellspacing="0">
        <tr style="height: 50%" id="tab_top">
            <td class="eco_line_b">
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr class="eco_bg">
						<td style="width: 10%; white-space: nowrap" align="right">
							From Date
						</td>
						<td style="width: 10%; white-space: nowrap" align="left">
							<gw:datebox id="dtConfirmFrom" lang="<%=Application("Lang")%>" mode="01" />
						</td>
						<td style="width: 10%; white-space: nowrap" align="right">
							To Date
						</td>
						<td style="width: 10%; white-space: nowrap" align="left">
							<gw:datebox id="dtConfirmTo" lang="<%=Application("Lang")%>" mode="01" />
						</td>
						<td style="width: 10%; white-space: nowrap" align="right">
							Slip No
						</td>
						<td style="width: 15%; white-space: nowrap" align="left">
							<gw:textbox id="txtConfirmNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
						</td>
						<td  align="left">
							<gw:button img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
						</td>
						<td  align="left">
							<gw:button id="btnApprove" img="select" text="Approve" onclick="OnProcess('Approve')" />
						</td>
						<td  align="left">
							<gw:button id="btnViewDetail" img="popup" text="Detail" onclick="OnPopUp('POConfirm')" />
						</td>
                    </tr>
					<tr class="eco_bg">
						<td style="width: 10%; white-space: nowrap" align="right">
							Warehouse
						</td>
						<td colspan=3 style="width: 40%; white-space: nowrap" align="left">
							<gw:list id="cboWH_Approve" styles="width:100%;" />
						</td>
						
						<td style="width: 15%; white-space: nowrap" align="left">
						   
						</td>
						<td  align="left">
							
						</td>
						<td  align="left">
							
						</td>
						<td  align="left">
							
						</td>
						<td  align="left">
							<gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
						</td>
					</tr>
                    <tr style="height: 80%">
                        <td colspan="9" class="eco_line_t">
                            <gw:grid id='grdConfirm' header='Chk|_PK|Status|Out Date|Slip No|Ref No|W/H|P/L|Charger|Remark|Approve|Cancel'
                                format='3|0|0|4|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0' check='|||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1'
                                widths='800|0|1200|1200|1500|1500|3000|3000|2000|1300|2200|1000' sorting='T' 
                                styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%" id="tab_bottom">
            <td>
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr class="eco_bg">
						<td style="width: 10%; white-space: nowrap" align="right">
							From Date
						</td>
						<td style="width: 10%; white-space: nowrap" align="left">
							<gw:datebox id="dtApproveFrom" lang="<%=Application("Lang")%>" mode="01" />
						</td>
						<td style="width: 10%; white-space: nowrap" align="right">
							To Date
						</td>
						<td style="width: 10%; white-space: nowrap" align="left">
							<gw:datebox id="dtApproveTo" lang="<%=Application("Lang")%>" mode="01" />
						</td>
						<td style="width: 10%; white-space: nowrap" align="right">
							Slip No
						</td>
						<td style="width: 15%; white-space: nowrap" align="left">
							<gw:textbox id="txtApproveNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
						</td>
						<td  align="left">
							<gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
						</td>
						<td  align="left">
							<gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
						</td>
						<td  align="left">
							<gw:button id="btnViewDetail1" img="popup" text="Detail" onclick="OnPopUp('POApprove')" />
						</td>
                    </tr>
					<tr class="eco_bg">
						<td style="width: 10%; white-space: nowrap" align="right">
							Warehouse
						</td>
						<td colspan=3 style="width: 40%; white-space: nowrap" align="left">
							<gw:list id="cboWH_Cancel" styles="width:100%;" />
						</td>
						
						<td style="width: 15%; white-space: nowrap" align="left">
						   
						</td>
						<td  align="left">
							
						</td>
						<td  align="left">
							
						</td>
						<td  align="left">
							<gw:label id="lbApproveRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
						</td>
						<td  align="left">
							<gw:button img="excel" alt="Print Report" styles='width:100%;display:none' id="btnPrint" onclick="OnPrint()" />
						</td>
					</tr>
                    <tr style="height: 80%">
                        <td colspan="9" class="eco_line_t">
                            <gw:grid id='grdApprove' header='_PK|Status|Out Date|Slip No|Ref No|W/H|P/L|Charger|Remark|Approve|Cancel'
                                format='0|0|4|0|0|0|0|0|0|0|0' aligns='0|1|1|0|0|0|0|0|0|0|0' check='||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0'
                                widths='0|1200|1200|1500|1500|3000|3000|2000|1200|2200|1200' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />	
    <!----------------------------------------------------------->
	<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
	<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
    <!----------------------------------------------------------->	
    <gw:textbox id="txtOutGoPK" styles='width:100%;display:none' />
	
	<gw:checkbox id="chkUser" styles="color:blue;display:none" defaultvalue="Y|N" value="N"></gw:checkbox>
	<gw:checkbox id="chkUser2" styles="color:blue;display:none" defaultvalue="Y|N" value="N"></gw:checkbox>
    <!----------------------------------------------------------->
</body>
</html>
