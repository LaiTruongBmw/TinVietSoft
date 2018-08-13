<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Check In</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

var COL_PK=0,
	COL_THT_ROOM_ALLOCATE_PK=1,
	COL_Guest_Name=2,
	COL_Room=3,
	COL_Date=4,
	COL_Advance_Amt_USD=5,
	COL_Ex_Rate=6,
	COL_Advance_Amt_VND=7,
	COL_Payment_Method=8,
	Col_credit_type=9,
	Remark=10;
function BodyInit()
{
	var data="";
	txt_THT_ROOM_ALLOCATE_PK.text = '<%=Request.QueryString("p_room_allocate_pk") %>'; 
	txtRoom.text = '<%=Request.QueryString("p_room_no") %>';
	txtGuestName.text = '<%=Request.QueryString("p_guest_name") %>';
	txtEXRate.text = "<%=CtlLib.SetDataSQL("SELECT sf_get_current_buy_ex_rate("+ Session("COMPANY_PK") +",'USD') from dual")%>"; 
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code,NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='PTYPE' and code in('PTYPE-01','PTYPE-02','PTYPE-04')")%>";
	
	grdMST.SetComboFormat(COL_Payment_Method, data);//payment method
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code,NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CREDITCARD'" )%>";
	grdMST.SetComboFormat(Col_credit_type, data); //Credit Type 
	OnSearch();
}

function OnSearch()
{
	dso_htfo00010_advance.Call('SELECT');
}

function OnAddNew()
{
	grdMST.AddRow();
	grdMST.SetGridText(grdMST.rows-1, COL_THT_ROOM_ALLOCATE_PK,txt_THT_ROOM_ALLOCATE_PK.text);
	grdMST.SetGridText(grdMST.rows-1, COL_Guest_Name,txtGuestName.text);
	grdMST.SetGridText(grdMST.rows-1, COL_Room,txtRoom.text);
	grdMST.SetGridText(grdMST.rows-1, COL_Ex_Rate,txtEXRate.text);
}

function OnRemoveRow()
{
	if (grdMST.row > 0)
	{
		if (grdMST.GetGridData(grdMST.row, 0) == '')
		{
			grdMST.RemoveRow();
		}
		else
		{
			if (confirm("Are you sure delete data?"))
			{
				grdMST.DeleteRow();
				dso_htfo00010_advance.Call();
			}
		}
	}
}

function OnSave()
{
	if(CheckValidate())
    {
       dso_htfo00010_advance.Call(); 
    }
}
function CheckValidate()
{
    for(var i=1;i<grdMST.rows;i++)
          {
            if(grdMST.GetGridData(i,COL_Guest_Name) == "")
             {
                alert("Please input guest name at row "+ i);       
                return false;
             }
             if(grdMST.GetGridData(i,COL_Advance_Amt_USD) == "" && grdMST.GetGridData(i,COL_Advance_Amt_VND) == "")
             {
                alert("Please input advance amount usd or amount vnd at row "+ i);
                return false;
             }
			 if(grdMST.GetGridData(i,COL_Payment_Method) == "")
             {
                alert("Please input Payment Method at row "+ i);
                return false;
             }
			   if((grdMST.GetGridData(i,COL_Payment_Method) == "PTYPE-02")&&(grdMST.GetGridData(i,Col_credit_type) == ""))
			 {
					alert("Please input Credit type at row "+ i);
					return false;
			 }
			  
          }
          return true;
}

function OnDataReceive(obj)
{
	if(obj.id=='dso_htfo00010_advance')
	{
		 if(grdMST.rows > 1)
			{
				//grdMST.GetGridControl().row = 1;
			}
	}
	
}
function OnChangeDepositUSD_VND()
{
	if(event.col==5)
	{
		var amt_deposit_vnd="";
		amt_deposit_vnd=Math.round(Number(grdMST.GetGridData(grdMST.row, 5))*Number(txtEXRate.text));
		grdMST.SetGridText(grdMST.row, 7,amt_deposit_vnd);//room_pk
	}
	if(event.col==7)
	{
		var amt_deposit_usd="";
		amt_deposit_usd=Math.round(Number(grdMST.GetGridData(grdMST.row, 7))/Number(txtEXRate.text));
		grdMST.SetGridText(grdMST.row, 5,amt_deposit_usd);//room_pk
	}
}
function OnReport()
{
	 if(grdMST.row !='-1')
	 {
		//var url = '/reports/ht/fo/rpt_htfo00010_advance.aspx?p_pk='+ grdMST.GetGridData(grdMST.row, 0);
			//System.OpenTargetPage( System.RootURL+url , "newform" );
			
	    var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/htfo00010_advance.rpt&procedure=sp_rpt_htfo00010_advance&parameter="+
	   grdMST.GetGridData(grdMST.row, 0);
		//alert(url);
	    System.OpenTargetPage(url); 
		var caller = dialogArguments;
		 
		 caller.OnPrintAdvance(url);	
	 }
	 else
	 {
		alert("Please,choose guest name to print.");
	 }
}
</script>
<body>
<gw:data id="dso_htfo00010_advance" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="ht_sel_60240010_advance" procedure="ht_upd_60240010_advance">
			<input bind="grdMST">
				<input bind="txt_THT_ROOM_ALLOCATE_PK" />
			</input> 
			<output bind="grdMST" /> 
		</dso> 
	</xml> 
</gw:data>
<table style="height: 100%; width: 100%; background: #BDE9FF" border="0">
	<tr style="width: 100%; height: 1%">
		<td style="width: 100%; background: white" valign="top" >			
			<table style="width: 100%" border="0">
				<tr >
					<td style="width: 5%" align="right" nowrap >Room</td>
					<td style="width: 15%" >
						<gw:textbox id="txtRoom" styles="width: 100%" onenterkey="" readonly="true" />
					</td>
					<td style="width: 16%" align="right">Guest Name :</td>
					<td style="width: 35%" >
						<gw:textbox id="txtGuestName" styles="width: 100%" readonly="true" onenterkey="" />
					</td>
					<td style="width: 11%" align="right">
						Ex.Rate
					</td>
					<td style="width: 15%" >
						<gw:textbox id="txtEXRate" styles="width: 100%" type="number" format="###,###,###" readonly="true" />
					</td>
					<td style="width: 3%" >
						<gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
					</td>
					<td style="width: 3%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew()" />
                    </td>
                    <td style="width: 3%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnRemoveRow()" />
                    </td>
					<td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                    </td>
					 <td width="5%" align="right">
                            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" />
                        </td>
				</tr>
			</table>
		</td>
	</tr>
	<tr style="width: 100%; height: 30%; background: white">
		<td style="width: 100%">
			<gw:grid id="grdMST" 
			header="_PK|_THT_ROOM_ALLOCATE_PK|Guest Name|Room|Date|Advance Amt(USD)|Ex.Rate|Advance Amt(VND)|Payment Method|credit Type|Remark" 
			format="0|0|0|0|4|-1|-0|-0|0|0" 
			aligns="0|0|0|0|0|0|0|0|0|0" 
			defaults="|||||||||" 
			editcol="0|0|1|0|1|1|0|1|1|1" 
			widths="0|0|0|0|0|0|0|0|0|0" 
			styles="width:100%;height:100%"
			autosize='T'
			debug='false'
			 onafteredit="OnChangeDepositUSD_VND()" />
		</td>
	</tr>
</table>
<gw:textbox id="txt_THT_ROOM_ALLOCATE_PK" style="display: none" />
</body>
<!--------------------------------------------------------------------------------------->
</html>
