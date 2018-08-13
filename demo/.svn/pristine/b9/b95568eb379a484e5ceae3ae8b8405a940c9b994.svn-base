<!-- #include file="../../../../system/lib/form.inc"  -->
  <head>
    <title>Advance For Employee Inquiry</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <script>
var flag=0; 
var bAdd=false;
function BodyInit()
{
	//System.Translate(document); 
    BindingDataList();
    datGetAccountInfo.Call();
}

//--------------------------------
function BindingDataList()
{

    var comp_pk     =   "<%=Request.querystring("comp_pk")%>";
    var from_date   =   "<%=Request.querystring("from_date")%>";
    var to_date     =   "<%=Request.querystring("to_date")%>";
    var acc_pk      =   "<%=Request.querystring("acc_pk")%>";
    var acc_cd      =   "<%=Request.querystring("acc_cd")%>";
    var acc_nm      =   "<%=Request.querystring("acc_nm")%>";
    var emp_pk     =   "<%=Request.querystring("emp_pk")%>";
    var emp_id     =   "<%=Request.querystring("emp_id")%>";
    var emp_nm     =   "<%=Request.querystring("emp_nm")%>";
    var status      =   "<%=Request.querystring("status")%>";    
    var ccy         =   "<%=Request.querystring("ccy")%>";

	var ls_data1 = "<%= CtlLib.SetListDataSQL(" select pk,PARTNER_NAME from tco_company where del_if = 0") %>";
	var ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT 'ALL' C1,'<All>' C2 FROM DUAL UNION ALL SELECT C1,C2 FROM ( SELECT TRIM(A.CODE) C1, A.CODE C2 FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY NUM_VALUE1)")%>";
	var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";	
	lstBookCcy.SetDataText(ls_bookccy);   
	lstCompany.SetDataText(ls_data1);
	lstCurrency.SetDataText(ls_data2); 
	
	
	txtCode_PK.SetEnable(false);
	txtCode_CD.SetEnable(false);
	txtCode_NM.SetEnable(false);
	txtEmp_PK.SetEnable(false);
	txtEmp_ID.SetEnable(false);
	txtEmp_NM.SetEnable(false);
	
	dtbFromDate.value =""+from_date;
	dtbToDate.value = ""+to_date;
	rdoSlipStatus.value = ""+ status;
	lstCompany.value = ""+comp_pk;
	
	txtCode_PK.text = ""+acc_pk;
	txtCode_CD.text = ""+acc_cd;
	txtCode_NM.text = ""+acc_nm;
	txtEmp_PK.text = ""+emp_pk;
	txtEmp_ID.text = ""+emp_id;
	txtEmp_NM.text = ""+emp_nm;
	
	grdSLControl.GetGridControl().FrozenCols = 1;
	lstCurrency.value = ccy;
	formatGridDetail();
	//MergeGridColumn();
	FormatSumGrid() ;
	
}
function OnDataReceive(obj)
{
   if(obj.id=="datGetAccountInfo")
   {
       datGetEmployeeInfo.Call();
   }
   
   if(obj.id=="datGetEmployeeInfo")
   {
        OnSearch();
   }

	if(obj.id=="datSLSum")
	{
		FormatSumGrid();
		grdSLControl.ClearData();
		datSLControlItem.Call('SELECT');
	}
}

