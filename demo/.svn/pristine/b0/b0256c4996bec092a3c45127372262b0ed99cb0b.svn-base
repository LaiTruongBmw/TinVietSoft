<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Purchasing Order Approve</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_Chk          = 0,           
    G1_PO_PK        = 1,
    G1_Status       = 2,
    G1_PO_Date      = 3,
    G1_PO_No        = 4,
    G1_PO_Amt       = 5,
    G1_VAT_Amt      = 6,
    G1_Total_Amt    = 7,
    G1_CCY          = 8,
    G1_SUPPLIER_PK  = 9,
    G1_Supplier_ID  = 10,
    G1_Supplier_Name= 11,
    G1_Sale_PO_No   = 12,
    G1_Remark       = 13,
	G1_APPROVE		= 14,
	G1_CANCEL		= 15;
    
var G2_PO_PK        = 0,
    G2_Status       = 1,
    G2_PO_Date      = 2,
    G2_PO_No        = 3,
    G2_PO_Amt       = 4,
    G2_VAT_Amt      = 5,
    G2_Total_Amt    = 6,
    G2_CCY          = 7,
    G2_SUPPLIER_PK  = 8,
    G2_Supplier_ID  = 9,
    G2_Supplier_Name= 10,
    G2_Sale_PO_No   = 11,
    G2_Remark       = 12,
    G2_APPROVE		= 13,
	G3_CANCEL		= 14;
//==================================================================
         
function BodyInit()
{       
    System.Translate(document);
    txtCancelChargerPK.text="<%=Session("EMPLOYEE_PK")%>";
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
    //-----------------------------------------   
    FormatGrid();
    //------------------------------------
    OnSearch('grdConfirm');    
}
//==================================================================
  
