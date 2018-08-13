<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>GOODS DELIVERY APPROVE</title>
</head>
<script type="text/javascript">
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_CHK        = 0,           
    G1_OUTGO_PK   = 1,
    G1_STATUS     = 2,
    G1_OUT_DATE   = 3,
    G1_SLIP_NO    = 4,
    G1_REF_NO     = 5,
    G1_PARTNER_ID = 6,
    G1_PARTNER_NM = 7,
    G1_AMOUNT     = 8,
	G1_CCY		  = 9,
    G1_CHARGER    = 10, 	  
    G1_REMARK     = 11,
	G1_APPROVE	  = 12,
	G1_CANCEL     = 13;
    
var G2_OUTGO_PK   = 0,
    G2_STATUS     = 1,
    G2_OUT_DATE   = 2,
    G2_SLIP_NO    = 3,
    G2_REF_NO     = 4,
    G2_PARTNER_ID = 5,
    G2_PARTNER_NM = 6,
    G2_AMOUNT     = 7,
	G2_CCY		  = 8,
    G2_CHARGER    = 9, 	  
    G2_REMARK     = 10,
	G2_APPROVE	  = 11,
	G2_CANCEL     = 12;
//==================================================================
         
function BodyInit()
{          
    System.Translate(document);
    //-----------------------------------
    var now = new Date(); 
    var lmonth, ldate;
    txt_EmpPK.text = "<%=Session("EMPLOYEE_PK")%>";
    ldate=dtApproveFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtApproveFrom.value=ldate ; 
    
    ldate=dtConfirmFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtConfirmFrom.value=ldate ;  
    //-----------------------------------
        
    FormatGrid();
    //-----------------------------------
    
    OnSearch('grdConfirm');
}
//==================================================================
  
