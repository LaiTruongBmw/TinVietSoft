 <!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

function BodyInit()
{
    BindingDataList();
   
   txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	 dso_getCompany.Call();
}

function BindingDataList()
{
    System.Translate(document);
    var ls_data   = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_Type2 = "DATA|M|Month|D|Day|Y|Year";
    var ls_Type1 = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK046') FROM DUAL")%>";
    var ls_ccy          = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    var data = "<%=CtlLib.SetListDataSQL("select b.code, b.code from tac_commcode_master a, tac_commcode_detail b where a.pk = b.tac_commcode_master_pk and a.id = 'ACBG0040' and a.del_if = 0 and b.del_if = 0 AND def_yn='Y'")%>";
    var arr  = data.split("|");

    lstCcy_B.SetDataText(data);
    //lstCcy_B.value = arr[1];
    lstCcy_T.SetDataText(ls_ccy);
    lstCompany.SetDataText(ls_data);
    lstType2.SetDataText(ls_Type2);
    lstType1.SetDataText(ls_Type1);

    if(lstCcy_B.value=='VND')
    {
        lstCcy_T.value = 'USD';
        lstCcy_T.RemoveItem('VND');
    }
    else
    {
        lstCcy_T.AppendItem('VND');
        lstCcy_T.value = 'VND';
        lstCcy_T.RemoveItem(1);
        
    }

    formatGrid();
    OnChangeMonth();
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

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'dso_get_exrate_list':
            OnSearch();
        break;
        case 'dso_month':
            formatGrid();
            if(grdClosingEntry.rows>2)
            {
                ibtnProcess.SetEnable(false);
                ibtnCancel.SetEnable(true);
            }
            else
            {
                ibtnProcess.SetEnable(true);
                ibtnCancel.SetEnable(false);
            }
        break;
		case 'dso_process_month':
            //alert(txtRtn2.text);
			dso_month.Call('SELECT');
		break;
		case 'dso_cancel_month':
            //alert(txtRtn2.text);
			dso_month.Call('SELECT');
		break;
    }
}

