<!-- #include file="../../../../system/lib/form.inc"  -->
  <head>
    <title>SL For Control Item</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <script>
var flag=0; 
var bAdd=false;
function BodyInit()
{
	System.Translate(document); 
    BindingDataList();
	txtUser_Pk.text = "<%=Session("USER_PK")%>";
   dso_getCompany.Call();
}

//--------------------------------
function BindingDataList()
{
	var ls_data1 = "<%= CtlLib.SetListDataSQL(" select pk,PARTNER_NAME from tco_company where del_if = 0") %>";
	var ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT 'ALL' C1,'<All>' C2 FROM DUAL UNION ALL SELECT C1,C2 FROM ( SELECT TRIM(A.CODE) C1, A.CODE C2 FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY NUM_VALUE1)")%>";
	var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
	lstBookCcy.SetDataText(ls_bookccy);   
	lstCompany.SetDataText(ls_data1);
	lstCompany.value="<%=session("company_pk") %>";
	lstCurrency.SetDataText(ls_data2); 
	txtCode_PK.SetEnable(false);
	txtCode_CD.SetEnable(false);
	txtCode_NM.SetEnable(false);
	txtItem_PK.SetEnable(false);
	txtItem_CD.SetEnable(false);
	txtItem_NM.SetEnable(false);
	lstReportType.SetDataText("DATA|2|Advance");
	var myDate=new Date();
	var fDate =""+myDate.getFullYear();
	if (myDate.getMonth()<9)
	{
		fDate=fDate+"0"+(myDate.getMonth()+1);
	}
	else
	{
		fDate=fDate+(myDate.getMonth()+1);
	}
	fDate=fDate+"01";
	dtbFromDate.SetDataText(fDate);
	txtEmp_ID.SetEnable(false);
	txtEmp_NM.SetEnable(false);
	grdSLControl.GetGridControl().FrozenCols = 1;
	formatGridDetail();
	//MergeGridColumn();
	FormatSumGrid() ;
	
}
function OnDataReceive(obj)
{
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
		   fg.ColWidth(8)=2000;//Trans Debit
		   fg.ColWidth(9)=2000;//Trans Credit
		   fg.ColWidth(10)=0;//Book Debit
		   fg.ColWidth(11)=0;//Book Credit
    }
    else //Book & Trans
    {
           fg.ColWidth(8)=2000;//Trans Debit
		   fg.ColWidth(9)=2000;//Trans Credit
		   fg.ColWidth(10)=2000;//Book Debit
		   fg.ColWidth(11)=2000;//Book Credit
    } 
	fg.ColFormat(8)   = "#,###,###,###,###,###.##";	
	fg.ColFormat(9)   = "#,###,###,###,###,###.##";	
	if(lstBookCcy.GetData() != "VND")
	{
		fg.ColFormat(10)   = "#,###,###,###.##";	
		fg.ColFormat(11)   = "#,###,###,###.##";			
	}
	else
	{
		fg.ColFormat(10)   = "#,###,###,###,###,###";			
		fg.ColFormat(11)   = "#,###,###,###,###,###";	
	}
	fg.ColAlignment(8) = flexAlignRightCenter;
	fg.ColAlignment(9) = flexAlignRightCenter;
	fg.ColAlignment(10) = flexAlignRightCenter;
	fg.ColAlignment(11) = flexAlignRightCenter;
}
function onChangeFormat()
{
	var fg = grdSLControl.GetGridControl();
	if (rdoAmountType.value=="1")//Trans
    {
		   fg.ColWidth(8)=2000;//Trans Debit
		   fg.ColWidth(9)=2000;//Trans Credit
		   fg.ColWidth(10)=0;//Book Debit
		   fg.ColWidth(11)=0;//Book Credit
    }
    else //Book & Trans
    {
           fg.ColWidth(8)=2000;//Trans Debit
		   fg.ColWidth(9)=2000;//Trans Credit
		   fg.ColWidth(10)=2000;//Book Debit
		   fg.ColWidth(11)=2000;//Book Credit
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
		fg.ColWidth(7)=0;
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
	onResetItem();
	onResetEmployee();
}

function onResetAccount()
{
	txtCode_PK.text = "";
	txtCode_CD.text = "";
	txtCode_NM.text = "";
}

function onResetItem()
{
	txtItem_PK.text = "";
	txtItem_CD.text = "";
	txtItem_NM.text = "";
}

function onGetAccount()
{
	var fpath = System.RootURL + "/standard/forms/gf/co/ffco001000.aspx?col_nm=Account Name&col_code=Account Code&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + txtItem_CD.text + "&val2=" + '' + "&val3=" + '' + "&dsqlid=ac_SEL_SLITEM_ACC";
	var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
	if (aValue != null)
	{
		if (aValue[0]!="0")
		{
			txtCode_PK.text = aValue[2];
			txtCode_CD.text = aValue[0];
			txtCode_NM.text = aValue[1];
		}
		else
		{
			txtCode_PK.text = "";
			txtCode_CD.text = "";
			txtCode_NM.text = "";
		}
	}
	else
	{
		txtCode_PK.text = "";
		txtCode_CD.text = "";
		txtCode_NM.text = "";
	}
}

function onGetItem()
{	
	var fpath = System.RootURL + "/standard/forms/gf/co/ffco001000.aspx?col_nm=Item Local Alias&col_code=Item Alias&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + '' + "&val2=" + '' + "&val3=" + '' + "&dsqlid=ac_SEL_SLITEM_ITEM";
	var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
	if (aValue != null)
	{
		if (aValue[0]!="")
		{
			txtItem_PK.text = aValue[2];
			txtItem_CD.text = aValue[0];
			txtItem_NM.text = aValue[1];
			//onGetAccount();
		}
		else
		{
			txtItem_PK.text = "";
			txtItem_CD.text = "";
			txtItem_NM.text = "";
		}
	}
	else
	{
		txtItem_PK.text = "";
		txtItem_CD.text = "";
		txtItem_NM.text = "";
	}
}
function OnSearch()
{
	if((txtCode_PK.text=="")&&(txtItem_CD.text==""))
	{
		alert("Please choose account or Control Item!");
		return;
	}
	grdSLControl.ClearData();
    grdSLControl.GridRefresh();	
	datSLSum.Call('SELECT');
}

function OnReport()
{
        if (lstReportType.value=="2")
        {
	        rqt = "?company_pk="+lstCompany.value+'&emp_pk=&from_date='+dtbFromDate.value+'&to_date='+dtbToDate.value+'&status='+rdoSlipStatus.value+'&acc_pk=&Trans=TRANS&BookCCy='+lstBookCcy.value;
		    url =System.RootURL + '/standard/reports/gf/ka/gfka00150_tonghop.aspx'+rqt;              
		    if(confirm("Are you sure you want to report ?" ))
		    {
			    System.OpenTargetPage( url , 'newform' );
			    return;
		    }
		}
		else
		{
		    if (txtEmp_PK.text=="")
		    {
		        alert("Please select a employee");
		       return; 
		    }
		    if(lstCurrency.value=="ALL")
		    {
		        alert("Please select currency!");
		       return; 
		    }
		    rqt = "?company_pk="+lstCompany.value+'&emp_pk='+txtEmp_PK.text+'&from_date='+dtbFromDate.value+'&to_date='+dtbToDate.value+'&status='+rdoSlipStatus.value+'&acc_pk='+txtCode_PK.text+'&Trans=TRANS'+'&CCy='+lstCurrency.value+'&BookCCy='+lstBookCcy.value;
		    url =System.RootURL + '/standard/reports/gf/ka/gfka00110_Settmentofpayment.aspx'+rqt;              
		    if(confirm("Are you sure you want to report ?" ))
		    {
			    System.OpenTargetPage( url , 'newform' );
			    return;
		    }
		}
/*

	    rqt = "?company_pk="+lstCompany.value+'&emp_pk=&from_date='+dtbFromDate.value+'&to_date='+dtbToDate.value+'&status='+rdoSlipStatus.value+'&Aacc_pk=&Trans=TRANS';
		url =System.RootURL + '/standard/reports/gf/ka/gfka00150_tonghop.aspx'+rqt;              
		if(confirm("Are you sure you want to report ?" ))
		{
			System.OpenTargetPage( url , 'newform' );
			return;
		}
		*/
}

function onGetEmployee()
{	
	var fpath = System.RootURL + "/standard/forms/ch/ae/chae00010_search_emp.aspx";
	var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
	if ((aValue != null)&&(aValue[0]!=""))
	{
	    txtEmp_PK.text = aValue[0];
	    txtEmp_ID.text = aValue[1];
	    txtEmp_NM.text = aValue[2];
	}
}

function onResetEmployee()
{
	txtEmp_PK.text = "";
	txtEmp_ID.text = "";
	txtEmp_NM.text = "";
}
function OnDataError(objid)
{
    alert("Error at "+objid.id+"---"+ objid.errmsg);
}
</script>

<body>
<!---------------------------------------------------------->

<gw:data id="datSLControlItem" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" user="acnt"  function="ac_SEL_60080130_SL_CTRITEM_INQ" > 
                <input bind="grdSLControl" >
                    <input bind="lstCompany" />
					<input bind="dtbFromDate" />
					<input bind="dtbToDate" />
					<input bind="txtCode_PK" />
					<input bind="txtItem_CD" />
					<input bind="rdoSlipStatus" />
					<input bind="lstCurrency" />
					<input bind="txtEmp_PK" />
                </input>
                <output  bind="grdSLControl" />
            </dso> 
        </xml> 
</gw:data> 

<gw:data id="datSLSum" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="ac_SEL_60080130_SL_CTRITEM_SUM">
                <input bind="grdSLSum">
                    <input bind="lstCompany" />
					<input bind="dtbFromDate" />
					<input bind="dtbToDate" />
					<input bind="txtCode_PK" />
					<input bind="txtItem_CD" />
					<input bind="rdoSlipStatus" />
					<input bind="lstCurrency" />
					<input bind="txtEmp_PK" />
                </input>
                <output bind="grdSLSum"/>
            </dso>
        </xml>
    </gw:data> 
	
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020020_company" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
<!-- MainTable -->
<table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0" >
	<tr>
		<td width="10%"></td>
		<td width="10%"> </td>
		<td width="3%"> </td>
		<td width="10%"> </td>
		<td width="9%"></td>
		<td width="10%"> </td>
		<td width="15%"></td>
		<td width="3%"> </td>
		<td width="8%"></td>
		<td width="14%"></td>
		<td width="3%"> </td>
	</tr>
	<tr height='2%' valign="top">
		<td align="right">Company</td>
		<td colspan="3"><gw:list id="lstCompany" styles="width:97%;" onchange="onChangeCompany()"></gw:list></td>
		<td align="right"  valign="middle"><a href="#" onclick="onGetItem()">Item Alias</a> &nbsp;&nbsp;</td>
		<td><gw:textbox id="txtItem_CD"  styles='width:100%'  /></td>
		<td><gw:textbox id="txtItem_NM"  styles='width:100%'  /></td>
		<td><gw:imgBtn id="btnItem" img="reset" alt="Item" onclick="onResetItem()"/></td>
		<td align="right" valign="middle"><a href="#" onclick="onGetEmployee()">Employee</a> </td>
		<td colspan="2">
		    <table border="0" cellpadding="0" cellspacing="0" width="100%">
		        <tr>
		            <td width="30%"><gw:textbox id="txtEmp_ID"  styles='width:100%'  /></td>
		            <td width="65%"><gw:textbox id="txtEmp_NM"  styles='width:100%'  /></td>
		            <td width="5%"><gw:imgBtn id="btnResetEmp" img="reset" alt="Reset Employee" onclick="onResetEmployee()"/></td>
		        </tr>
		    </table>
		</td>
		
	</tr>	
	<tr height='2%'>
		<td align="right">Proposed Date</td>
		<td><gw:datebox id="dtbFromDate" lang="<%=Application("Lang")%>" mode="01" styles="width:100%;" /></td>
	    <td align="center">~</td>
	    <td><gw:datebox id="dtbToDate" lang="<%=Application("Lang")%>" mode="01" styles="width:100%;" /></td>
		<td align="right"  valign="middle"><a href="#" onclick="onGetAccount()">Account Code</a> &nbsp;&nbsp;</td>
		<td><gw:textbox id="txtCode_CD"  styles='width:100%'  /></td>
		<td><gw:textbox id="txtCode_NM"  styles='width:100%'  /></td>
		<td><gw:imgBtn id="btnResetAcc" img="reset" alt="Reset Account Code" onclick="onResetAccount()"/></td>
		<td align="right">CCy</td>
		<td ><gw:list id="lstCurrency" styles="width:100%;" ></gw:list></td>
		<td align="right"><gw:imgbtn id="btnSearch" img="Search" alt="Search"   onclick="OnSearch()" /></td>
	</tr>
	<tr height='2%'>
		<td align="right">Slip Status</td>
		<td colspan="3">
			<gw:radio id="rdoSlipStatus" value="2" onchange="OnSearch()"> 
				<span value="2">Confirmed</span>
				<span value="0">Approved</span>
			</gw:radio>
		</td>
		<td align="right">Amount Type</td>
		<td colspan="4">
			<table border="0" width="100%">
				<tr>
					<td width="70%">
						<gw:radio id="rdoAmountType" value="1" onchange="onChangeFormat()"> 
				            <span value="1" > Trans</span>
				            <span value="2" >Trans & Books</span>
				        </gw:radio >
					</td>
					<td width="30%" align="right">
					</td>
				</tr>
			</table>
		</td>
		<td><gw:list id="lstReportType" styles="display:none;"></gw:list></td>
		<td></td>
	</tr>
	<tr height='70%'>
		<td colspan="11">
		<gw:grid id='grdSLControl'
header='Seq|Voucher No|Account Code|Item Alias|Data|Proposed Date|Proposed By|Ccy|Trans Debit|Trans Credit|Book Debit|Book Credit|Description|Local Description'
format='0|0|0|0|0|4|0|0|1|1|1|1|0|0'
aligns='1|0|0|0|0|0|0|0|0|0|0|0|0|0'
defaults='|||||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
widths='1000|1500|1500|2000|2000|1500|1500|800|2000|2000|2000|2000|2000|2000'
sorting='T'
group='T' 
acceptNullDate="T"
styles='width:100%; height:100%'
param="0,1,2,3,4,5,6,7,8,9,10,11,12,13"
/>
		</td>
	</tr>
	<tr height='24%'>
		<td colspan="11">
<gw:grid id='grdSLSum'      header='CCY|OPENINGBALANCE|DEBITTRANSAMOUNT|DEBITBOOKAMOUNT|CREDITTRANSAMOUNT|CREDITBOOKAMOUNT|CLOSINGBALANCE|_OB'
        format='0|1|1|1|1|1|1|1'
        aligns='1|1|2|2|2|2|2|2'
        defaults='|||||||'
        editcol='0|0|0|0|0|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T'
        styles='width:100%; height:100%;'
        />
		</td>
	</tr>
</table>
	<gw:textbox id="txtCode_PK"  styles="display:none"  />
	<gw:textbox id="txtItem_PK"  styles="display:none"  />
	<gw:textbox id="txtEmp_PK"  styles="display:none"  />
	<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
	<gw:textbox id="txtUser_Pk" styles="display:none; " />
</body>
</html>
