<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Evaluation Group Entry</title>
</head>

<script>
var COL_PK          = 0,
    COL_INVOICE_ID  = 1,
    COL_TIME        = 2,
    COL_AMT         = 3,
    COL_LOCATION    = 4,
    COL_FULL_FNAME  = 5,
    COL_CARD_NO     = 6,
    COL_GOLFER_NAME = 7,
    COL_LOC         = 8;       
function BodyInit()
{
	var data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code,NAME FROM tco_commcode WHERE DEL_IF=0 and  parent_code='PTYPE' and use_yn='Y' and code<>'PTYPE-03'")%>";
	grdInvoices.SetComboFormat(16, data);
    Binding();
	grdInvoices.GetGridControl().FrozenCols = 8;
	OnSearch();
}
function Binding()
{
	var data;
	data = "<%=CtlLib.SetListDataSQL("SELECT A.* FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' and del_if = 0 and use_yn='Y' and code not in ('POINT-09') UNION SELECT '','ALL' FROM DUAL) A ORDER BY A.NAME")%>";
	lstLocation.SetDataText(data);
}
function OnSearch()
{
    dso_htrt00110.Call('SELECT');
}
function OnReport(){
   if(grdInvoices.rows >2)
   {
            var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/rt/rpt_htrt00110.rpt&procedure=sp_rpt_htrt00110&parameter=" + dtDateFrm.value+","+ dtDateTo.value+","+ lstLocation.value+","+ txtCompanyName.GetData();
            System.OpenTargetPage(url); 
	}
}
function OnGetBus(obj){
	var path = System.RootURL + "/form/60/24/60240010_bus.aspx?";
	var object = System.OpenModal( path ,950 , 600 ,  'resizable:yes;status:yes');
	if ( object != null ){
		if(obj == 'control'){
			txtCompanyName.text		= object[2];
		}else{
			grdInvoices.SetGridText(Number(obj), 5, object[0]);
			grdInvoices.SetGridText(Number(obj), 6, object[2]);
		}
	}
}
function OnDataReceive(obj)
{
    switch(obj.id){
        case "dso_htrt00110":
			lblRecord.text = grdInvoices.rows - 2 + " Guest";
			SetGridHeader();
            if (grdInvoices.rows > 1)	
				grdInvoices.Subtotal( 1, 2, -1, '7');
            //dsoListSell.Call();
        break;
    }
}
function SetGridHeader()
{
    var fg=grdInvoices.GetGridControl(); 
    //fg.FrozenCols = 3;
    if(grdInvoices.rows == 1)
        grdInvoices.AddRow();
    grdInvoices.SetCellBold(0,1,1,14,true);
    fg.FixedRows = 2;
    fg.FixCols=1;
    fg.MergeCells = 5;
	
	fg.MergeCol(1) = true;
    fg.Cell(0, 0, 1, 1, 1) = "Invoice #";
	
	fg.MergeCol(2) = true;
    fg.Cell(0, 0, 2, 1, 2) = "Location";
	
	fg.MergeCol(3) = true;
    fg.Cell(0, 0, 3, 1, 3) = "Invoice Date";
	
	fg.MergeCol(4) = true;
    fg.Cell(0, 0, 4, 1, 4) = "Guest Name";
	
	fg.MergeCol(6) = true;
    fg.Cell(0, 0, 6, 1, 6) = "Company Name";
	
	fg.MergeCol(7) = true;
    fg.Cell(0, 0, 7, 1, 7) = "Total DUE";
	
	fg.MergeCol(8) = true;
    fg.Cell(0, 0, 8, 1, 8) = "Total";
	
	fg.MergeCol(15) = true;
    fg.Cell(0, 0, 15, 1, 15) = "Staff";
	
	fg.MergeCol(16) = true;
    fg.Cell(0, 0, 16, 1, 16) = "Payment Method";
	
	fg.Cell(0, 0, 9, 1, 9)   = "(%)";
	fg.Cell(0, 0, 10, 1, 10) = "AMT";
	fg.Cell(0, 0, 11, 1, 11) = "(%)";
	fg.Cell(0, 0, 12, 1, 12) = "AMT";
	fg.Cell(0, 0, 13, 1, 13) = "(%)";
	fg.Cell(0, 0, 14, 1, 14) = "AMT";
	fg.MergeRow(0) = true;
	fg.Cell(0, 0, 9, 0, 10) 	= "Service";
	fg.Cell(0, 0, 11, 0, 12) 	= "Discount";
	fg.Cell(0, 0, 13, 0, 14) 	= "VAT";
}
function grid_OnDouble(){
	if(event.col == 6){
		OnGetBus(event.row);
	}
}
function OnSave(){
	dso_htrt00110.Call();
}
</script>
<body bgcolor='#F5F8FF'>
	<gw:data id="dso_htrt00110" onreceive="OnDataReceive(this)"  > 
		<xml> 
			<dso type="grid" parameter="0,4,5,16" function="st_ht_sel_60270050" procedure="st_ht_upd_60270050">
				<input>
					<input bind="dtDateFrm" />
					<input bind="dtDateTo" />
					<input bind="lstLocation" />
                    <input bind="txtCompanyName" />
				</input>
				<output bind="grdInvoices" />
			</dso>
		</xml>
	</gw:data>
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr style=" height: 2%">
                         <td colspan="2">
                             <fieldset>
						        <table style="width: 100%; height: 100%">
							        <tr>
								        <td width="5%" align="center">
									       Date: 
								        </td>
								        <td width="20%" >
									        <gw:datebox id="dtDateFrm" lang="1" onchange="OnSearch()" />
											~
											<gw:datebox id="dtDateTo" lang="1" onchange="OnSearch()" />
								        </td>
								        <td width="5%" align="center">
									        Location
								        </td>
								        <td width="13%">
									        <gw:list id="lstLocation" onchange="OnSearch()" />
								        </td>
								        <td width="7%" style="white-space:nowrap">
								            <a href="#" onclick="OnGetBus('control');">Company Name</a>
								        </td>
								        <td style="width:14%">
											<gw:textbox id="txtCompanyName" styles="width:100%;" onenterkey="OnSearch()"  />
								        </td>
										<td style="white-sapce:nowrap;padding-left:5px;padding-right:5px;">Total:</td>
										<td style="width:20%" align="left">
								            <gw:label id="lblRecord" styles="color: blue; width: 100%"></gw:label>
								        </td>
								        <td width="3%">
									        <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
								        </td>
								        <td style="width:3%">
											<gw:imgbtn img="save" alt="Save" id="btnUpdate" onclick="OnSave()" style="display:none" />  
								        </td>
								        <td style="width:3%">
								            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport();" styles='width:100%;display:none'/>
								        </td> 
							        </tr>
						        </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style=" height: 98%">
                         <td style="width:100%">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 98%">
                                    <td>
                                        <gw:grid id='grdInvoices' 
											header='_PK|Invoice ID|Location|Invoice Date|Guest Name|_Company Pk|Company Name|Total DUE|Total|SV Rate|SV AMT|DC Rate|DC AMT|VAT Rate|VAT AMT|Staff|_Pay Method'
                                            format  ='0|0|0|4|0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|0|0'
                                            aligns  ='1|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                            editcol ='0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0'
                                            defaults='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                            widths	='1200|1400|2000|1200|2000|0|4000|1500|1200|1200|1200|1200|1200|1200|1200|1500|1500'
											sorting='T' styles='width:100%;height:100%' 
											oncelldblclick="grid_OnDouble();"
										/>
                                    </td>
                                </tr>  
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
