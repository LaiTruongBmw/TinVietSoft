<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title> Closing Entry </title>
  </head>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <script>
 
function BodyInit()
{
	System.Translate(document);
    BindingDataList();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}

function BindingDataList()
{ 
	var ls_data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
	formatGrid();
	txtDEP_PK.text = "<%= Session("DEPT_PK")%>";
	ibtnProcess.SetEnable(false);
	ibtnCancel.SetEnable(false);
	if(txtDEP_PK.text=="")
	{
		alert("This user is not in any department");
	}
}


function formatGrid()
{
	var fg = grdClosingEntry.GetGridControl();
	if(grdClosingEntry.rows <2)
	{
		grdClosingEntry.AddRow();
	}
	fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; //Format all col merge : Font = Bold 
	fg.FixedRows = 2;
	fg.MergeCells =5;
	fg.MergeRow(0) = true;
	fg.MergeCol(0) = true;
	fg.Cell(0,0,0,1,0) = "Seq";
	fg.MergeCol(1) = true;
	fg.Cell(0,0,1,1,1) = "Voucher No";
	fg.MergeCol(2) = true;
	fg.Cell(0,0,2,1,2) = "Trans Date";
	fg.Cell(0,0,3,0,4) = "Trans Group";
	fg.Cell(0,1,3,1,3) = "Code";
	fg.Cell(0,1,4,1,4) = "Name";
	fg.Cell(0,0,5,0,6) = "Account";
	fg.Cell(0,1,5,1,5) = "Debit";
	fg.Cell(0,1,6,1,6) = "Credit";
	fg.MergeCol(7) = true;
	fg.Cell(0,0,7,1,7) = "Amount";
	fg.ColWidth(0) = "800";//Seq
	fg.ColWidth(1) = "1200";//Voucher No
	fg.ColWidth(2) = "1200";//Trans Date
	fg.ColWidth(3) = "1200";//Trans Code
	fg.ColWidth(4) = "2500";//Trans Name
	fg.ColWidth(5) = "3000";//Account Debit
	fg.ColWidth(6) = "3000";//Account Credit
	fg.ColWidth(7) = "2000";//Amount
	fg.ColAlignment(7) = flexAlignRightCenter;
}
function OnDataReceive(objID)
{dso_getCompany
	if (objID.id == "dso_getCompany")
	{
		onSearch();
	}
	if (objID.id == "datClosingEntry")
	{
		formatGrid();
		if(grdClosingEntry.rows >2)
		{
			ibtnProcess.SetEnable(false);
			ibtnCancel.SetEnable(true);
		}
		else
		{
			ibtnProcess.SetEnable(true);
			ibtnCancel.SetEnable(false);
		}
		return;
	}
	//datClosingEntry.Call('SELECT');
}
function OnDataError(objID)
{
    if (objID.id == "datClosingEntry")
	{
		alert("Fail to get data!");
		return;
	}
	if (objID.id == "datCancelClosing")
	{
		alert("Fail to cancel!");
		return;
	}
	if (objID.id == "datProcessClosing")
	{
		alert("Fail to process data!");
		return;
	}
	
}

function onSearch()
{
	datClosingEntry.Call('SELECT');
}

function onCancel()
{
	datCancelClosing.Call('');
}
function onProcess()
{
	datProcessClosing.Call('');
}

function onGridDbClick()
{
	var rows =0;
	var rownum =0;
	var colnum =0;
	var pk = 0;
	var status = "";
	var ls_arr = ""; 

	var ctrl = grdClosingEntry.GetGridControl();
	rows = ctrl.Rows;
	rows = rows - 2;
	rownum = ctrl.row-1;
	pk = grdClosingEntry.GetGridData(ctrl.row, 0);

	for (i = 2; i < grdClosingEntry.rows; i++)
	{
		ls_arr = ls_arr + ' ' + grdClosingEntry.GetGridData(i, 0);
	} 

	if (rownum > 0) 
	{
		var fpath = System.RootURL + '/standard/forms/gf/hg/gfhg00020_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
		var wWidth = 950;
		var wHeight = 600;
		var x = Math.round((screen.availWidth - wWidth)/2);
		var y = Math.round((screen.availHeight - wHeight)/2);

		var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
		var object = System.OpenModal(fpath, wWidth, wHeight, features);
	}
}

