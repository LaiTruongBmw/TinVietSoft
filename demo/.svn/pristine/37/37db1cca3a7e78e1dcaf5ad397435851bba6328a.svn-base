<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
  <head>
    <title>Advance For Employee Inquiry</title>
  </head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <script>
var flag=0; 
var bAdd=false;
var g_user_pk = "<%=Session("USER_PK") %>";
function BodyInit()
{
	System.Translate(document);  
    BindingDataList();
    txtUser_Pk.text = g_user_pk;
dso_getCompany.Call();
}

//--------------------------------
function BindingDataList()
{
	var ls_data1 = "<%= CtlLib.SetListDataSQL(" select pk,PARTNER_NAME from tco_company where del_if = 0") %>";
	var ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT 'ALL' C1,'<All>' C2 FROM DUAL UNION ALL SELECT C1,C2 FROM ( SELECT TRIM(A.CODE) C1, A.CODE C2 FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY NUM_VALUE1)")%>";
	var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";	
	var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_LNM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK035'  ORDER BY D.DEF_YN DESC, D.ORD")%>";	
	lstBookCcy.SetDataText(ls_bookccy);   
	lstCompany.SetDataText(ls_data1);
	lstCurrency.SetDataText(ls_data2); 
	txtCode_PK.SetEnable(false);
	txtCode_CD.SetEnable(false);
	txtCode_NM.SetEnable(false);
	txtEmp_PK.SetEnable(false);
	txtEmp_ID.SetEnable(false);
	txtEmp_NM.SetEnable(false);
	//lstReportType.SetDataText("DATA|1|Settment of payment|2|Advance");
	lstReportType.SetDataText(ls_data3);
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
	grdSLControl.GetGridControl().FrozenCols = 1;
	lstCurrency.value = lstBookCcy.value;
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
	grdSLSum.ClearData();
	formatGridDetail(); 
	FormatSumGrid();
	onResetAccount();
	onResetEmployee();
}

function onResetAccount()
{
	txtCode_PK.text = "";
	txtCode_CD.text = "";
	txtCode_NM.text = "";
}

function onResetEmployee()
{
	txtEmp_PK.text = "";
	txtEmp_ID.text = "";
	txtEmp_NM.text = "";
}