function FormatGrid()
{
	var data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' * '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
    lstDept1.SetDataText(data);
	lstDept1.value = '';
	lstDept2.SetDataText(data);
	lstDept2.value = '';
	
    var ctrl = grdConfirm.GetGridControl();   
     
    ctrl.ColFormat(G1_PO_Amt)    = "###,###,###.##" ;
    ctrl.ColFormat(G1_VAT_Amt)   = "###,###,###.##" ;
    ctrl.ColFormat(G1_Total_Amt) = "###,###,###.##" ;
    
    ctrl.Cell( 7, 0, G1_Status, 0, G1_Status) = 0x3300cc;
    //---------------------
    var ctrl = grdApprove.GetGridControl();   
     
    ctrl.ColFormat(G2_PO_Amt)    = "###,###,###.##" ;
    ctrl.ColFormat(G2_VAT_Amt)   = "###,###,###.##" ;
    ctrl.ColFormat(G2_Total_Amt) = "###,###,###.##" ;   
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdConfirm':
            data_epbp00030.Call('SELECT');
        break;
        
        case 'grdApprove':
            data_epbp00030_1.Call('SELECT')
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
                var path = System.RootURL + '/standard/formsep/bp/epbp00031.aspx?type=APPROVE&po_pk=' + grdConfirm.GetGridData( grdConfirm.row, G1_PO_PK);
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
                var path = System.RootURL + '/standard/formsep/bp/epbp00031.aspx?type=CANCEL&po_pk=' + grdApprove.GetGridData( grdApprove.row, G2_PO_PK);
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
        case 'data_epbp00030':
            lbRecord.text = grdConfirm.rows-1 + " record(s)";
            
            if ( grdConfirm.rows > 1 )
            {
                grdConfirm.SetCellBold( 1, G1_PO_No, grdConfirm.rows - 1, G1_PO_No, true);

                grdConfirm.SetCellBgColor( 1, G1_Total_Amt, grdConfirm.rows - 1, G1_Total_Amt, 0xCCFFFF );                                      
            }
             
            OnSearch('grdApprove');         
        break;    
        
        case 'data_epbp00030_1':       
            lbRecord1.text = grdApprove.rows-1 + " record(s)";  
            
            if ( grdApprove.rows > 1 )
            {
                grdApprove.SetCellBold( 1, G2_PO_No, grdApprove.rows - 1, G2_PO_No, true);

                grdApprove.SetCellBgColor( 1, G2_Total_Amt, grdApprove.rows - 1, G2_Total_Amt, 0xCCFFFF );                                      
            }                     
        break;                 
        
        case 'pro_epbp00030_3' :
            alert(txtReturnValue.text);
            OnSearch('grdConfirm');   
        break;
        case'pro_epbp00030_4':
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
                var a = grdConfirm.GetGridData( i, 0);
                var b = grdConfirm.GetGridData( i, 1);
                
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
                pro_epbp00030_3.Call();
            }
        break; 
        
        case 'Cancel':
            if ( grdApprove.row > 0 )
            {
                if ( confirm ('Do you want to Cancel P/O : ' + grdApprove.GetGridData( grdApprove.row, G2_PO_No) ))
                {
                    txtPOPK.text = grdApprove.GetGridData( grdApprove.row, G2_PO_PK);
                    
                    pro_epbp00030_4.Call();
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
         
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_epbp00030" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  function="st_lg_SEL_epbp00030"  >
                <input bind="grdConfirm" >
                    <input bind="dtConfirmFrom" />
                    <input bind="dtConfirmTo" />  
					<input bind="lstDept1" />					
			        <input bind="txtSearchNo1" />					
					<input bind="txtEmpPK" />
					<input bind="chkUser" />   			        
                </input>
                <output bind="grdConfirm" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_epbp00030_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="grid"  function="st_lg_SEL_epbp00030_1"  >
                <input bind="grdOrdPlan" >
                    <input bind="dtApproveFrom" />
                    <input bind="dtApproveTo" /> 
					<input bind="lstDept2" />	
			        <input bind="txtSearchNo2" />	
					<input bind="txtEmpPK" />
					<input bind="chkUser2" />   			        		        
                </input>
                <output bind="grdApprove" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------make plan------------------------------->
    <gw:data id="pro_epbp00030_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00030_3" > 
                <input>
                    <input bind="txtArrayPOPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00030_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00030_4" > 
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
                        
						<td align="right" style="width: 5%; white-space: nowrap">
                            P/O Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtConfirmFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtConfirmTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
						
						<td style="width: 5%; white-space: nowrap" align="center"> 
							Dept
                        </td>                        
                        <td style="width: 20%">
							<gw:list id="lstDept1" styles="width:100%" />
                        </td>
						
                        <td style="width: 5%; white-space: nowrap" align="right">
                            No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSearchNo1" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdConfirm')" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdConfirm')">User
							</gw:checkbox>
                        </td>
                        
                        <td style="width: 12%; text-align: center">
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
                        <td colspan="12">
                            <gw:grid id='grdConfirm' header='Chk|_PK|Status|P/O Date|P/O No|P/O Amount|VAT Amount|Total Amount|CCY|_SUPPLIER_PK|Supplier ID|Supplier Name|_Ref No|Remark|Approve|Cancel'
                                format='3|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|0|1|1|0|3|3|3|1|0|0|0|0|0|1|1'
                                check='|||||||||||||||' editcol='1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='800|0|1200|1200|2500|1500|1500|1500|1000|0|1500|3500|1500|2000|2000|2000'
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
                        <td align="right" style="width: 4%; white-space: nowrap">
                            P/O Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtApproveFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtApproveTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
						
						<td style="width: 5%; white-space: nowrap" align="center"> 
							Dept
                        </td>                        
                        <td style="width: 20%">
							<gw:list id="lstDept2" styles="width:100%" />
                        </td>
						
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Search No
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtSearchNo2" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
                            <gw:checkbox id="chkUser2" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdApprove')">User
							</gw:checkbox>
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
                        </td>
                        
                        <td style="width: 16%; white-space: nowrap" align="center">
                            <gw:label id="lbRecord1" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdApprove')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Print Report" styles='display:none' id="btnPrint"
                                onclick="OnPrint()" />
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
                            <gw:grid id='grdApprove' header='_PK|Status|P/O Date|P/O No|P/O Amount|VAT Amount|Total Amount|CCY|_SUPPLIER_PK|Supplier ID|Supplier Name|_Ref No|Remark|Approve|Cancel'
                                format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|1|0|3|3|3|1|0|0|0|0|0|1|1'
                                check='||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1200|1200|2500|1500|1500|1500|1000|0|1500|3500|1500|2000|2000|2000'
                                sorting='T' styles='width:100%; height:100%' oncelldblclick="OnPopUp('POApprove')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtPOPK" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <!----------------------------------------------------------->
    <gw:textbox id="txtArrayPOPK" styles='width:100%;display:none' />
    <gw:textbox id="txtCancelChargerPK" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