</script>
<body style="margin:0; padding:0;">
<gw:data id="datClosingEntry" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
	<xml>
	<dso type="grid" function="AC_SEL_60070030_ENTRY_CN">
		<input bind="grdClosingEntry">
		<input bind="lstCompany"/>
		<input bind="dtb_MM"/>
		<input bind="rdoSlipStatus"/>
		</input>
		<output bind="grdClosingEntry"/>
	</dso>
	</xml>
</gw:data> 

<gw:data id="datCancelClosing" onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
	<xml> 
		<dso id="1" type="process"  parameter="0" procedure="AC_Pro_60070030_Cancel_CN" > 
			<input >
			<input bind="dtb_MM" />
			<input bind="lstCompany" />
			<input bind="txtDEP_PK" />
			<input bind="rdoSlipStatus" />
			</input>
			<output>
				<output bind="txtRtn1" /> 
				<output bind="txtRtn2" /> 
			</output>
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="datProcessClosing" onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
	<xml> 
		<dso id="1" type="process" parameter="0" procedure="ac_Pro_60070030_Entrys_CN" > 
			<input >
			<input bind="dtb_MM" />
			<input bind="lstCompany" />
			<input bind="txtDEP_PK" />
			<input bind="rdoSlipStatus" />
			</input>
			<output>
				<output bind="txtRtn1" /> 
				<output bind="txtRtn2" /> 
			</output>
		</dso> 
	</xml> 
</gw:data> 
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_sel_60020030_en" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
 <table border="0" style='width:100%;height:100%' cellpadding='0' cellspacing='0'>
	<tr style='height:2%'>
		<td>
            <fieldset style='padding:0'>
			<table border="0"  width="100%" cellpadding='1' cellspacing='1'>
				<tr>
				<td align="right" width="10%">Company</td>
				<td  width="27%">
					<gw:list id="lstCompany"  onchange="onSearch()" ></gw:list >
				</td>
				<td align="right"  width="8%">Month</td>
				<td width="11%">
					<gw:datebox id="dtb_MM" mode="01" onchange="onSearch()" type="month" />
				</td>
				<td align="right"  width="10%">Slip Status</td>
				<td width="24%">
				<gw:radio id="rdoSlipStatus" value="2"  onchange="onSearch()"> 
					<span value="2" >Confirmed</span>
					
				</gw:radio >
				</td>
	<td width="2%"><gw:button id="ibtnSearch" img="search" alt="Search" onclick="onSearch()" /></td>
	<td width="2%"><gw:button id="ibtnProcess" img="process" alt="Process" onclick="onProcess()" /></td>
	<td width="2%"><gw:button id="ibtnCancel" img="cancel" alt="Cancel" onclick="onCancel()" /></td>
	<td width="4%"></td>
				</tr>
			</table>
            </fieldset>
		</td>
	</tr>
	<tr style='height:98%'>
		<td>
			<gw:grid id='grdClosingEntry'
			header='SEQ|VOUCHER_NO|TRANS_DATE|TR_TYPE_CD|TR_TYPE_NM|AC_DB|AC_CB|DUAL'
			format='0|0|0|0|0|0|0|0'
			aligns='0|0|0|0|0|0|0|0'
			defaults='|||||||'
			editcol='0|0|0|0|0|0|0|0'
			widths='1000|1000|1000|1000|1000|1000|1000|1000'
			sorting='F'
			oncelldblclick="onGridDbClick()" 
			styles='width:100%; height:100%'
/>
		</td>
	</tr>
 </table>
 <gw:textbox id="txtDEP_PK" styles='display:none'/>
 <gw:textbox id="txtRtn1" styles='display:none'/>
  <gw:textbox id="txtProposedByUserPk" styles='display:none'/>
 
 <gw:textbox id="txtRtn2" styles='display:none'/>
 </body>
 </html>