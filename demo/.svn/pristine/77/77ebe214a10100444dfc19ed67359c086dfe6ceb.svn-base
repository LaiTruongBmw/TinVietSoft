<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Stock Transfer Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_Chk      = 0,           
    G1_TRANS_PK = 1,
    G1_Status   = 2,
    G1_Tr_Date  = 3,
    G1_Slip_No  = 4,
    G1_Ref_No   = 5,
    G1_Out_WH   = 6,
    G1_In_WH    = 7,
    G1_Out_PL   = 8,
    G1_In_PL    = 9,
    G1_Charger  = 10,   
    G1_Remark   = 11,
    G1_Approve  = 12,    
    G1_Cancel   = 13;
        
var G2_TRANS_PK = 0,
    G2_Status   = 1,
    G2_Tr_Date  = 2,
    G2_Slip_No  = 3,
    G2_Ref_No   = 4,
    G2_Out_WH   = 5,
    G2_In_WH    = 6,
    G2_Out_PL   = 7,
    G2_In_PL    = 8,
    G2_Charger  = 9,   
    G2_Remark   = 10,
    G2_Approve  = 11,
    G2_Cancel   = 12;        
//==================================================================
         
function BodyInit()
{       
    System.Translate(document); 
	
	txtUser_PK.text = "<%=session("USER_PK")%>";
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
	pro_bias00020_out_lst.Call();
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
            data_bias00020.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_bias00020_1.Call('SELECT')
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
                var path = System.RootURL + '/standard/forms/bi/as/bias00021.aspx?type=APPROVE&trans_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_TRANS_PK);
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
                    var path = System.RootURL + '/standard/forms/bi/as/bias00021.aspx?type=CANCEL&trans_pk=' + grdApprove.GetGridData( grdApprove.row, G2_TRANS_PK);
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
    
    var url =System.RootURL + "/reports/bi/as/rpt_bias00020.aspx?dtFrom="+txtDateFrom.text+"&dtTo="+txtDateTo.text ;
	System.OpenTargetPage(url); 
}
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bias00020':
            if ( grdConfirm.rows > 1 )
            {
                grdConfirm.SetCellBold( 1, G1_Out_WH, grdConfirm.rows - 1, G1_In_WH, true);
            }
            OnSearch('grdApprove');
        break;    
        
        case 'data_bias00020_1':                    
            if ( grdApprove.rows > 1 )
            {
                grdApprove.SetCellBold( 1, G2_Out_WH, grdApprove.rows - 1, G2_In_WH, true);
            }          
        break;  
                 
        case 'pro_bias00020_3' :
            alert(txtReturnValue.text);
            data_bias00020.Call('SELECT')   
        break;
        
        case'pro_bias00020_4':
            alert(txtReturnValue.text);
            data_bias00020_1.Call('SELECT');
        break;
		
		case 'pro_bias00020_out_lst':
		
			pro_bias00020_in_lst.Call();
        break;	
		
		case 'pro_bias00020_in_lst':
			
            lstConfirmOutWH.SetDataText(txtOutWHStr.text);
            lstConfirmInWH.SetDataText(txtInWHStr.text + "||");
			lstConfirmInWH.value = '';
			
     		lstApproveOutWH.SetDataText(txtOutWHStr.text);
            lstApproveInWH.SetDataText(txtInWHStr.tex + "||");
			lstApproveInWH.value = '';
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
                        pro_bias00020_3.Call();
                 }       
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel Slip : ' + grdApprove.GetGridData( grdApprove.row, G2_Slip_No) ))
                {
                    txtInComePK.text = grdApprove.GetGridData( grdApprove.row, G2_TRANS_PK);
                    
                    pro_bias00020_4.Call();
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
	<!---------------------------------------------------------------->
    <gw:data id="pro_bias00020_out_lst" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bias00020_3" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtOutWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="pro_bias00020_in_lst" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bias00020_4" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtInWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bias00020" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_SEL_bias00020"  >
                <input bind="grdConfirm" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />
					<input bind="lstConfirmOutWH" />
                    <input bind="lstConfirmInWH" />
			        <input bind="txtConfirmNo" />
			        <input bind="txtEmpPK" />
					<input bind="chkUser" />			        
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bias00020_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="st_lg_SEL_bias00020_1"  >
                <input bind="grdApprove" >
                    <input bind="dtApproveFrom" />
                    <input bind="dtApproveTo" /> 
					<input bind="lstApproveOutWH" />               
                    <input bind="lstApproveInWH" />
			        <input bind="txtApproveNo" />
			        <input bind="txtEmpPK" />
					<input bind="chkUser2" />			        
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_bias00020_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00020_3" > 
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
    <gw:data id="pro_bias00020_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00020_4" > 
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
                            Out W/H
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstConfirmOutWH" styles="width:100%;" />
                        </td>
                         <td style="width: 5%; white-space: nowrap" align="right">
                            In W/H
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstConfirmInWH" styles="width:100%;" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtConfirmNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            
                        </td>
                        <td style="width: 1%; text-align: center">
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnApprove" img="approve" text="Approve" onclick="OnProcess('Approve')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnViewDetail" img="popup" text="Detail" onclick="OnPopUp('POConfirm')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="13">
                            <gw:grid id='grdConfirm' header='Chk|_PK|Status|Tr Date|Slip No|Ref No|Out W/H|In W/H|Out P/L|In P/L|Charger|Remark|Approve|Cancel'
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
                            Out W/H
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstApproveOutWH" styles="width:100%;" />
                        </td>
                         <td style="width: 5%; white-space: nowrap" align="right">
                           In W/H
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstApproveInWH" styles="width:100%;" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtApproveNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            
                        </td>
                        <td style="width: 1%; white-space: nowrap" align="center">
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Print Report" styles='display:none' id="btnPrint" onclick="OnPrint()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnViewDetail1" img="popup" text="Detail" onclick="OnPopUp('POApprove')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="15">
                            <gw:grid id='grdApprove' header='_PK|Status|Tr Date|Slip No|Ref No|Out W/H|In W/H|Out P/L|In P/L|Charger|Remark|Approve|Cancel'
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
	<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
	<gw:textbox id="txtOutWHStr" styles="width: 100%;display: none" />	
	<gw:textbox id="txtInWHStr" styles="width: 100%;display: none" />	
    <!----------------------------------------------------------->
    <gw:textbox id="txtInComePK" styles='width:100%;display:none' />
	<gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('grdConfirm')" />
	<gw:checkbox id="chkUser2" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('grdConfirm')" />
    <!----------------------------------------------------------->
</body>
</html>
