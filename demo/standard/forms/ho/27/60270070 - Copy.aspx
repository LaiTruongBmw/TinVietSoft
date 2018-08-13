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
	G2_Is_ToDay     = 13
	;
   
var arr_FormatNumber = new Array();  
 //===================================================================    

 function BodyInit()
 {
    dtFrom.SetDataText(System.AddDate(dtFrom.GetData(),-0));
    //----------------------
	Binding();
	OnSearch('EX-RATE');
 }
 
 function Binding()
{
	var data;
	data = "<%=CtlLib.SetListDataSQL("SELECT A.* FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' and del_if=0 and use_yn='Y' and code in ('POINT-01','POINT-02','POINT-03','POINT-04','POINT-05','POINT-06','POINT-07','POINT-08','POINT-09','POINT-16','POINT-17','POINT-18','POINT-19','POINT-21') UNION SELECT '','ALL' FROM DUAL ) A ORDER BY A.NAME")%>";
	lstLocation.SetDataText(data);
	 
    data = "<%=CtlLib.SetListDataSQL("SELECT '', 'ALL' FROM DUAL UNION ALL SELECT TO_CHAR (pk), last_name FROM tht_room_allocate WHERE pk < 0 AND del_if = 0")%>";
    lstGolfType.SetDataText(data);
}
  //===================================================================    
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'ADJUST':
            if ( grdInvoices.row > 0 )
            {
                grdAdjust.AddRow();
                grdAdjust.SetGridText( grdAdjust.rows-1, G2_Invoice_PK, grdInvoices.GetGridData(grdInvoices.row, COL_PK));
				grdAdjust.SetGridText( grdAdjust.rows-1, G2_Invoice_ID, grdInvoices.GetGridData(grdInvoices.row, COL_INVOICE_ID));
				grdAdjust.SetGridText( grdAdjust.rows-1, G2_Room_No, 	grdInvoices.GetGridData(grdInvoices.row, COL_ROOM_NO));
				grdAdjust.SetGridText( grdAdjust.rows-1, G2_Guest_Name, grdInvoices.GetGridData(grdInvoices.row, COL_GUEST_NAME));
				grdAdjust.SetGridText( grdAdjust.rows-1, G2_Total_DUE, 	grdInvoices.GetGridData(grdInvoices.row, COL_DUE));
				grdAdjust.SetGridText( grdAdjust.rows-1, G2_Ex_Rate, 	txtExRate.text);
				grdAdjust.SetGridText( grdAdjust.rows-1, G2_Adj_by_PK, 	grdInvoices.GetGridData(grdInvoices.row, user_pk));
            }  
            else
            {
                alert("PLS SELECT ONE INVOICE!");
            }   	                                                                            
        break;
    }
}
//===================================================================    
 function OnSearch(pos)
 {
    switch (pos)
    {
		case 'EX-RATE':       
            dsoRate.Call();
        break;
		
        case 'ADJUST':
            txtInvoices.text = '' ;            
            data_htfo00130_1.Call("SELECT");
        break;
    
	    case 'INVOICE':
            dsoListInvoices.Call("SELECT");	    
	    break;
    }    
 }
 
 //===================================================================    

 function OnDataReceive(obj)
 {
	switch (obj.id){
		case 'dsoRate':
			dsoListInvoices.Call("SELECT");	
		break;
        case 'dsoListInvoices':
            if (grdInvoices.rows > 1){
				lblRecord.text = grdInvoices.rows-1 + " record(s).";
			}	
        break;
    
	    case 'INVOICE':
            dsoListInvoices.Call("SELECT");	    
	    break;
    } 
 }
 
//=========================================================================

function OnSave(pos)
{
    switch (pos)
    {
        case 'ADJUST':
            data_htfo00130_1.Call();
        break;
    }    
}

//=========================================================================

function OnDelete(pos)
{
    switch (pos)
    {
        case 'ADJUST':
			if(grdAdjust.row > 0)
				if(confirm('Are you sure to delete?'))
					grdAdjust.DeleteRow();
        break;
    }    
}

//=========================================================================

function CheckInput()
{   
    var col, row, total = 0;
    
    col = event.col;
    row = event.row;
    
    if ( col == G2_Adj_Amt_VND)
        if (!Number(grdAdjust.GetGridData(row,col))){
			    grdAdjust.SetGridText(row,col,""); return false;
			}
    
    for(var idx = 1; idx < grdAdjust.rows; idx ++){
        total += Number(grdAdjust.GetGridData(idx, G2_Adj_Amt_VND));
    }
    
    if((Number(grdAdjust.GetGridData(1, G2_Total_DUE)) + total) < 0){
        alert("Total Adjust amt plus Total DUE must greater than or equal to 0.");
        grdAdjust.SetGridText(row,col,0); return false;
    }
    
}

function OnValid(){
    if(grdAdjust.GetGridData(grdAdjust.row,G2_Is_ToDay) == 'N'){
        alert("Only can modify and delete adjust at current day!");
        grdAdjust.row = -1;
    }
}

function OnReport()
 {
	if(grdAdjust.row !='-1')
	{		
		var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/rt/htrt00120.rpt&procedure=sp_rpt_htrt00120&parameter="+grdAdjust.GetGridData(grdAdjust.row,0);  
         System.OpenTargetPage(url); 
	}
 }
