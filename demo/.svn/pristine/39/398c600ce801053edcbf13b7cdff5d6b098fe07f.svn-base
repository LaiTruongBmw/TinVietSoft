<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SALE ORDER APPROVE</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_CHK           = 0,   
    G1_MASTER_PK     = 1,
    G1_STATUS        = 2,
    G1_SLIP_PO_NO 	 = 3,
    G1_ORD_DT      	 = 4,
	G1_STYLE_PK		 = 5,
	G1_STYLE_ID		 = 6,
	G1_STYLE_NAME	 = 7,
    G1_TOTAL_QTY     = 8,
    G1_BILL_TO_PK    = 9,
    G1_PARTNER_ID    = 10,
    G1_PARTNER_NAME  = 11,
	G1_APPROVED_BY	 = 12,
	G1_CANCEL_BY	 = 13;
    
var G2_CHK           = 0,   
    G2_MASTER_PK     = 1,
    G2_STATUS        = 2,
    G2_SLIP_PO_NO 	 = 3,
    G2_Order_DT      = 4,
    G2_STYLE_PK		 = 5,
	G2_STYLE_ID		 = 6,
	G2_STYLE_NAME	 = 7,
    G2_TOTAL_QTY     = 8,
    G2_BILL_TO_PK    = 9,
    G2_PARTNER_ID    = 10,
    G2_PARTNER_NAME  = 11,
	G2_APPROVED_BY	 = 12,
	G2_CANCEL_BY	 = 13;
//==================================================================
         
function BodyInit()
{          
    txtCancelChargerPK.text="<%=Session("EMPLOYEE_PK")%>";
	txtUserPK.text="<%=Session("USER_PK")%>";
    System.Translate(document);
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom1.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom1.value=ldate ;
    dtFrom2.value=ldate ;
    //-----------------
    FormatGrid();
     
    //------------------------------------
    OnSearch('grdConfirm');    
}
//==================================================================
  
function FormatGrid()
{
    var ctrl = grdConfirm.GetGridControl();        
    ctrl.ColFormat(G1_TOTAL_QTY)    = "###,###,###" ;
    
    ctrl.Cell( 7, 0, G1_STATUS, 0, G1_STATUS) = 0x3300cc;
    //---------------------
    var ctrl = grdApprove.GetGridControl();   
    ctrl.ColFormat(G2_TOTAL_QTY)   = "###,###,###" ;
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':
            data_dsbs00020.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_dsbs00020_1.Call('SELECT')
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
                var path = System.RootURL + '/standard/forms/ds/bs/dsbs00021.aspx?SO_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_MASTER_PK) + '&BtnAction=POConfirm';
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
				
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
            }  
	        else
	        {
	            alert('Pls select P/O.');
	        }       
         break ;
         
         case 'POApprove':
           if ( grdApprove.row > 0 )
            {
                var path = System.RootURL + '/standard/forms/ds/bs/dsbs00021.aspx?SO_pk=' + grdApprove.GetGridData( grdApprove.row, G2_MASTER_PK)+ '&BtnAction=POApprove';
                var object = System.OpenModal( path, 1000, 600, 'resizable:yes;status:yes', this); 
                
                if ( object != null )                    
                {
                    OnSearch('grdConfirm');
                }
	        }
	        else
	        {
	            alert('Pls select P/O.');
	        } 
         break;                        
     }       
}

//==================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_dsbs00020':
            lbRecord.text = grdConfirm.rows-1 + " record(s)";
            
            if ( grdConfirm.rows > 1 )
            {
                grdConfirm.SetCellBold( 1, G1_SLIP_PO_NO, grdConfirm.rows - 1, G1_SLIP_PO_NO, true);
				grdConfirm.SetCellBold( 1, G1_TOTAL_QTY,  grdConfirm.rows - 1, G1_TOTAL_QTY,  true);
				grdConfirm.SetCellBold( 1, G1_STYLE_ID,   grdConfirm.rows - 1, G1_STYLE_ID,   true);

                grdConfirm.SetCellBgColor( 1, G1_TOTAL_QTY, grdConfirm.rows - 1, G1_TOTAL_QTY, 0xCCFFFF );                                      
            } 
			            
            OnSearch('grdApprove');         
        break;    
        
        case 'data_dsbs00020_1':       
            lbRecord1.text = grdApprove.rows-1 + " record(s)";  
            
            if ( grdApprove.rows > 1 )
            {
                grdApprove.SetCellBold( 1, G2_SLIP_PO_NO, grdApprove.rows - 1, G2_SLIP_PO_NO, true);
				grdApprove.SetCellBold( 1, G2_TOTAL_QTY,  grdApprove.rows - 1, G2_TOTAL_QTY,  true);
				grdApprove.SetCellBold( 1, G1_STYLE_ID,   grdApprove.rows - 1, G1_STYLE_ID,   true);
				
                grdApprove.SetCellBgColor( 1, G2_TOTAL_QTY, grdApprove.rows - 1, G2_TOTAL_QTY, 0xCCFFFF );                                      
            }                     
        break;   
        //--------        
        case 'pro_dsbs00020' :
			if ( txtReturnValue.text == 'ERROR_01' && txtReturnSOPK.text != '' )
			{
				var path = System.RootURL + '/standard/forms/ds/bs/dsbs00025.aspx?sale_order_m_pk=' + txtReturnSOPK.text ;
                var object = System.OpenModal( path, 1100, 400, 'resizable:yes;status:yes', this); 
			}
			
            OnSearch('grdConfirm');
        break;                           
        
        case'pro_dsbs00020_1':
            alert(txtReturnValue.text);
            OnSearch('grdConfirm');
        break;
    }
}  