function formatGridDetail()
{
	var fg = grdSLControl.GetGridControl();
	if (rdoAmountType.value=="1")//Trans
    {
		   fg.ColWidth(7)=2000;//Trans Debit
		   fg.ColWidth(8)=2000;//Trans Credit
		   fg.ColWidth(9)=0;//Book Debit
		   fg.ColWidth(10)=0;//Book Credit
    }
    else //Book & Trans
    {
           fg.ColWidth(7)=2000;//Trans Debit
		   fg.ColWidth(8)=2000;//Trans Credit
		   fg.ColWidth(9)=2000;//Book Debit
		   fg.ColWidth(10)=2000;//Book Credit
    } 
	fg.ColFormat(7)   = "#,###,###,###,###,###.##R";	
	fg.ColFormat(8)   = "#,###,###,###,###,###.##R";	
	if(lstBookCcy.GetData() != "VND")
	{
		fg.ColFormat(9)   = "#,###,###,###,###,###.##R";	
		fg.ColFormat(10)   = "#,###,###,###,###,###.##R";			
	}
	else
	{
		fg.ColFormat(9)   = "#,###,###,###,###,###,###,###R";			
		fg.ColFormat(10)   = "#,###,###,###,###,###,###,###R";	
	}
	
	fg.ColAlignment(7) = flexAlignRightCenter;
	fg.ColAlignment(8) = flexAlignRightCenter;
	fg.ColAlignment(9) = flexAlignRightCenter;
	fg.ColAlignment(10) = flexAlignRightCenter;
}
function onChangeFormat()
{
	var fg = grdSLControl.GetGridControl();
	if (rdoAmountType.value=="1")//Trans
    {
		   fg.ColWidth(7)=2000;//Trans Debit
		   fg.ColWidth(8)=2000;//Trans Credit
		   fg.ColWidth(9)=0;//Book Debit
		   fg.ColWidth(10)=0;//Book Credit
    }
    else //Book & Trans
    {
           fg.ColWidth(7)=2000;//Trans Debit
		   fg.ColWidth(8)=2000;//Trans Credit
		   fg.ColWidth(9)=2000;//Book Debit
		   fg.ColWidth(10)=2000;//Book Credit
    } 
	FormatSumGrid();
}

function FormatSumGrid()
{
     if(grdSLSum.rows <2)
       {
            grdSLSum.AddRow();
       } 
        var fg=grdSLSum.GetGridControl();
		
        fg.FixedRows = 2;
		fg.MergeRow(0) = true;
        fg.MergeCells = 3;
		fg.MergeCol(0) = true;
		fg.Cell(0, 0, 0, 1, 0) = "Opening Balance";
		
		
		fg.MergeCol(1) = true;
		fg.Cell(0, 0, 1, 1, 1) = "Ccy";
		
		fg.Cell(0, 0, 2, 0, 3) = "Trans";  
		fg.Cell(0, 0, 4, 0, 5) = "Books";
		
		fg.Cell(0, 1, 2, 1) = "Debit";
		fg.Cell(0, 1, 3, 1) = "Credit";
		
		fg.Cell(0, 1, 4, 1) = "Debit";
		fg.Cell(0, 1, 5, 1) = "Credit";
		
		fg.MergeCol(6) = true;
		
		if(rdoSlipStatus.value== "2"){
			fg.Cell(0, 0, 6, 1, 6) = "CFM Balance";
		}
		if (rdoSlipStatus.value== "0"){
			fg.Cell(0, 0, 6, 1, 6) = "APP Balance";
		}
		if (rdoSlipStatus.value== "4"){
			fg.Cell(0, 0, 6, 1, 6) = "NAPP Balance";
		}
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(0)=2300;
		fg.ColWidth(1)=2000;
		
		fg.ColWidth(6)=2000;
		var AmountType = rdoAmountType.GetData();
		if (AmountType == '1') // Trans
		{
			fg.ColWidth(2)=3000;
			fg.ColWidth(3)=3000;
			fg.ColWidth(4)=0;
			fg.ColWidth(5)=0;
		} else // Trans & Books
		{
			fg.ColWidth(2)=2000;
			fg.ColWidth(3)=2000;
			fg.ColWidth(4)=2000;
			fg.ColWidth(5)=2000;
		}
		if (lstBookCcy.value=="VND")
		{
		    fg.ColFormat(0) = "#,###,###,###,###";
		    fg.ColFormat(4) = "#,###,###,###,###";
		    fg.ColFormat(5) = "#,###,###,###,###";
		    fg.ColFormat(6) = "#,###,###,###,###";
		}
		else
		{
		    fg.ColFormat(0) = "#,###,###,###,###.##";
		    fg.ColFormat(4) = "#,###,###,###,###.##";
		    fg.ColFormat(5) = "#,###,###,###,###.##";
		    fg.ColFormat(6) = "#,###,###,###,###.##";		    
		}
		
		fg.ColFormat(2) = "#,###,###,###,###.##";
		fg.ColFormat(3) = "#,###,###,###,###.##";
	
		
		fg.ColAlignment(0) = flexAlignRightCenter;
		fg.ColAlignment(2) = flexAlignRightCenter;
		fg.ColAlignment(3) = flexAlignRightCenter;
		fg.ColAlignment(4) = flexAlignRightCenter;
		fg.ColAlignment(5) = flexAlignRightCenter;
		fg.ColAlignment(6) = flexAlignRightCenter;
		
}