//=========================================================================
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="dsoRate" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ht_pro_60270070" > 
                <input>
                    <input bind="txtExRate" /> 
                </input> 
                <output>
                    <output bind="txtExRate" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="dsoListInvoices" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" function="ht_sel_60270070" procedure="">  
                <input bind="grdInvoices">  
                    <input bind="dtFrom" />
					<input bind="dtTo" />
                    <input bind="lstLocation" />
                    <input bind="lstGolfType" />
					<input bind="txtInvoiceNo" />
                </input> 
                <output bind="grdInvoices" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00130_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"   parameter="0,1,6,7,8,9,11,12" function="ht_sel_60270070_1"  procedure="ht_upd_60270070_1">
                <input  bind="grdAdjust">
                    <input bind="txtInvoices" />
                </input> 
                <output bind="grdAdjust" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 50%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style=" height: 2%">
                         <td colspan="2">
                             <fieldset>
						        <table style="width: 100%; height: 100%">
							        <tr>
							            <td style="width:5%">
											Invoice#
										</td>
										<td style="width:10%">
											<gw:textbox id="txtInvoiceNo" styles="width:100%;" onenterkey="OnSearch('INVOICE')" />
										</td>
								        <td width="5%" align="center">
									        Date
								        </td>
										<td width="5%">
									        <gw:datebox id="dtFrom" lang="1" onchange="OnSearch('INVOICE')" />
								        </td>
								        <td style="width:1%"> ~ </td>
								        <td width="5%">
									        <gw:datebox id="dtTo" lang="1" onchange="OnSearch('INVOICE')" /> 
								        </td>
								        <td width="5%" align="center">
									        Location
								        </td>
								        <td width="20%">
									        <gw:list id="lstLocation" onchange="OnSearch('INVOICE')" />
								        </td>
								        <td width="7%" style="white-space:nowrap">
								            Customer Type
								        </td>
								        <td style="width:10%">
								            <gw:list id="lstGolfType" onchange="OnSearch('INVOICE')" />
								        </td>
								        <td width="3%">
									        <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('INVOICE')" />
								        </td>
								        <td style="width:3%">
								        </td>
								        <td style="width:15%" align="left">
								            <gw:label id="lblRecord" styles="color: blue; width: 100%"></gw:label>
								        </td>
							        </tr>
						        </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="11">
                            <gw:grid id='grdInvoices' header='_PK|Invoice ID|Time|DUE|AMT(+)|VAT(+10%)|SVC(+5%)|DSC(-)|Location|Staff|Room#|Customer Name|_Loc'
                                            format  ='0|0|0|-0|-0|-0|-0|-0|0|0|0|0|0' 
                                            aligns  ='0|0|1|0|0|0|0|0|0|0|1|0|0' 
                                            editcol ='0|0|0|0|0|0|0|0|0|0|0|0|0'
                                            defaults='||||||||||||' 
                                            autosize='T'
                                            widths	='0|0|0|0|0|0|0|0|0|0|0|0|0' 
											sorting='T' styles='width:100%;height:100%' 
											oncellclick="txtInvoices.text=grdInvoices.GetGridData(grdInvoices.row, COL_PK); data_htfo00130_1.Call('SELECT');"
											/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
						<td>
                             <fieldset>
						        <table style="width: 100%; height: 100%">
							        <tr>
										<td align="right" style="width: 10%; white-space: nowrap">
											
										</td>
										<td style="width: 20%; white-space: nowrap">
											
										</td>
										<td style="width: 10%" align="right">
											
										</td>
										<td style="width: 20%" align="right">
											
										</td>
										<td width="36%" align="center">
										</td>
										<td style="width: 1%" align="left">
											
										</td>
										<td style="width: 1%" align="left">
											<gw:imgbtn id="ibtnAddNew" img="new" alt="new" onclick="OnAddNew('ADJUST')" />
										</td>
										<td style="width: 1%" align="left">
											<gw:imgbtn id="ibtnDelete" img="delete" alt="delete" onclick="OnDelete('ADJUST')" style="display:none" />
										</td>
										<td style="width: 1%" align="left">
											<gw:imgbtn id="ibtnSave" img="save" alt="Save" onclick="OnSave('ADJUST')" />
										</td>
										<td style="width: 3%" align="right">
											<gw:imgbtn id="ibtnReport2" img="printer" alt="Print" onclick="OnReport()" />
										</td>
									</tr>
						        </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td>
                            <gw:grid id='grdAdjust' 
								header	='_PK|_Invoice_PK|Invoice ID|Room No|Guest Name|Total DUE|Adj Date|_ExRate|Adj Amt(VND)|_AdjAmt(USD)|Adj By|Adj Reason|_Adj_by_PK|_IsToDay'
                                format	='0|0|0|0|0|-0|4|-0|-0|-2|0|0|0|0' 
                                aligns	='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                check	='|||||||||||||'
                                editcol	='0|0|0|0|0|0|0|0|1|0|0|1|0|0' 
                                widths	='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                sorting	='T' autosize='T' acceptnulldate='F' styles='width:100%; height:100%' onafteredit="CheckInput()" />
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