function FormatGrid()
{
    var ctrl = grdConfirm.GetGridControl();       
    
    ctrl.Cell( 7, 0, G1_STATUS, 0, G1_STATUS) = 0x3300cc;
	ctrl.ColFormat(G1_AMOUNT) = "#,###,###,###,###,###.##";
    //--------------------- 
	ctrl = grdApprove.GetGridControl(); 
	
    ctrl.Cell( 7, 0, G2_STATUS, 0, G2_STATUS) = 0x3300cc;
	ctrl.ColFormat(G2_AMOUNT) = "#,###,###,###,###,###.##";
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':
            data_dscd00090.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_dscd00090_1.Call('SELECT')
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
                var path = System.RootURL + '/standard/forms/ds/cd/dscd00091.aspx?type=APPROVE&OUTGO_PK=' + grdConfirm.GetGridData( grdConfirm.row, G1_OUTGO_PK);
                var object = System.OpenModal( path, 1000, 600, 'scroll:no;resizable:yes;status:yes', this);
                 
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
            }    
         break ;
         
         case 'POApprove':
            if ( grdApprove.row > 0 )
            {
                    var path = System.RootURL + '/standard/forms/ds/cd/dscd00091.aspx?type=CANCEL&OUTGO_PK=' + grdApprove.GetGridData( grdApprove.row, G2_OUTGO_PK);
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

function OnGridCellDblClick(objGrid)
{
    switch(objGrid.id)
    {
        case 'grdApprove':
            OnPopUp('POApprove');
        break;
        case 'grdConfirm':
            OnPopUp('POConfirm');
        break;
        
    }
}
 
//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_dscd00090':
            lbConfirmRecord.text = grdConfirm.rows-1 + " record(s)";  
            if ( grdConfirm.rows > 1 )
            {                              
                grdConfirm.SetCellBold( 1, G1_PARTNER_ID, grdConfirm.rows - 1, G1_PARTNER_ID, true);
            }
            OnSearch('grdApprove');
        break;    
        
        case 'data_dscd00090_1': 
            lbApproveRecord.text = grdApprove.rows-1 + " record(s)"; 
            if ( grdApprove.rows > 1 )
            {                               
                grdApprove.SetCellBold( 1, G2_PARTNER_ID, grdApprove.rows - 1, G2_PARTNER_ID, true);
            }          
        break;  
                 
        case 'pro_dscd00090_3' :
            alert(txtReturnValue.text);
            data_dscd00090.Call('SELECT')   
        break;
        
        case'pro_dscd00090_4':
            alert(txtReturnValue.text);
            data_dscd00090.Call('SELECT')           
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
                if (grdConfirm.GetGridData( i, G1_CHK ) == "-1" )
                {
                   OUTGO_PK = OUTGO_PK + t_link + grdConfirm.GetGridData( i, G1_OUTGO_PK ) ;
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
                        pro_dscd00090_3.Call();
                 }       
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel Slip : ' + grdApprove.GetGridData( grdApprove.row, G2_SLIP_NO ) ))
                {
                    txtOutGoPK.text = grdApprove.GetGridData( grdApprove.row, G2_OUTGO_PK);                    
                    pro_dscd00090_4.Call();
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
    <!--------------------------------------------------------------------->
    <gw:data id="data_dscd00090" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_sel_dscd00090"  >
                <input bind="grdConfirm" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />
			        <input bind="txtConfirmNo" />
					<input bind="txtConPartner" />
                    <input bind="txt_EmpPK" />
					<input bind="chkUser" />	
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_dscd00090_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="st_lg_sel_dscd00090_1"  >
                <input bind="grdApprove" >
                    <input bind="dtApproveFrom" />
                    <input bind="dtApproveTo" />                
			        <input bind="txtApproveNo" />
					<input bind="txtAppPartner" />
                    <input bind="txt_EmpPK" />
					<input bind="chkUser2" />	
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!----------------------------------------------------------------->
    <gw:data id="pro_dscd00090_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00090_3" > 
                <input>
                    <input bind="txtOutGoPK" />
                    <input bind="txt_EmpPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_dscd00090_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00090_4" > 
                <input>
                    <input bind="txtOutGoPK" /> 
                    <input bind="txt_EmpPK" />
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
                            <gw:datebox id="dtConfirmFrom" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('grdConfirm')" />
                            ~
                            <gw:datebox id="dtConfirmTo" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Slip/PO No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtConfirmNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Partner
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtConPartner" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 1%">
                            <gw:checkbox id="chkUser" styles="color:blue;display:none" defaultvalue="Y|N" value="N" onchange="OnSearch('grdConfirm')"></gw:checkbox>
                        </td>
                        <td style="width: 27%; text-align: center">
                            <gw:label id="lbConfirmRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
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
                        <td colspan="11">
                            <gw:grid id='grdConfirm' header='Chk|_PK|Status|Out Date|Slip No|Ref No|Partner ID|Partner Name|Amount|CCY|Charger|Remark|Approve|Cancel'
                                format='3|0|0|4|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|1|0|0|0|0|3|1|0|0|0|0' editcol='1|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='500|0|1200|1200|1500|2000|1500|3500|1500|800|2000|1500|1500|1500' sorting='T' styles='width:100%; height:100%'
                                oncelldblclick='OnGridCellDblClick(this)' />
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
                            <img alt="" id="imgArrow" status="expand" id="imgUp" src="../../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtApproveFrom" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('grdApprove')" />
                            ~
                            <gw:datebox id="dtApproveTo" lang="<%=Application("Lang")%>" mode="01" onchange="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Slip/PO No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtApproveNo" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Partner
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtAppPartner" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%">
                            <gw:checkbox id="chkUser2" styles="color:blue;display:none" defaultvalue="Y|N" value="N" onchange="OnSearch('grdApprove')"></gw:checkbox>
                        </td>
                        <td style="width: 22%; white-space: nowrap" align="center">
                            <gw:label id="lbApproveRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%" >
                            <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
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
                            <gw:grid id='grdApprove' header='_PK|Status|Out Date|Slip No|Ref No|Partner ID|Partner Name|Amount|CCY|Charger|Remark|Approve|Cancel'
                                format='0|0|4|0|0|0|0|0|0|0|0|0|0' aligns='0|1|1|0|0|0|0|3|1|0|0|0|0' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='0|1200|1200|1500|2000|1500|3500|1500|800|2000|1500|1500|1500' sorting='T' styles='width:100%; height:100%'
                                oncelldblclick='OnGridCellDblClick(this)' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtOutGoPK" styles='width:100%;display:none' />
    <gw:textbox id="txt_EmpPK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