function MergeGridColumn()
{
	grdSLControl.GetGridControl().MergeCells  = 1 ;	
	grdSLControl.GetGridControl().MergeCol(0) = true ; 
	grdSLControl.GetGridControl().MergeCol(1) = true ; 
	grdSLControl.GetGridControl().MergeCol(2) = true ; 
	grdSLControl.GetGridControl().MergeCol(3) = true ; 
	grdSLControl.GetGridControl().MergeCol(4) = true ; 
	grdSLControl.GetGridControl().MergeCol(5) = true ; 
	grdSLControl.GetGridControl().MergeCol(6) = true ; 
	grdSLControl.GetGridControl().MergeCol(7) = true ; 
	grdSLControl.GetGridControl().MergeCol(8) = true ; 
	grdSLControl.GetGridControl().MergeCol(9) = true ; 
	grdSLControl.GetGridControl().MergeCol(10) = true ; 
	grdSLControl.GetGridControl().MergeCol(11) = true ; 
	grdSLControl.GetGridControl().MergeCol(12) = true ; 

}
//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
    if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//------------------------------------------------
function OnCloseClick()
{
	window.returnValue = null; 
	window.close();
}
function onChangeCompany()
{
	grdSLControl.ClearData();
	grdTotal.ClearData();
	formatGridDetail(); 
	onResetAcc();
	onResetEmployee();
}

function OnSearch()
{
	grdSLSum.ClearData();
	FormatSumGrid();
	datSLSum.Call('SELECT');
}

function OnDataError(objid)
{
    alert("Error at "+objid.id+"---"+objid.errmsg);
}
</script>

<body>
<!---------------------------------------------------------->

<gw:data id="datGetAccountInfo" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
	<xml> 
		<dso type="process" parameter="0,1,2,3"   procedure = "ac_sel_60080100_popup_3" > 
			<input >
				<input bind="lstCompany" /> 
				<input bind="txtCode_PK" />
				<input bind="txtCode_CD" /> 
				<input bind="txtObj_Type1" /> 
			</input>
			<output>
				<output bind="txtCode_PK" />
				<output bind="txtCode_CD" />
				<output bind="txtCode_NM" /> 
			</output>
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="datGetEmployeeInfo" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
	<xml> 
		<dso type="process"  parameter="0,1,2,3"   procedure = "ac_sel_60080100_popup_3" > 
			<input >
				<input bind="lstCompany" /> 
				<input bind="txtEmp_PK" />
				<input bind="txtEmp_ID" /> 
				<input bind="txtObj_Type2" /> 
			</input>
			<output>
				<output bind="txtEmp_PK" />
				<output bind="txtEmp_ID" />
				<output bind="txtEmp_NM" /> 
			</output>
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="datSLControlItem" onreceive="OnDataReceive(this)"  onerror="OnDataError(this)"> 
        <xml> 
            <dso type="grid" user="acnt"  function="ac_sel_60080100_adv_inq_detail" > 
                <input bind="grdSLControl" >
                    <input bind="lstCompany" />
					<input bind="dtbFromDate" />
					<input bind="dtbToDate" />
					<input bind="txtCode_PK" />
					<input bind="txtEmp_PK" />
					<input bind="rdoSlipStatus" />
					<input bind="lstCurrency" />
                </input>
                <output  bind="grdSLControl" />
            </dso> 
        </xml> 
</gw:data> 

<gw:data id="datSLSum" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="ac_SEL_60080100_ADVEMP_INQ_SUM">
                <input bind="grdSLSum">
                    <input bind="lstCompany" />
					<input bind="dtbFromDate" />
					<input bind="dtbToDate" />
					<input bind="txtCode_PK" />
					<input bind="txtEmp_PK" />
					<input bind="rdoSlipStatus" />
					<input bind="lstCurrency" />
                </input>
                <output bind="grdSLSum"/>
            </dso>
        </xml>
    </gw:data> 
