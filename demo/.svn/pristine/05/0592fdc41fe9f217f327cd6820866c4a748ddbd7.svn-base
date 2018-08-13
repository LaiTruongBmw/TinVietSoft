<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
 <%CtlLib.SetUser("acnt")%>
<script>

function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_date_to     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
    var ls_data1     = "<%=CtlLib.SetListDataFUNC("SELECT acnt.SF_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    lstLanguage.SetDataText(ls_data1);
    data = "<%=CtlLib.SetListDataFUNC("SELECT acnt.SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
    arr  = data.split("|");
	txtbookccy.SetDataText(arr[1]);
    if (txtbookccy.GetData()== 'VND'){
       // txt_bamt.GetControl().Format ='###,###,###,###';
        txtsum_dr.GetControl().Format ='###,###,###,###,###R';
        txtsum_cr.GetControl().Format ='###,###,###,###,###R';
    }else{
        //  txt_bamt.GetControl().Format ='###,###,###,###.##R';
        txtsum_dr.GetControl().Format ='###,###,###,###,###.##R';
        txtsum_cr.GetControl().Format ='###,###,###,###,###.##R';
    }    
    
    lstCompany.SetDataText(ls_data);
    dtPropos_fr.SetDataText(ls_date_fr);
    dtPropos_to.SetDataText(ls_date_to);
    txtsum_dr.text = 0;
    txtsum_cr.text = 0;
    txtsum_dr.SetEnable(false);
    txtsum_cr.SetEnable(false);
    
    var tempGrid = grid.GetGridControl();
    tempGrid.FixedCols = 1;
    SetGridFormat();
    txtAc_level.text= "<%=session("ACNT_LEVEL")%>";
     txtSesion_company.text = "<%=session("company_pk")%>";
     var _company;
     if(txtAc_level.text=='6')
     {
        _company = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM comm.tco_company where del_if=0")%>"; 
        lstCompany.SetDataText(_company);
        //cboOrganization.value= 'ALL';
     }
     else if(txtAc_level.text=='3')
     {
        datCompany.Call();
     }
}
//------------------------------------------------------------
function SetGridFormat()
 {
    var ctr = grid.GetGridControl(); 
    
    ctr.ColFormat(5)        = "#,###,###,###,###,###.##";
    ctr.ColFormat(6)        = "#,###,###,###,###,###.##";
   
 }
//------------------------------------------------------------
function OnCheck()
{
    var std_dt, etd_dt ;
	std_dt = dtPropos_fr.GetData();
	etd_dt = dtPropos_to.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert('    End date can’t be earlier than start date!!!'+'\n'+'Ngày kết thúc không thể nhỏ hơn ngày bắt đầu!!!');
		return false;
	}
	return true;
}

function OnSearch()
{
    if (OnCheck())
    {
        dso_sel_grd_dtl_slip_daily_aggregate.Call("SELECT");
    }
}

function OnChangeList()
{
    grid.ClearData();
}

function OnTotal()
{
    dso_pro_daily_aggregate_total.Call();
}

function OnPrint()
{
    if(lstLanguage.value=='ENG')
    {
        var url = System.RootURL + '/standard/reports/gf/hg/gfhg00040_DailyAggregate.aspx?prps_fr=' + dtPropos_fr.GetData() + '&prps_to=' + dtPropos_to.GetData() + '&Company=' + lstCompany.GetData() + '&status='+ rbstatus.GetData() + '&bccy=' + txtbookccy.GetData() + '&lang=' + lstLanguage.value;
        window.open(url); 
    }
    else if(lstLanguage.value=='VIE')
    {
        var url = System.RootURL + '/standard/reports/gf/hg/gfhg00040_DailyAggregate.aspx?prps_fr=' + dtPropos_fr.GetData() + '&prps_to=' + dtPropos_to.GetData() + '&Company=' + lstCompany.GetData() + '&status='+ rbstatus.GetData() + '&bccy=' + txtbookccy.GetData() + '&lang=' + lstLanguage.value;
        window.open(url); 
    }
    else if(lstLanguage.value=='KOR')
    {
        var url = System.RootURL + '/standard/reports/gf/hg/gfhg00040_DailyAggregate.aspx?prps_fr=' + dtPropos_fr.GetData() + '&prps_to=' + dtPropos_to.GetData() + '&Company=' + lstCompany.GetData() + '&status='+ rbstatus.GetData() + '&bccy=' + txtbookccy.GetData() + '&lang=' + lstLanguage.value;
        window.open(url); 
    }
}

function SetTotalRow()
{
    lblRecord.SetDataText(txtTotalRow.text);
}
function CountTotalRow()
{
    dso_pro_daily_aggregate_totalrow.Call();
}
//-----------------------------------------------------------------------
function OnPopup()
{
    var ctrl 	= grid.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 0)		 
	{
		if (event.col >= 1)
		{
			var acc_pk      = grid.GetGridData(ctrl.row, 0);
			var ac_cd  = grid.GetGridData(ctrl.row, 1);
			var ac_nm  = grid.GetGridData(ctrl.row, 3);
			
			var ls_arr = "";
			for (i = 1; i < grid.rows; i++)
			{
			    ls_arr = ls_arr + ' ' + grid.GetGridData(i, 1);
			}
			
			var fpath   = System.RootURL + '/standard/forms/gf/ka/gfka00020_popup.aspx?acc_pk=' + acc_pk + '&ac_cd=' + ac_cd + '&ac_nm=' + ac_nm + '&from_date=' + dtPropos_fr.GetData() + "&to_date=" + dtPropos_to.GetData() + "&company_pk=" + lstCompany.GetData() + "&status=" + rbstatus.GetData()  ;
			var wWidth  = 950;
			var wHeight = 600;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			
			var object = System.OpenModal(fpath, wWidth, wHeight, features);
	    }
    }
}
//-----------------------------------------------------------------------