function OnChangeMonth()
{
    var yyyymm = dtMonth.GetData();
    var yyyy = yyyymm.substr(0,4);
    var mm = yyyymm.substr(4,2);
    dtbTo.SetDataText(yyyy+mm+LastDayOfMonth(yyyymm));
    GetBookExRate(lstCcy_B.value);
    dso_get_exrate_list.Call();
    
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

function GetBookExRate(p_ccy){
    lstCcy_B.value = p_ccy;
    var sTemp = lstCcy_B.GetText();
    if(sTemp == ""){
        alert("Please input exchange rate for this "+ p_ccy +" currency at date:"+ dtbTo.GetData() +".");
        return;
    }
    var aTemp = sTemp.split("-");   
    var book_rate =  aTemp[1];
    return book_rate;
}

function GetTransExRate(p_ccy){
    lstCcy_T.value = p_ccy;
    var sTemp = lstCcy_T.GetText();
    if(sTemp == ""){
        alert("Please input exchange rate for this "+ p_ccy +" currency at date:"+ dtbTo.GetData() +".");
        return;
    }
    var aTemp = sTemp.split("-");   
    var book_rate =  aTemp[1];
    return book_rate;
}

function OnPopUp(obj)
{
    switch(obj)
    {
        case 'ACCT':
            var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=SP_SEL_ACCD_PL";
	        var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
            if ((object != null) &&(object[0]!="0"))
            {
                txtACPK.SetDataText(object[3]);
                txtACCD.SetDataText(object[0]);
                txtACNM.SetDataText(object[1]);
            }
        break;
    }
}

function OnSearch()
{
    dso_month.Call('SELECT');
}

function OnProcess()
{
    if(confirm('Are you sure you want to process ?'))
    {
        dso_process_month.Call();
    }
}

function OnCancel()
{
    if(confirm('Are you sure you want to cancel ?'))
    {
        dso_cancel_month.Call();
    }
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

<body style="margin:0; padding:0;">
 <gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="SP_GET_RATE" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="lstCcy_T"/>
                     <input bind="dtbTo"/>
                </input>
                <output>
                     <output bind="txtRate_T"/>
                     <output bind="txtRate_B"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

<gw:data id="dso_month" onreceive="OnDataReceive(this)" >
	<xml>
	<dso type="grid" function="ac_SEL_60060130_Month">
		<input bind="grdClosingEntry">
		<input bind="lstCompany"/>
        <input bind="lstType2"/>
		<input bind="dtMonth"/>
        <input bind="dtbTo"/>
		<input bind="txtACPK"/>
		<input bind="lstCcy_T"/>
		</input>
		<output bind="grdClosingEntry"/>
	</dso>
	</xml>
</gw:data> 

<gw:data id="dso_process_month" onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso id="1" type="process" user="acnt" parameter="0" procedure="ac_Pro_60060130_month" > 
			<input >
			<input bind="lstCompany"/>
            <input bind="lstType1"/>
            <input bind="lstType2"/>
		    <input bind="dtMonth"/>
            <input bind="dtbTo"/>
            <input bind="txtRate_T"/>
            <input bind="lstCcy_T"/>
            
			</input>
			<output>
				<output bind="txtRtn1" /> 
				<output bind="txtRtn2" /> 
			</output>
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="dso_cancel_month" onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso id="1" type="process" user="acnt" parameter="0" procedure="ac_Pro_60060130_month_cancel" > 
			<input >
			<input bind="lstCompany"/>
            <input bind="lstType1"/>
            <input bind="lstType2"/>
		    <input bind="dtMonth"/>
			</input>
			<output>
				<output bind="txtRtn1" /> 
				<output bind="txtRtn2" /> 
			</output>
		</dso> 
	</xml> 
</gw:data> 
<!---------------------------------------------------------->
	 <gw:data id="dso_getCompany" onreceive="dso_get_exrate_list.Call();"> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020020_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
      <tr style="height:6%">
          <td>
              <fieldset style="padding:0">
                    <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                        <tr>
                            <td align="right" width="8%" >Company</td>
                            <td width="32%"><gw:list id="lstCompany" styles="width:100%;" ></gw:list></td>
                            <td align="right" width="15%" ><a title="Click here to show Account" onclick="OnPopUp('ACCT')" href="#tips" >Account code</a></td>
                            <td width="45%">
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td width="35%"><gw:textbox id="txtACCD" text="" styles='width:100%' /></td> 
                                        <td width="65%"><gw:textbox id="txtACNM" text="" styles='width:100%' /></td>
                                        <td width=""><gw:textbox id="txtACPK" text="" styles='width:100%;display:none' /></td> 
                                        <td><gw:imgBtn id="ibtnAccReset" img="reset"  alt="reset acc" onclick="txtACCD.text='';txtACNM.text='';txtACPK.text='';" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td ><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"    onclick="OnSearch()" /></td>
                            <td ><gw:imgBtn id="ibtnProcess" img="Process"    alt="Process"    onclick="OnProcess()" /></td>
                            <td ><gw:imgBtn id="ibtnCancel" img="cancel"    alt="Cancel"    onclick="OnCancel()" /></td>
                        </tr>
                        <tr>
                            <td align="right" width="" >Type</td>
                            <td width=""><gw:list id="lstType1" styles="width:100%;" ></gw:list></td>
                            <td align="right">Booking Ccy</td>
                            <td width="">
                                <table width="100%" cellpadding="1" cellspacing="0" border="0">
                                    <tr>
                                        <td width="16%"><gw:list id="lstCcy_B"  styles='width:100%' /></td> 
                                        <td width="25%"><gw:textbox id="txtRate_B" type="number" format="###,###.##R" text="" styles='width:100%' /></td>
                                        <td align="right" width="18%">Trans Ccy</td>
                                        <td width="16%"><gw:list id="lstCcy_T" onchange="dso_get_exrate_list.Call()" styles='width:100%' /></td> 
                                        <td width="25%"><gw:textbox id="txtRate_T" type="number" format="###,###.##R" text="" styles='width:100%' /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="" >Type</td>
                            <td width=""><gw:list id="lstType2" styles="width:100%;" ></gw:list></td>
                            <td align="right">Trans Date</td>
                            <td width="">
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td  ><gw:datebox type="month" onchange="OnChangeMonth()" id="dtMonth" lang="<%=Application("Lang")%>" mode="01"  /></td>
                                        <td  >&nbsp;=>&nbsp;</td>
                                        <td  ><gw:datebox id="dtbTo" lang="<%=Application("Lang")%>" mode="01"  /></td>
                                        <td width="100%"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                     </table>
                </fieldset>
            </td>
      </tr>
      <tr style="height:94%">
            <td>
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
   
    <gw:textbox id="txt_row" styles="display:none; " />
    <gw:textbox id="txtRtn1" styles="display:none; " />
    <gw:textbox id="txtRtn2" styles="display:none; " />
    <gw:textbox id="txtProposedByUserPk"  styles='display:none' />

</body>
</html>
