<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var g_pk = 0,
	g_company_pk = 1,
	g_no = 2,
	g_month = 3,
	g_partner_pk = 4,
	g_partner_id = 5,
	g_partner_nm = 6,
	g_interest_rate = 7,
	g_due = 8,
	g_remark = 9
	;
function BodyInit()
{
    BindingData(); 
    System.Translate(document); 
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
    
}
//------------------------------------------------------------------------
function BindingData()
{
    var ls_data  = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if = 0")%>";
	lstCompany.SetDataText(ls_data);
	lstCompany_pro.SetDataText(ls_data);
	CalculateFTDate_pro();
	formatGrid();
}
//------------------------------------------------------------------------
function OnPopUp(obj)
{
	var path = System.RootURL + '/standard/forms/60/05/60050010_popup_ItemControl.aspx?com_pk=' + lstCompany.GetData();
	var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
	if ( object != null )
	{
		if (object[0] != 0)
		{
			txtPartner_PK.text = object[0];//
			txtPartner_CD.text = object[1];//
			txtPartner_NM.text = object[2];//
		}
	}
}
//------------------------------------------------------------------------------------------
function OnSearch(obj)
{
	switch(obj)
	{
		case 'process':
			dso_search_process.Call("SELECT");
		break;
		case 'inquiry':
			dso_search.Call("SELECT");
		break;
	}
}
//-------------------------------------------------------------------------------------------

function OnPrint()
{
	if(lstReport1.value=='01')
	{
		var url ='/standard/reports/60/08/rpt_60081341_01.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value;
	}	
	else if(lstReport1.value=='02')
	{
		var url ='/standard/reports/60/08/rpt_60081341_02.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value;
	}	
    System.OpenTargetPage( System.RootURL+url , 'newform' );
}
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_search_process':
			formatGrid();
            if(grdClosingEntry.rows>2)
            {
                btnProcess.SetEnable(false);
                btnCancel.SetEnable(true);
            }
            else
            {
                btnProcess.SetEnable(true);
                btnCancel.SetEnable(false);
            }
		break;
		case 'dso_process':
			alert(txtRtn2.text);
			if(txtRtn!='-1')
			{
				btnProcess.SetEnable(true);
				btnCancel.SetEnable(true);
			}
			else
			{
				btnProcess.SetEnable(false);
				btnCancel.SetEnable(false);
			}
			dso_search_process.Call('SELECT');
		break;
		case 'dso_getCompany_pro':
			OnSearch('process');
		break;
	}
}


/*function OnFormat()
{
            var fg = grdDetail.GetGridControl();
            fg.ColFormat(2) = "###,###.##R"; 
            fg.ColFormat(3) = "###,###.##R"; 
            fg.ColFormat(4) = "###,###.##R"; 
            fg.ColFormat(5) = "###,###.##R"; 
            fg.ColFormat(6) = "###,###.##R"; 
            fg.ColFormat(7) = "###,###.##R"; 
            fg.ColFormat(8) = "###,###.##R"; 
            fg.ColFormat(9) = "###,###.##R";        
}
*/
function CalculateFTDate(){
    
    var yyyymm,yyyy, mm, quater;
    //month
        yyyymm = dtMonth.GetData();
        yyyy = yyyymm.substr(0,4);
        mm = yyyymm.substr(4,2);
        dtFrom.SetDataText(yyyy+mm+"01");
        dtTo.SetDataText(yyyy+mm+LastDayOfMonth(yyyymm));
}

function CalculateFTDate_pro(){
    
    var yyyymm,yyyy, mm, quater;
    //month
        yyyymm = dtMonth_pro.GetData();
        yyyy = yyyymm.substr(0,4);
        mm = yyyymm.substr(4,2);
        dtFrom_pro.SetDataText(yyyy+mm+"01");
        dtTo_pro.SetDataText(yyyy+mm+LastDayOfMonth(yyyymm));
}

function LastDayOfMonth(p_yyyymm){
    mm = p_yyyymm.substr(4,2);
    yyyy = p_yyyymm.substr(0,4);
    mm = parseInt(mm,10);
    switch(mm)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
          return 31;
          break;
        case 4:
        case 6:
        case 9: 
        case 11:
        return 30;
          break;
        default: 
        if((yyyy%4 == 0)&&(yyyy%100 > 0)){
            return 29;
        }
        else
        {
            return 28;
        }
    }
    return -1;//invalid month
}