<!-- MainTable -->
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td width="13%"></td>
		<td width="13%"> </td>
		<td width="3%"> </td>
		<td width="13%"> </td>
		
		<td width="13%"></td>
		<td width="13%"> </td>
		<td width="22%"></td>
		
		<td width="10%"></td>
	</tr>
	<tr valign="top">
		<td align="right">Company</td>
		<td colspan="3"><gw:list id="lstCompany" styles="width:97%;" onchange="onChangeCompany()"></gw:list></td>
		<td align="right" valign="middle">Account Code&nbsp;&nbsp;</td>
		<td><gw:textbox id="txtCode_CD"  styles='width:100%'  /></td>
		<td ><gw:textbox id="txtCode_NM"  styles='width:100%'  /></td>
		<td></td>
	</tr>	
	<tr>
		<td align="right">Proposed Date</td>
		<td><gw:datebox id="dtbFromDate" lang="<%=Application("Lang")%>" mode="01" styles="width:100%;" /></td>
	    <td align="center">~</td>
	    <td><gw:datebox id="dtbToDate" lang="<%=Application("Lang")%>" mode="01" styles="width:100%;" /></td>
		<td align="right"  valign="middle">Employee Name&nbsp;&nbsp;</td>
		<td><gw:textbox id="txtEmp_ID"  styles='width:100%'  /></td>
		<td ><gw:textbox id="txtEmp_NM"  styles='width:100%'  /></td>
		<td ><gw:icon id="idBtnSearch" img="in" text="Search"  onclick="OnSearch()" /></td>
	</tr>
	<tr>
		<td align="right">Slip Status</td>
		<td colspan="3">
			<gw:radio id="rdoSlipStatus" value="2" onchange="OnSearch()"> 
				<span value="2">Confirmed</span>
				<span value="0">Approved</span>
			</gw:radio>
		</td>
		<td align="right">Amount Type</td>
		<td colspan="2">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="55%">
						<gw:radio id="rdoAmountType" value="1" onchange="onChangeFormat()"> 
				            <span value="1" > Trans</span>
				            <span value="2" >Trans & Books</span>
				        </gw:radio >
					</td>
					<td width="20%" align="right">Currency</td>
					<td width="25%"><gw:list id="lstCurrency" styles="width:100%;" ></gw:list></td>
				</tr>
			</table>
		</td>
		<td></td>
	</tr>
	<tr>
		<td colspan="8">
		<gw:grid id='grdSLControl'
header='Seq|Voucher No|Proposed Date|Employee ID|Employee Name|Proposed By|Ccy|Trans Debit|Trans Credit|Book Debit|Book Credit|Description|Local Description|_TR_DATE'
format='0|0|4|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
defaults='|||||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
widths='1000|1800|1500|1500|2000|1500|800|1000|1000|1000|1000|2000|2000|1000'
sorting='T'
styles='width:100%; height:280;'
/>
		</td>
	</tr>
	<tr>
		<td colspan="8">
<gw:grid id='grdSLSum'      header='CCY|OPENINGBALANCE|DEBITTRANSAMOUNT|DEBITBOOKAMOUNT|CREDITTRANSAMOUNT|CREDITBOOKAMOUNT|CLOSINGBALANCE'
        format='0|1|1|1|1|1|1'
        aligns='1|1|2|2|2|2|2'
        defaults='||||||'
        editcol='0|0|0|0|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000'
        sorting='T'
        styles='width:100%; height:80;'
        />
		</td>
	</tr>
</table>
	<gw:textbox id="txtCode_PK"  styles="display:none"  />
	<gw:textbox id="txtEmp_PK"  styles="display:"  />
	<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
	<gw:textbox id="txtObj_Type1"  styles="display:none"  text="ACCOUNT_CODE" />
	<gw:textbox id="txtObj_Type2"  styles="display:none"  text="EMPLOYEE"  />
</body>
</html>