function onGetAccount()
{
	var fpath = System.RootURL + "/standard/forms/60/08/60080100_popup_1.aspx?col_nm=Account Name&col_code=Account Code&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + '' + "&val2=" + '' + "&val3=" + '' + "&dsqlid=ac_SEL_60080100_popup_ACC";
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

function onGetEmployee()
{	
	//var fpath = System.RootURL + "/standard/forms/ch/ae/chae00010_search_emp.aspx";
	var fpath = System.RootURL + "/standard/forms/60/08/60080100_popup_2.aspx";
	var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
	if ((aValue != null)&&(aValue[0]!=""))
	{
	    txtEmp_PK.text = aValue[0];
	    txtEmp_ID.text = aValue[1];
	    txtEmp_NM.text = aValue[2];
	}
}
function OnSearch()
{
	if(txtCode_PK.text=="")
	{
		alert("Please choose Account Code!");
		return;
	}
	
	grdSLSum.ClearData();
	FormatSumGrid();
	datSLSum.Call('SELECT');
}

function OnReport()
{
        if (lstReportType.value=="2")
        {
	                                rqt = "?company_pk="+lstCompany.value+'&emp_pk='+  txtEmp_PK.GetData() + '&from_date='+dtbFromDate.value+'&to_date='+dtbToDate.value+'&status='+rdoSlipStatus.value+'&acc_pk='+txtCode_PK.text+'&Trans=TRANS&BookCCy='+lstBookCcy.value;
		                            url =System.RootURL + '/standard/reports/gf/ka/gfka00150_tonghop.aspx'+rqt;              
		                            if(confirm("Are you sure you want to report ?" ))
		                            {
			                            System.OpenTargetPage( url , 'newform' );
			                            return;
		                            }
		}
		else if (lstReportType.value=="2")
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
		else if (lstReportType.value=="3")
		{
		                             rqt = "?company_pk="+lstCompany.value+ '&acc_pk='+txtCode_PK.text+ '&emp_pk='+txtEmp_PK.text +'&CCy='+lstCurrency.value +'&from_date='+dtbFromDate.value +'&status='+rdoSlipStatus.value+'&to_date='+dtbToDate.value;
		                             //alert(rqt);
		                            url =System.RootURL + '/standard/reports/gf/ka/gfka00110_SoChiTietTamUngNhanVien.aspx'+rqt;              
		                            
			                            System.OpenTargetPage( url , 'newform' );
			                            return;
		                            
		}
		else
		{
		                                if (txtEmp_PK.text=="")
		                                {
		                                    alert("Please select a employee");
		                                   return; 
		                                }
		                                /*if(lstCurrency.value=="ALL")
		                                {
		                                    alert("Please select currency!");
		                                   return; 
		                                }*/
		                                rqt = "?company_pk="+lstCompany.value+'&emp_pk='+txtEmp_PK.text+'&from_date='+dtbFromDate.value+'&to_date='+dtbToDate.value+'&status='+rdoSlipStatus.value+'&acc_pk='+txtCode_PK.text+'&Trans=TRANS'+'&CCy='+lstCurrency.value+'&BookCCy='+lstBookCcy.value;
		                                url =System.RootURL + '/standard/reports/gf/ka/gfka00110_SettmentofpaymentAS.aspx'+rqt;              
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

function onDBClickSLControl()
{
   var rows =0;
    var rownum =0;
    var colnum =0;
    var pk = 0;
    var status = "";
    var ls_arr = ""; 

    var ctrl = grdSLControl.GetGridControl();
    rows = ctrl.Rows;
    rows = rows - 1;
    rownum = ctrl.row;
    pk = grdSLControl.GetGridData(ctrl.row, 0);
    tatus = grdSLControl.GetGridData(ctrl.row, 6);
//    for (i = 1; i < grdSLControl.rows; i++)
//    {
//        ls_arr = ls_arr + ' ' + grdSLControl.GetGridData(i, 0);
//    } 

    if (rownum > 0) 
    {
        var fpath = System.RootURL + '/standard/forms/60/08/60080050_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
        var wWidth = 950;
        var wHeight = 600;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        this.name = "" ;
        var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
    }
}

function OnDataError(objid)
{
    alert("Error at "+objid.id);//objid.errmsg);
}

function GetRowPK(row_index){
    if((row_index < grdSLControl.rows) && (row_index > 0)){
        return grdSLControl.GetGridData(row_index, 0);
    }
    return -1;
}

</script>

<body>
<!---------------------------------------------------------->

<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_gfac00100_1" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

<gw:data id="datSLControlItem" onreceive="OnDataReceive(this)"> 
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


<table cellpadding="0" cellspacing="0" border="0" style='width:100%;height:100%'>
	<tr>
		<td width="10%"></td>
		<td width="10%"> </td>
		<td width="3%"> </td>
		<td width="10%"> </td>
		<td width="11%"></td>
		<td width="10%"> </td>
		<td width="15%"></td>
		<td width="3%"></td>
		<td width="6%"></td>
		<td width="5%"></td>
		<td width="7%"></td>
		<td width="5%"> </td>
	</tr>
	<tr height='2%' valign="top">
		<td align="right">Company</td>
		<td colspan="3"><gw:list id="lstCompany" styles="width:97%;" onchange="onChangeCompany()"></gw:list></td>
		<td align="right" valign="middle"> <a href="#" onclick="onGetAccount()">Account Code</a> &nbsp;&nbsp;</td>
		<td><gw:textbox id="txtCode_CD"  styles='width:100%'  /></td>
		<td colspan="3"><gw:textbox id="txtCode_NM"  styles='width:100%'  /></td>
		<td><gw:imgBtn id="btnResetAcc" img="reset" alt="Reset Account Code" onclick="onResetAccount()"/></td>
        <td align="right">Currency</td>
        <td ><gw:list id="lstCurrency" styles="width:100%;" ></gw:list></td>
		           
	</tr>	
	<tr height='2%'>
		<td align="right">Proposed Date</td>
		<td><gw:datebox id="dtbFromDate" lang="<%=Application("Lang")%>" mode="01" styles="width:100%;" /></td>
	    <td align="center">~</td>
	    <td><gw:datebox id="dtbToDate" lang="<%=Application("Lang")%>" mode="01" styles="width:100%;" /></td>
		<td align="right"  valign="middle"><a href="#" onclick="onGetEmployee()">Employee Name</a> &nbsp;&nbsp;</td>
		<td><gw:textbox id="txtEmp_ID"  styles='width:100%'  /></td>
		<td  colspan="3"><gw:textbox id="txtEmp_NM"  styles='width:100%'  /></td>
		<td><gw:imgBtn id="btnItem" img="reset" alt="Reset Employee" onclick="onResetEmployee()"/></td>
		<td></td>
		<td ><gw:imgbtn id="btnSearch" img="Search" alt="Search"   onclick="OnSearch()" /></td>
	</tr>
	<tr height='2%'>
		<td align="right">Slip Status</td>
		<td colspan="3">
			<gw:radio id="rdoSlipStatus" value="0" onchange="OnSearch()"> 
				<span value="2">Confirmed</span>
				<span value="0">Approved</span>
			</gw:radio>
		</td>
		<td align="right">Amount Type</td>
		<td colspan="6">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="45%">
						<gw:radio id="rdoAmountType" value="1" onchange="onChangeFormat()"> 
				            <span value="1" > Trans</span>
				            <span value="2" >Trans & Books</span>
				        </gw:radio >
					</td>
					<td width="20%" align="right">Report Type</td>
					<td width="35%"><gw:list id="lstReportType" styles="width:100%;"></gw:list></td>
				</tr>
			</table>
		</td>
		<td><gw:imgBtn id="btnPrint" img="excel" alt="Print Report" onclick="OnReport()" styles=""/></td>
	</tr>
	<tr height='74%'>
		<td colspan="12">
		<gw:grid id='grdSLControl'
header='Seq|Voucher No|Proposed Date|Employee ID|Employee Name|Proposed By|Ccy|Trans Debit|Trans Credit|Book Debit|Book Credit|Description|Local Description|_TR_DATE'
format='0|0|4|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
defaults='|||||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
widths='1000|1800|1500|1500|2000|1500|800|1000|1000|1000|1000|2000|2000|1000'
sorting='T'
autosize='T'
styles='width:100%; height:100%'
oncelldblclick='onDBClickSLControl(this)'
/>
		</td>
	</tr>
	<tr height='20%'>
		<td colspan="12">
<gw:grid id='grdSLSum'      header='CCY|OPENINGBALANCE|DEBITTRANSAMOUNT|DEBITBOOKAMOUNT|CREDITTRANSAMOUNT|CREDITBOOKAMOUNT|CLOSINGBALANCE'
        format='0|1|1|1|1|1|1'
        aligns='1|1|2|2|2|2|2'
        defaults='||||||'
        editcol='0|0|0|0|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000'
        sorting='T'
        styles='width:100%; height:100%;'
        />
		</td>
	</tr>
</table>
	<gw:textbox id="txtCode_PK"  styles="display:none"  />
	<gw:textbox id="txtEmp_PK"  styles="display:none"  />
	<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
    <gw:textbox id="txtAc_level"  styles='display:none' />
         <gw:textbox id="txtSesion_company"  styles='display:none' />
<gw:textbox id="txtUser_Pk" styles="display:none;" />
</body>
</html>