function OnProcess()
{
	dso_process.Call();
}

function OnCancel()
{
	if(confirm('Are you sure you want to cancel?'))
	{
		dso_cancel.Call();
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
	fg.Cell(0,0,5,0,6) = "Acc. Code";
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

function onGridDbClick()
{
    var ctrl 	= grdClosingEntry.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 0)		 
	{
		
			var pk      = grdClosingEntry.GetGridData(ctrl.row, 0);
			//var status  = grdClosingEntry.GetGridData(ctrl.row, 10);
			var ls_arr = "";
		
			var fpath   = System.RootURL + '/standard/forms/60/06/60060020_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + '&APPRCANCEL='  + "&ARRAY_PK=" + ls_arr;
			var wWidth  = 950;
			var wHeight = 580;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			this.name = "gfhg00120";
			var object = System.OpenModal(fpath, wWidth, wHeight, features,window);
			  //var object = System.OpenModal( fpath ,800 , 600 , 'resizable:yes;status:yes');
			// 'resizable:yes;status:yes'
	   
    }

}

function GetRowPK(row_index){
    if((row_index < grdClosingEntry.rows) && (row_index > 1)){
        return grdClosingEntry.GetGridData(row_index, 0);
    }
    return -1;
}
</script>
  <body>
     <!------------------------------------------------------------------------>
  <gw:data id="dso_getCompany" onreceive="dso_getCompany_pro.Call();"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	
<gw:data id="dso_search_process" onreceive="OnDataReceive(this)" >
	<xml>
	<dso type="grid" function="ac_SEL_60110200_1">
		<input bind="grdClosingEntry">
		<input bind="lstCompany"/>
		<input bind="dtFrom_pro"/>
		<input bind="dtTo_pro"/>
		</input>
		<output bind="grdClosingEntry"/>
	</dso>
	</xml>
</gw:data> 	
	
<gw:data id="dso_getCompany_pro" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany_pro"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
	
<gw:data id="dso_search" onreceive="">
        <xml>
            <dso type="grid"  function="ac_sel_60110200" >
                <input bind="grdDetail">
                    <input bind="lstCompany"/>
                    <input bind="dtFrom"/>
                    <input bind="dtTo"/>
					<input bind="txtPartner_PK"/>
                </input> 
                <output bind="grdDetail"/>
            </dso>
        </xml>
    </gw:data>	
	


	<gw:data id="dso_process" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60110200" > 
                <input> 
                     <input bind="lstCompany"/>
                    <input bind="dtFrom"/>
                    <input bind="dtTo"/>
					<input bind="txtPartner_PK"/>
                </input>  
                <output>  
                     <output bind="txtRtn"/>
					 <output bind="txtRtn2"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	
<gw:data id="dso_cancel" onreceive="alert(txtRtn2.text);">
        <xml> 
            <dso type="process" procedure="ac_pro_60110200_cancel" > 
                <input> 
                     <input bind="lstCompany"/>
                    <input bind="dtFrom"/>
                    <input bind="dtTo"/>
					<input bind="txtPartner_PK"/>
                </input>  
                <output>  
                     <output bind="txtRtn"/>
					 <output bind="txtRtn2"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>		
    <!--------------------------------------------------------------------------------------------------->
<gw:tab id="idTab" style="border1px">
	<table name='Process' style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
		<tr style="width:100%;height:2%">
		   <td>
				<fieldset >
					 <table width="100%" border="0" cellpadding="1" cellspacing="1" >
					   <tr >
							<td align="right" width="8%" >Company</td>
							<td  colspan="" width="75%"><gw:list id="lstCompany_pro" styles="width:100%" /></td>
							<td align="right" width="12%">Month</td> 
							<td><gw:datebox id="dtMonth_pro" styles='width:100%' onchange="CalculateFTDate_pro();OnSearch('process');" lang="<%=Session("Lang")%>" type="month" /></td> 
							<td><gw:datebox id="dtFrom_pro" styles='width:100%'  lang="<%=Session("Lang")%>"  /></td>
							<td><gw:datebox id="dtTo_pro" styles='width:100%'  lang="<%=Session("Lang")%>"  /></td>
							<td  width="5%"></td>
							<td align=""  ><gw:imgbtn img="search" alt="Search" id="btnSearch_pro" onclick="OnSearch('process')" /></td>
							<td align=""  ><gw:imgbtn img="process" alt="Process" id="btnProcess" onclick="OnProcess()" /></td>
							<td align=""  ><gw:imgbtn img="cancel" alt="Cancel" id="btnCancel" onclick="OnCancel()" /></td>
						</tr>
						
					</table>     
				</fieldset>
		   </td>
		</tr>
		<tr style="width:100%;height:98%"> 
			<td >
				<gw:grid id='grdClosingEntry'
			    header='SEQ|VOUCHER_NO|TRANS_DATE|TR_TYPE_CD|TR_TYPE_NM|AC_DB|AC_CB|DUAL'
			    format='0|0|0|0|0|0|0|0'
			    aligns='0|0|0|0|0|0|0|0'
			    defaults='|||||||'
			    editcol='0|0|0|0|0|0|0|0'
			    widths='1000|1000|1000|1000|1000|1000|1000|1000'
			    sorting='T'
				autosize="T"
			    oncelldblclick="onGridDbClick()" 
			    styles='width:100%; height:100%'
                />
			</td>
		</tr>
	</table>
	<table name='Inquiry' style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
		<tr style="width:100%;height:2%">
		   <td>
				<fieldset >
					 <table width="100%" border="0" cellpadding="1" cellspacing="1" >
					   <tr >
							<td align="right" width="8%" >Company</td>
							<td  colspan="" width="30%"><gw:list id="lstCompany" styles="width:100%" /></td>
							<td align="right" width="8%">Month</td> 
							<td><gw:datebox id="dtMonth" styles='width:100%' onchange='CalculateFTDate()' lang="<%=Session("Lang")%>" type="month" /></td> 
							<td><gw:datebox id="dtFrom" styles='width:100%'  lang="<%=Session("Lang")%>"  /></td>
							<td><gw:datebox id="dtTo" styles='width:100%'  lang="<%=Session("Lang")%>"  /></td>
							<td align="right" styles="" width="10%"><a title="Click here to select Partner" onclick="OnPopUp()" href="#tips">Partner</a></td>
							<td width="44%" colspan=''>
								<table style='width:100%' cellpadding="0" cellspacing="0">
									<tr>
										<td width="35%"> <gw:textbox id="txtPartner_CD" text="" styles="width:100%" /></td>
										<td width="65%"><gw:textbox id="txtPartner_NM" text="" styles="width:100%" /><gw:textbox id="txtPartner_PK" styles="display:none; " /></td>
										<td align=""><gw:imgbtn img="reset" alt="Reset" id="btnResetPLCenter" onclick="txtPartner_CD.text='';txtPartner_NM.text='';txtPartner_PK.text='';" /></td>
									</tr> 
								</table>
							</td>
							<td align=""  ><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('inquiry')" /></td>
						</tr>
						
					</table>     
				</fieldset>
		   </td>
		</tr>
		<tr style="width:100%;height:98%"> 
			<td >
			<!--header='0.Seq|1.Voucher No|2.Trans Date|3.Acc. Code|4.Acc. Name|Acc Code VAS|5.Trans Amount|6.Books Amount|7.Cust ID|8.Customer Name|9.PL Code|10.PL Name|11.Remark|12.Remark2'-->
						<gw:grid id='grdDetail'
							header='No|Serial No|Invoice No|Invoice Date|Overdue Date|Description|Ccy|A/R Trans Amt|A/R Book Amt|A/R Bal Amt|A/R Bal Book Amt|Day|Interest Trans Amt|Interest Book Amt|Partner Id|Partner Name'
							format='0|0|0|0|0|0|0|1|1|1|1|0|1|1|0|0'
							aligns='1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
							defaults='|||||||||||||||'
						   editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
							widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
							sorting='T'
							styles='width:100%; height:100%'
							autosize="T"
							oncellclick=""
						/>
					</td>
		</tr>
		 
	</table>
</gw:tab>          
<gw:textbox id="txtUser"  text="" styles="width:100%;display:none" />
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
<gw:textbox id="txtRtn"       styles='display:none'/>
<gw:textbox id="txtRtn2"       styles='display:none'/>
  </body>
</html>