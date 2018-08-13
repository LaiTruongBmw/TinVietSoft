<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>Stock Exchange Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_Chk      = 0,           
    G1_TRANS_PK = 1,
    G1_Status   = 2,
    G1_Ex_Date  = 3,
    G1_Slip_No  = 4,
    G1_Ref_No   = 5,
    G1_Ex_WH   = 6,
    G1_Null_01  = 7,
    G1_Out_PL   = 8,
    G1_Null_02  = 9,
    G1_Charger  = 10,   
    G1_Remark   = 11,
    G1_Approve  = 12,    
    G1_Cancel   = 13;
    
var G2_TRANS_PK = 0,
    G2_Status   = 1,
    G2_Ex_Date  = 2,
    G2_Slip_No  = 3,
    G2_Ref_No   = 4,
    G2_Ex_WH   = 5,
    G2_Null_01  = 6,
    G2_Out_PL   = 7,
    G2_Null_02  = 8,
    G2_Charger  = 9,   
    G2_Remark   = 10,
    G2_Approve  = 11,
    G2_Cancel   = 12;
//==================================================================
         
function BodyInit()
{       
    System.Translate(document); 
    txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
    //---------------------------------- 

    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtApproveFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtApproveFrom.value=ldate ; 
    
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;      
    //---------------------------------- 
           
    FormatGrid();
    //-----------------------------------
}
//==================================================================
  
function FormatGrid()
{
    var ctrl = grdConfirm.GetGridControl();       
    
    ctrl.Cell( 7, 0, G1_Status, 0, G1_Status) = 0x3300cc;
    //--------------------- 
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':
            data_bias00070.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_bias00070_1.Call('SELECT')
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
                var path = System.RootURL + '/standard/forms/bi/as/bias00071.aspx?type=APPROVE&trans_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_TRANS_PK);
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
                    var path = System.RootURL + '/standard/forms/bi/as/bias00071.aspx?type=CANCEL&trans_pk=' + grdApprove.GetGridData( grdApprove.row, G2_TRANS_PK);
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
    var url =System.RootURL + "/reports/bi/as/rpt_bias00070.aspx?p_from_date="+dtApproveFrom.value+"&p_to_date="+dtApproveTo.value ;
	System.OpenTargetPage(url); 
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bias00070':
            if ( grdConfirm.rows > 1 )
            {
                lbConfirmRecord.text = grdConfirm.rows-1 + " record(s)";
                
                grdConfirm.SetCellBold( 1, G1_Ex_WH, grdConfirm.rows - 1, G1_Ex_WH, true);
            }
            OnSearch('grdApprove');
        break;    
        
        case 'data_bias00070_1':                    
            if ( grdApprove.rows > 1 )
            {
                lbApproveRecord.text = grdApprove.rows-1 + " record(s)";
                
                grdApprove.SetCellBold( 1, G2_Ex_WH, grdApprove.rows - 1, G2_Ex_WH, true);
            }          
        break;  
                 
        case 'pro_bias00070_3' :
            alert(txtReturnValue.text);
            data_bias00070.Call('SELECT')   
        break;
        
        case'pro_bias00070_4':
            alert(txtReturnValue.text);
            data_bias00070_1.Call('SELECT');
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
                var b = grdConfirm.GetGridData(i,1);
                
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
                        pro_bias00070_3.Call();
                 }       
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel Slip : ' + grdApprove.GetGridData( grdApprove.row, G2_Slip_No) ))
                {
                    txtInComePK.text = grdApprove.GetGridData( grdApprove.row, G2_TRANS_PK);
                    
                    pro_bias00070_4.Call();
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
    <gw:data id="data_bias00070" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_SEL_bias00070"  >
                <input bind="grdConfirm" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />
			        <input bind="txtConfirmNo" />
			        <input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bias00070_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="st_lg_SEL_bias00070_1"  >
                <input bind="grdApprove" >
                    <input bind="dtApproveFrom" />
                    <input bind="dtApproveTo" />                
			        <input bind="txtApproveNo" />
			        <input bind="txtEmpPK" />
					<input bind="chkUser2" />
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_bias00070_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00070_3" > 
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
    <gw:data id="pro_bias00070_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00070_4" > 
                <input>
                    <input bind="txtInComePK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
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
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtConfirmNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y">User</gw:checkbox>
                        </td>
                        <td style="width: 37%; text-align: center">
                            <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnViewDetail" img="View Detail" text="View Detail" onclick="OnPopUp('POConfirm')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdConfirm' header='Chk|_PK|Status|Ex Date|Slip No|Ref No|Ex W/H|_NULL 01|Ex P/L|_NULL 02|Charger|Remark|Approve|Cancel'
                                format='3|0|0|4|0|0|0|0|0|0|0|0|0|0' aligns='1|0|1|1|0|0|0|0|0|0|0|0|0|0' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='0|0|1200|1200|1500|1500|3000|3000|3000|3000|2000|1200|2200|1500' sorting='T' styles='width:100%; height:100%' />
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
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtApproveNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:checkbox id="chkUser2" styles="color:blue" defaultvalue="Y|N" value="Y">User</gw:checkbox>
                        </td>
                        <td style="width: 21%; white-space: nowrap" align="center">
                            <gw:label id="lbApproveRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" styles='display:none' alt="Print Report" id="btnPrint" onclick="OnPrint()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnViewDetail1" img="View Detail" text="View Detail" onclick="OnPopUp('POApprove')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="12">
                            <gw:grid id='grdApprove' header='_PK|Status|Ex Date|Slip No|Ref No|Ex W/H|_Null 01|Ex P/L|_Null 02|Charger|Remark|Approve|Cancel'
                                format='0|0|4|0|0|0|0|0|0|0|0|0|0' aligns='0|1|1|0|0|0|0|0|0|0|0|0|0' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='0|1200|1200|1500|1500|3000|3000|3000|3000|2000|1200|2200|1500' sorting='T' styles='width:100%; height:100%' />
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
    <gw:textbox id="txtInComePK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