</script>
<body style="margin:0; padding:0;">
<gw:data id="datCompany" onreceive=""  > 
        <xml>
            <dso  type="list" procedure="acnt.sp_lst_get_company"  > 
                <input>
                    <input bind="txtSesion_company" />
                </input> 
                <output>
                    <output bind="lstCompany" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dso_sel_grd_dtl_slip_daily_aggregate" onreceive="OnTotal()">
        <xml>
            <dso type="grid" function="acnt.SP_SEL_GRD_DAILY_AGGREGATE">
                <input bind="grid">
                    <input bind="lstCompany"/>
                    <input bind="dtPropos_fr"/>
                    <input bind="dtPropos_to"/>
                    <input bind="rbstatus"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>


    <gw:data id="dso_pro_daily_aggregate_total"  onreceive="CountTotalRow()"> 
        <xml> 
            <dso type="process" procedure="ACNT.SP_PRO_DAILY_AGGREGATE_TOTAL" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="dtPropos_fr"/>
                     <input bind="dtPropos_to"/>
                     <input bind="rbstatus"/>
                </input>
                <output>
                     <output bind="txtsum_dr"/>
                     <output bind="txtsum_cr"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
   
    <gw:data id="dso_pro_daily_aggregate_totalrow"  onreceive="SetTotalRow()"> 
        <xml> 
            <dso type="process" procedure="ACNT.SP_PRO_DAILY_AGG_TOTALROW" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="dtPropos_fr"/>
                     <input bind="dtPropos_to"/>
                     <input bind="rbstatus"/>
                </input>
                <output>
                     <output bind="txtTotalRow"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
<table width="100%" cellpadding="0" cellspacing="0" border="1">
<tr>
    <td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
            <td width="100%">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="10%" align="right">Company</td>
                    <td width="20%"><gw:list id="lstCompany" onChange="OnChangeList()" value ="" styles='width:100%'></gw:list></td>
                    <td width="20%" align="right">Proposed Date</td>
                    <td><gw:datebox id="dtPropos_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPropos_to" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td width="15%" align="right"><font color="black" >Slip Status</td>
                    <td width="30%" align="left"><gw:radio id="rbstatus" value="2" onchange="OnSearch()"> 
					        <span value="2">Confirmed</span>
					        <span value="0">Approved</span>
					        </gw:radio>
                    </td>
                    <td><gw:imgBtn id="btnSearch"   img="search"    alt="Search"    onclick="OnSearch()"/></td>
                    <td><gw:imgBtn id="btnPrint"    img="printer"   alt="Print"     onclick="OnPrint()"/></td>
                </tr>
               <tr>
                    <td  align="right">Total rows</td>
                    <td align="center"><gw:label id="lblRecord" text="" styles="color:red;width:100%;font-weight: bold;font-size:15"/></td>
                    <td width="" align="right" width="">Language</td>
                    <td width="" ><gw:list id="lstLanguage" styles="width:100%;" ></gw:list></td>
               </tr> 
                </table>
            </td>
        </tr>
        </table>
    </td>
</tr>
<tr>
<!--0_acc_pk|1.Acc Code|2.Acc Name Local|3.Acc Name|4.Acc Korea|5.Debit Amount|6.Credit Amount-->
    <td width="100%">
	    <gw:grid   
		    id="grid"
		    header  ="_acc_pk|Acc. Code|Acc. Name (LC)|Acc. Name|Acc. Name (KOR)|Amt (DR)|Amt (CR)"
		    format  ="0|0|0|0|0|0|0" 
	        aligns  ="0|1|0|0|0|3|3" 
		    defaults="||||||"  
		    editcol ="0|0|0|0|0|0|0"
		    widths  ="0|1000|3500|3500|3500|1800|0"
		    styles  ="width:100%; height:430"
		    sorting ="T"   
		    oncelldblclick="OnPopup()"
		    />
    </td>
</tr>
<tr>
    <td width="100%">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="76%" align="center">Total </td>
            <td><gw:textbox id="txtsum_dr" styles="width:100%" type="number" format="#,###,###,###,###,###.##R"/></td>
            <td><gw:textbox id="txtsum_cr" styles="width:100%" type="number" format="#,###,###,###,###,###.##R"/></td>
        </tr>
        </table>
    </td>
    
</tr>
</table>
<gw:textbox id="txtTotalRow" styles="display:none;" />
<gw:textbox id="txtbookccy" styles="width: 100%;display:none" />
<gw:textbox id="txtAc_level"  styles='display:none' />
<gw:textbox id="txtSesion_company"  styles='display:none' />
</body>
</html>