//==================================================================
var flag="";
function OnProcess(pos)
{
    switch (pos)
    {         
        case'Approve':
            var po_pk = "";
            
            for(var i=1; i<grdConfirm.rows; i++)
            {
                var a = grdConfirm.GetGridData( i, G1_CHK);
                var b = grdConfirm.GetGridData( i, G1_MASTER_PK);
                
                if ( a == "-1" )
                {
                   po_pk= po_pk + b +",";
                }
            }
            
            txtArrayPOPK.text = po_pk.substring( 0, po_pk.length-1);
                        
            if ( txtArrayPOPK.text == "" )
            {
                alert('You must select one P/O.');
            }
            else
            {
                if ( confirm ('Do you want to approve this P/O ?'))
                {
                    pro_dsbs00020.Call();
                }
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel P/O : ' + grdApprove.GetGridData( grdApprove.row, G2_SLIP_PO_NO) ))
                {
                    txtPOPK.text = grdApprove.GetGridData( grdApprove.row, G2_MASTER_PK);                    
                    pro_dsbs00020_1.Call();
                }    
            }
            else
            {
                alert('Pls select one P/O.');
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
function OnReport()
{
    if(grdApprove.row > -1)
    {
         var url =System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00020.aspx?p_master_pk=" + grdApprove.GetGridData( grdApprove.row, G2_MASTER_PK) ;
         System.OpenTargetPage(url);     
    }
}

//==================================================================  

</script>
<body>
    <!--------------------------------Lay thong tin sale order------------------------------------->
    <gw:data id="data_dsbs00020" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_sel_dsbs00020"  >
                <input bind="grdConfirm" >
                    <input bind="dtFrom1" />
                    <input bind="dtTo1" />                
			        <input bind="txtSearchNo1" />
                    <input bind="txtPartner1" />
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!-----------------------------Lay thong tin sale order duoc cancel <input bind="chkClose" />---------------------------------------->
    <gw:data id="data_dsbs00020_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="st_lg_sel_dsbs00020_1">
                <input bind="grdOrdPlan" >
                    <input bind="dtFrom2" />
                    <input bind="dtTo2" />                  
			        <input bind="txtSearchNo2" />		        
                    <input bind="txtPartner2" />
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------Thuc hien approve sale order------------------------------->
    <gw:data id="pro_dsbs00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dsbs00020" > 
                <input>
                    <input bind="txtArrayPOPK" />
					<input bind="txtCancelChargerPK" />
					<input bind="txtCheckPriceYN" />					
                </input> 
                <output>
					<output bind="txtReturnSOPK" />
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------thuc hien cancel sale order ------------------------------------>
    <gw:data id="pro_dsbs00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_PRO_DSBS00020_1" > 
                <input>
                    <input bind="txtPOPK" /> 
                    <input bind="txtCancelChargerPK" />
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
                        <td align="right" style="width: 10%; white-space: nowrap">
                            P/O Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom1" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo1" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSearchNo1" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Partner
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtPartner1" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 27%; text-align: center">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
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
                        <td colspan="10">
                            <gw:grid id='grdConfirm' header='Chk|_PK|Status|Slip No|Order DT|_STYLE_PK|Style Code|Style Name|Ord Qty|_bill_to_pk|_partner_id|Partner Name|Remark|Approve|Cancel'
                                format='3|0|0|0|4|0|0|0|1|0|0|0|0|0|0' aligns='0|0|1|0|1|0|0|0|3|0|0|0|0|1|1'
                                check='||||||||||||||' editcol='1|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='500|0|1200|2000|1200|0|1500|2500|1500|0|0|3000|1500|1500|1500'
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
                        <td style="width: 1%">
                            <img id="imgArrow" status="expand" id="imgUp" src="../../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td align="right" style="width: 9%; white-space: nowrap">
                            P/O Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom2" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo2" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSearchNo2" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
                            Partner
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="center">
                            <gw:textbox id="txtPartner2" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td style="width: 16%; white-space: nowrap" align="center">
                            <gw:label id="lbRecord1" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport()" styles='display:none' />
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
                        <td colspan="14">
                            <gw:grid id='grdApprove' header='_NULL|_PK|Status|Slip No|Order DT|_STYLE_PK|Style Code|Style Name|Ord Qty|_bill_to_pk|_partner_id|Partner Name|Remark|Approve|Cancel'
                                format='0|0|0|0|4|0|0|0|1|0|0|0|0|0|0' aligns='0|0|1|0|1|0|0|0|3|0|0|0|0|1|1'
                                check='||||||||||||||' editcol='1|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='500|0|1200|2000|1200|0|1500|2500|1500|0|0|3000|1500|1500|1500'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtPOPK" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtArrayPOPK" styles='width:100%;display:none' />
    <gw:textbox id="txtCancelChargerPK" styles='width:100%;display:none'>
	<gw:textbox id="txtUserPK" styles='width:100%;display:none'>
	
	<gw:textbox id="txtCheckPriceYN" styles='width:100%;display:none' text='N' >
	<gw:textbox id="txtReturnSOPK" styles='width:100%;display:none'>
    <!----------------------------------------------------------->
</body>
</html>
