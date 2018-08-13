<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Hotel Ledger Adjust</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var  user_name  = "<%=Session("USER_NAME")%>" ;
    
var COL_PK          = 0,
    COL_INVOICE_ID  = 1,
    COL_TIME        = 2,
    COL_DUE         = 3,
	COL_AMT         = 4,
	COL_VAT         = 5,
	COL_SVC         = 6,
	COL_DSC         = 7,
    COL_LOCATION    = 8,
    COL_FULL_FNAME  = 9,
    COL_ROOM_NO     = 10,
    COL_GUEST_NAME  = 11,
    COL_LOC         = 12;  
    
var G2_PK           = 0,
    G2_Invoice_PK   = 1,
    G2_Invoice_ID   = 2,
    G2_Room_No	    = 3,
    G2_Guest_Name  	= 4,
    G2_Total_DUE    = 5,
    G2_Adj_Date  	= 6,
    G2_Ex_Rate  	= 7,
    G2_Adj_Amt_VND  = 8,
    G2_Adj_Amt_USD  = 9,
    G2_Adj_By 		= 10,
    G2_Adj_Reason   = 11,
	G2_Adj_by_PK    = 12,
	G2_Pay_Method   = 13 ;
   
var arr_FormatNumber = new Array();  
 //===================================================================    

 function BodyInit()
 {
    dtFrom.SetDataText(System.AddDate(dtFrom.GetData(),-0));
	lstPayment.SetDataText("DATA|ALL|ALL|N|SEND FO|Y|CASH");
	lstPayment.value = 'ALL';
    //----------------------
	Binding();
	OnSearch();
 }
 
 function Binding()
{
	
}
  //===================================================================    
function OnReport()
 {
	if(grdAdjust.rows >1)
	{		
		/* var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/rt/rpt_htrt00160.rpt&procedure=sp_rpt_htrt00160&parameter="+txtInvoiceNo.text+","+dtFrom.value+","+dtTo.value;              
	    System.OpenTargetPage(url); /**/
		var url = '/standard/reports/60/27/rpt_ht_60270090_POS_Adjust_Inquiry.aspx?p_invoice_or_room_no='+txtInvoiceNo.text+'&p_dt_frm='+dtFrom.value+'&p_dt_to='+dtTo.value;  
		System.OpenTargetPage( System.RootURL+url , "newform" );
	}
 }
 function OnSearch()
 {
	data_htfo00130_1.Call("SELECT");
 }
 function OnDataReceive(obj)
 {
	if(obj.id=='data_htfo00130_1')
	{
		grdAdjust.Subtotal( 1, 2, -1, '5!8!9');
		if(grdAdjust.rows > 1)
		{
			lblRecord.text=grdAdjust.rows -2 +" item(s)."
		}
	}
 }
//=========================================================================
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00130_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  function="st_ht_sel_60270090">
                <input  bind="grdAdjust">
                    <input bind="txtInvoiceNo" />
					<input bind="dtFrom" />
					<input bind="dtTo" />
					<input bind="lstPayment" />
                </input> 
                <output bind="grdAdjust" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 100%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style=" height: 2%">
                         <td >
                             <fieldset>
						        <table style="width: 100%; height: 100%">
							        <tr>
							            <td width="4%" align="center">
									        Date
								        </td>
								        <td width="31%">
									        <gw:datebox id="dtFrom" lang="1" styles="width:45%; " onchange="OnSearch()"  /> 
											~
									        <gw:datebox id="dtTo" lang="1" styles="width:45%; " onchange="OnSearch()" /> 
								        </td>
										<td style="width:24%" align="right">
											Guest Name/Invoice#/RM#
										</td>
										<td style="width:8%">
											<gw:textbox id="txtInvoiceNo" styles="width:100%;" onenterkey="OnSearch()" />
										</td>
										<td style="width:6%;">
											Payment Method
										</td>
										<td style="width:9%;">
											<gw:list id="lstPayment" styles="width:100%;" onchange="OnSearch()" />
										</td>
								        <td style="width:4%">Total:
								        </td>
								        <td style="width:11%" align="left">
								            <gw:label id="lblRecord" styles="color: blue; width: 100%"></gw:label>
								        </td>
										<td width="1%">
									        <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
								        </td>
										<td style="width: 1%" align="right">
											<!--<gw:imgbtn id="ibtnReport2" img="printer" alt="Print" onclick="OnReport()" />-->
											<gw:imgbtn img="excel" alt="Print" text="Print" id="ibtnReport2" onclick="OnReport()" />
										</td>
							        </tr>
						        </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="8">
                            <gw:grid id='grdAdjust' 
								header	='_PK|_Invoice_PK|Invoice ID|Room No|Guest Name|Total DUE|Adj Date|_ExRate|Adj Amt(VND)|_AdjAmt(USD)|Adj By|Adj Reason|_Adj_by_PK|Pay Method|Adjust Time'
                                format	='0|0|0|0|0|-0|4|-0|-0|-2|0|0|0|0|0' 
                                aligns	='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                check	='||||||||||||||'
                                editcol	='0|0|0|0|0|0|0|0|1|0|0|1|0|0|0' 
                                widths	='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                sorting	='T' autosize='T' acceptnulldate='F' styles='width:100%; height:100%' onafteredit="CheckInput()"  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
    </table>
    <gw:textbox id="txtInvoices" styles='width:100%;display:none' />
    <gw:textbox id="txtExRate" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
