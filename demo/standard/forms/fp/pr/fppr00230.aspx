<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>WH Stock confirm Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_Chk          = 0,           
    G1_CLOSE_PK    = 1,
    G1_Status       = 2,
    G1_In_Date      = 3,   
    G1_WH_Name      = 4,     
    G1_Remark       = 5;
    
var G2_CLOSE_PK    = 0,
    G2_Status       = 1,
    G2_In_Date      = 2,       
    G2_WH_Name      = 3,     
    G2_Remark       = 4;
//==================================================================
         
function BodyInit()
{       
    System.Translate(document); 
    //---------------------------------- 
    txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;   
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtApproveFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtApproveFrom.value=ldate ; 
    
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;     
	
	var data;   
	
    data = "<%=ESysLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id ")%>||SELECT ALL";   
    cboWH_Approve.SetDataText(data);
	cboWH_Approve.value = '';
	cboWH_Cancel.SetDataText(data);
	cboWH_Cancel.value = '';
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
            data_fppr00230.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_fppr00230_1.Call('SELECT')
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
                var path = System.RootURL + '/form/bi/ni/bini00131.aspx?income_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_CLOSE_PK);
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
                    var path = System.RootURL + '/form/bi/ni/bini00132.aspx?income_pk=' + grdApprove.GetGridData( grdApprove.row, G2_CLOSE_PK);
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
    
    var url =System.RootURL + "/reports/bi/ni/rpt_fppr00230.aspx?dtFrom="+txtDateFrom.text+"&dtTo="+txtDateTo.text ;
	System.OpenTargetPage(url); 
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_fppr00230':
            if ( grdConfirm.rows > 1 )
            {
                lbConfirmRecord.text = grdConfirm.rows-1 + " record(s)";
                
                grdConfirm.SetCellBold( 1, G1_WH_Name, grdConfirm.rows - 1, G1_WH_Name, true);
            }
            OnSearch('grdApprove');
        break;    
        
        case 'data_fppr00230_1':                    
            if ( grdApprove.rows > 1 )
            {
                lbApproveRecord.text = grdApprove.rows-1 + " record(s)";
                
                grdApprove.SetCellBold( 1, G2_WH_Name, grdApprove.rows - 1, G2_WH_Name, true);
            }          
        break;  
                 
        case 'pro_fppr00230' :
            alert(txtReturnValue.text);
            data_fppr00230.Call('SELECT')   
        break;
        
        case'pro_fppr00230_1':
            alert(txtReturnValue.text);
            data_fppr00230_1.Call('SELECT');
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
                var a = grdConfirm.GetGridData(i,G1_Chk);
                var b = grdConfirm.GetGridData(i,G1_CLOSE_PK);
                
                if (a == "-1" )
                {
                   income_pk = income_pk + t_link + b ;
                   t_link = ",";
                }
            }
            
            txtCloseMPK.text = income_pk;
            
            if(txtCloseMPK.text=="")
            {
                alert('You must select one slip to approve.');
            }
            else
            {
                 if ( confirm ('Do you want to Approve ?') )
                 {
                        pro_fppr00230.Call();
                 }       
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel  : ' + grdApprove.GetGridData( grdApprove.row, G2_In_Date) ))
                {
                    txtCloseMPK.text = grdApprove.GetGridData( grdApprove.row, G2_CLOSE_PK);
                    
                    pro_fppr00230_1.Call();
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
    <gw:data id="data_fppr00230" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_SEL_fppr00230"  >
                <input bind="grdConfirm" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />
			        <input bind="cboWH_Approve" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />					
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fppr00230_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="<%=l_user%>lg_SEL_fppr00230_1"  >
                <input bind="grdApprove" >
                    <input bind="dtApproveFrom" />
                    <input bind="dtApproveTo" />                
			       	<input bind="cboWH_Cancel" />
					<input bind="txtEmpPK" />
					<input bind="chkUser2" />					
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_fppr00230" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00230" > 
                <input>
                    <input bind="txtCloseMPK" />
                    <input bind="txtEmpPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00230_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fppr00230_1" > 
                <input>
                    <input bind="txtCloseMPK" /> 
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
                        <td>
                            W/H
                        </td>
                        <td style="width: 40%">
                            <gw:list id="cboWH_Approve" styles="width:100%;" />
                        </td>
                        
                        <td style="width: 1%">
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y">User</gw:checkbox>
                        </td>
                        <td style="width: 37%; text-align: center; white-space: nowrap">
                            <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnApprove" img="2" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
                        <td style="width: 1%">
                          
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdConfirm'  header='Check|_PK|Status|In Date|W/H|Remark'
                                format='3|0|0|4|0|0' aligns='1|0|1|1|0|0' check='||||||' editcol='1|0|0|0|0|0'
                                widths='1000|0|1200|1200|2000|2500' sorting='T' styles='width:100%; height:100%' />
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
                            <img id="imgArrow" status="expand" id="imgUp" src="../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" /></td>
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
                            <gw:imgbtn img="excel" alt="Print Report" styles='width:100%;display:none' id="btnPrint" onclick="OnPrint()" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnCancel" img="2" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                        <td style="width: 1%">
                           
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="13">
                            <gw:grid id='grdApprove' header='_PK|Status|In Date|W/H|Remark'
                                format='0|0|4|0|0' aligns='0|1|1|0|0' check='|||||' editcol='0|0|0|0|0'
                                widths='0|1200|1200|2000|2500' sorting='T' styles='width:100%; height:100%' />
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
    <gw:textbox id="txtCloseMPK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
