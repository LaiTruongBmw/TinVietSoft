<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
 <%CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>
var lang = "";
var g_company_pk = "";
var g_user_pk = "";
function BodyInit()
{
    lang = "<%=Session("SESSION_LANG")%>";
    g_company_pk = "<%=Session("COMPANY_PK")%>";
    g_user_pk = "<%=Session("USER_PK")%>";

    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_current     = "<%=CtlLib.SetListDataFUNC("SELECT f_commoncode('ACAB0110','03','') FROM DUAL")%>";
	var ls_date        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
	var ls_Book_ccy    = "<%=CtlLib.SetListDataFUNC("SELECT f_commoncode('ACBG0040','04','') FROM DUAL")%>";
	var ls_date1        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
	var ls_Type        = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACAB001') FROM DUAL")%>";
	
    lstCompany.SetDataText(ls_data);
    lstCompany.value = g_company_pk ;
    dtDate_fr.SetDataText(ls_date_fr);
    lstBook_ccy.SetDataText(ls_Book_ccy);
    txtLang.SetDataText(lang);
    lstType.SetDataText(ls_Type);
    lstType.value = "AL";
    lstType.SetEnable(false);
    txtcust_nm.SetEnable(false);
    txtpl_nm.SetEnable(false);
    txtac_nm.SetEnable(false);    
    SetGridData();
    txtUserPK.SetDataText(g_user_pk);    
    dso_getCompany.Call();
}

function SetGridData()
{
//    var fg  = grid.GetGridControl();
//        
//    if (lstBook_ccy.GetData() == 'VND')
//    {
//        fg.ColFormat(12)    = "#,###,###,###,###,###,###,###,###.##R";
//        fg.ColFormat(14)    = "#,###,###,###,###,###,###,###,###.##R";
//        fg.ColFormat(16)    = "#,###,###,###,###,###,###,###,###.##R";
//        fg.ColFormat(13)    = "#,###,###,###,###,###,###,###,###,###R";
//        fg.ColFormat(15)    = "#,###,###,###,###,###,###,###,###,###R";
//        fg.ColFormat(17)    = "#,###,###,###,###,###,###,###,###,###R";
//    }
//    else
//    {
//        fg.ColFormat(12)    = "#,###,###,###,###,###,###,###,###,###R";
//        fg.ColFormat(14)    = "#,###,###,###,###,###,###,###,###,###R";
//        fg.ColFormat(16)    = "#,###,###,###,###,###,###,###,###,###R";
//        fg.ColFormat(13)    = "#,###,###,###,###,###,###,###,###.##R";
//        fg.ColFormat(15)    = "#,###,###,###,###,###,###,###,###.##R";
//        fg.ColFormat(17)    = "#,###,###,###,###,###,###,###,###.##R";
//    }
}

function Reset_Cust()
{
    txtcust_cd.SetDataText("");
    txtcust_nm.SetDataText("");
    txtcust_pk.SetDataText("");
}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}

function OnCheck()
{
/*    var std_dt, etd_dt ;
    std_dt = dtDate_fr.GetData();
	etd_dt = dtDate_to.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert(' End Pay Due Date can’t be earlier than start date!!!'+'\n'+'Ngày kết thúc không thể nhỏ hơn ngày bắt đầu!!!');
		return false;
	}
*/	
	return true;
}

function Popup_Cust()
{
    var fpath   = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
    var object  = System.OpenModal(fpath , 800 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null )
    {
        if (object[1] != 0)
        {
            txtcust_pk.text    = object[0];
            txtcust_nm.text    = object[2];
            txtcust_cd.text    = object[1];
        }
    }
}


function OnSearch()
{
    if (!OnCheck()) return;
    grid.ClearData();
    dso_sel_ap_balance.Call('SELECT');
}

function OnPrint()
{
    var  url= System.RootURL + "/standard/reports/gf/da/gfda00090.aspx?p_com_pk="+lstCompany.value+"&p_date_fr="+dtDate_fr.value
        +"&p_date_to="+dtDate_to.value+"&p_tco_buspartner_pk="+txtcust_pk.text+"&p_tac_abacctcode_pk="+txtac_pk.text
        +"&p_tac_abplcenter_pk="+txtpl_pk.text+"&p_seq="+txtseq.text
        +"&p_voucher="+txtvoucher_no.text+"&p_invoice_no="+txtinvoice.text+"&p_type="+lstType.value
        +"&p_lang="+txtLang.text;
        System.OpenTargetPage( url, "_blank" );
}

function Popup_PL()
{
    var fpath = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
    var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null ) 
    {
        if (object[0] != 0)
        {
            txtpl_pk.SetDataText(object[2]); // PK
            txtpl_cd.SetDataText(object[0]); // Item Code
            txtpl_nm.SetDataText(object[1]); // Item Name Local
        }
    }
}

function Reset_PL()
{
    txtpl_pk.SetDataText("");
    txtpl_cd.SetDataText("");
    txtpl_nm.SetDataText("");
}

function Popup_Acc()
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "15" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=AC_SEL_ACCT_POPUP";
    o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
    if (o != null)
	{
		if(o[0] != 0)
		{
		    txtac_cd.SetDataText(o[0]);
			txtac_nm.SetDataText(o[1]);
			txtac_pk.SetDataText(o[3]);
		}
    }
}


function Popup_Item()
{
   var path = System.RootURL + "/standard/forms/fm/gf/PopUpGetOneItem.aspx?purchase_yn=&item_code=" + txtItemCode.text  ;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
            if(object != null)
            {
                txtItemCode.text = object[1];
              //  txtItemName.text = object[2];
            }                             
}

function Reset_Acc()
{
    txtac_cd.SetDataText("");
	txtac_nm.SetDataText("");
	txtac_pk.SetDataText("");
}

function OnPopup()
{
    var ctrl 	= grid.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 0)		 
	{
		if (event.col > 1)
		{
			var pk      = grid.GetGridData(ctrl.row, 1);
			var ls_arr  = "";
			for (i = 1; i < grid.rows; i++)
			{
			    ls_arr = ls_arr + ' ' + grid.GetGridData(i, 1);
			}
			
			var fpath   = System.RootURL + '/standard/forms/gf/da/gfda00090_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + "&ARRAY_PK=" + ls_arr + "&compk=" + lstCompany.GetData() + "&date_fr=" + dtDate_fr.GetData() +"&date_to=" + dtDate_to.GetData();
			var wWidth  = 950;
			var wHeight = 390;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			
			var object = System.OpenModal(fpath, wWidth, wHeight, features);
	    }
    }
}

function SetTotal()
{
    if (grid.rows > 1)
    {
        var ctrl = grid.GetGridControl();
	    var i = ctrl.rows - 1;
	    lblRecord.SetDataText(i);
    }
    else
    {
        lblRecord.SetDataText(0);
    }
}

function Popup_Type()
{
    var fpath   = System.RootURL + '/standard/forms/ag/ga/agga00090.aspx';
	var wWidth  = 950;
	var wHeight = 580;
	var x = Math.round((screen.availWidth - wWidth)/2);
	var y = Math.round((screen.availHeight - wHeight)/2);
	
	var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
	   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
	   "lef="+ x +",top=" + y;
			
    var object = System.OpenModal(fpath, wWidth, wHeight, features);
}
//----------------------------------------------------------------------------
function OnDataReceive(iObj)
{
    if(iObj.id=='dso_getCompany')
    {
        
    }
    else if(iObj.id=='dso_sel_ap_balance')
    {
	SetTotal();
        var ctrl = grid.GetGridControl();
       ctrl.ColFormat(5) = "###,###,###,###.##R";
        ctrl.ColFormat(6) = "###,###,###,###,###R";
          var i, v_input_qty_sum = 0, v_item_amt_sum = 0;
        for( i = 1; i < grid.rows; i++)
        {
            v_input_qty_sum += Number(grid.GetGridData(i, 5));
            v_item_amt_sum += Number(grid.GetGridData(i, 6));
            if(Trim(grid.GetGridData(i, 7)) == "")
            {
                grid.SetCellBgColor( i, 0, i, grid.cols-1,0xA9EBD7);        
            }
        }    
	   grid.AddRow();
        grid.SetCellBgColor(grid.rows-1, 0, grid.rows-1, grid.cols-1,0xA9EBD7);
        grid.SetGridText(grid.rows - 1, 5, v_input_qty_sum);
        grid.SetGridText(grid.rows - 1, 6, v_item_amt_sum);        
        grid.SetCellBold(grid.rows-1, 0, grid.rows-1, grid.cols-1,true);
  }
}
//----------------------------------------------------------------------------
function onReport()
{
	 var url='';
	 url = '/standard/reports/60/09/rpt_60090120_inq.aspx?p_comp_pk='+lstCompany.value+'&p_date_fr='+dtDate_fr.GetData()+'&p_date_to='+dtDate_to.GetData()+'&p_tco_buspartner_pk='+txtcust_pk.GetData()+'&p_tac_abplcenter_pk='+txtpl_pk.GetData()+'&p_acc_pk='+txtac_pk.GetData()+'&p_slip_no='+txtSlipNo.GetData()+'&p_po_no='+txtPONo.GetData();
	 System.OpenTargetPage( System.RootURL+url , 'newform' ); 

}
</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_sel_ap_balance" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60090120_inq">
                <input bind="grid">
                    <input bind="lstCompany"/>
                     <input bind="dtDate_fr"/>
                     <input bind="dtDate_to"/>
                     <input bind="txtcust_pk"/>                     
                     <input bind="txtpl_pk"/>
                     <input bind="txtac_pk"/>
                     <input bind="txtSlipNo"/>
                     <input bind="txtPONo"/>
					 <input bind="txtItemCode"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>

<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_gfac00100_1" > 
                <input> 
                     <input bind="txtUserPK"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>    
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
<tr style="height:6%">
    <td width="100%">
        <fieldset style="padding:0">
	        <table width="100%" cellpadding="1" cellspacing="1" border="0">                                                                                                                                                                                                                         <tr>
                <tr>
                    <td align="right" width="10%">Company</td>
                    <td colspan="3" width="20%"><gw:list id="lstCompany" onChange="" styles='width:100%'></gw:list></td>
                    <td align="right" width="15%"><a title="Click here to select Customer" onclick="Popup_Cust()" href="#tips">Partner</td>
                    <td colspan="" width="30%">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="35%"><gw:textbox id="txtcust_cd" styles='width:100%'/></td>
                            <td width="65%"><gw:textbox id="txtcust_nm" styles='width:100%'/></td>
                            <td width=""><gw:textbox  id="txtcust_pk" styles='display:none'/></td>
                            <td width=""><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Cust()"/></td>
                        </tr>
                        </table>
                    </td>
				   <td align="right" width="5%"><a title="Click here to select Product Item" onclick="Popup_Item()" href="#tips">Item</a></td>			       
					<td align="left" width="20%" ><gw:textbox id="txtItemCode" text="" styles="width:100%; " /></td>
						
           			<td  width="5%">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width=""><gw:imgbtn id="btnSearch"    img="search" alt="Search"  styles='width:100%' onclick="OnSearch()"/></td>
								<td ><gw:imgbtn id="btnPrint" img="excel" alt="Print as form" text="Print" onclick="onReport()" /></td>
                                <td width=""><gw:imgbtn id="btnPrint"     img="excel" alt="Print"      style='width:100%; display:none;' onclick="OnPrint()"/></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Takein Date</td>
                    <td><gw:datebox id="dtDate_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtDate_to" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="right"><a title="Click here to select Account" onclick="Popup_Acc()" href="#tips">Account</td>
                    <td >
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="35%"><gw:textbox id="txtac_cd" styles='width:100%'/></td>
                            <td width="65%"><gw:textbox id="txtac_nm" styles='width:100%'/></td>
                            <td width=""><gw:textbox  id="txtac_pk" styles='display:none'/></td>
                            <td width=""><gw:imgBtn   img="reset"	id="idResetAcc"  alt="Reset" onclick="Reset_Acc()"/></td>
                        </tr>
                        </table>
                    </td>
                    <td align="right">Slip No</td>
                    <td ><gw:textbox id="txtSlipNo" styles="width:100%" onenterkey="OnSearch()"/></td>
                    <td >
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="right" width="10%">Total</td>
                            <td align="center" width="80%"><gw:label id="lblRecord" text="0" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td> 
			                <td align="left" width="10%">records</td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right"><a title="Click here to select Type" onclick="Popup_Type()" href="#tips">Type</td>
                    <td colspan="3"><gw:list id="lstType" onChange="OnSearch()" value ="" styles='width:100%'></gw:list></td>
                    <td align="right"><a title="Click here to select Profit & Loss(PL)" onclick="Popup_PL()" href="#tips">Profit & Loss(PL)</td>
                    <td >
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="35%"><gw:textbox id="txtpl_cd" styles='width:100%'/></td>
                            <td width="65%"><gw:textbox id="txtpl_nm" styles='width:100%'/></td>
                            <td width=""><gw:textbox  id="txtpl_pk" styles='display:none'/></td>
                            <td width=""><gw:imgBtn   img="reset"	id="idResetPL"  alt="Reset" onclick="Reset_PL()"/></td>
                        </tr>
                        </table>
                    </td>
			        <td align="right">PO No</td>
			        <td><gw:textbox id="txtPONo" styles="width:100%" onenterkey="OnSearch()"/></td>
					
                    <td colspan="2"></td>
                </tr>
            </table>
        </fieldset>
    </td>
</tr>
<tr style="height:94%">
    <td width="100%">
    <!--header  ='0.Slip No|1. PO No|2. Takein Date|3.Item Code|4.Item Name|5.Qty|6.Item Amount|7.Voucherno|8.Partner ID|9.Partner Name-->
        <gw:grid   
		    id="grid"		    
		    header  ='Slip No|PO No|Takein Date|Item code|Item Name|Qty|Item Amount|VoucherNo|PartnerID|Partner Name'
		    format  ='0|0|4|0|0|0|0|0|0|0'
		    aligns  ='0|0|1|1|2|3|3|2|1|2'
		    defaults='|||||||||'
		    editcol ='0|0|0|0|0|0|0|0|0|0'  
		    widths  ='1200|1200|1350|1400|2500|1100|1400|1400|1400|2000'  
		    styles  ='width:100%; height:100%'
		    acceptNullDate="T"
		    sorting ='T' 		    
		    />
    </td>
</tr>
</table>

<gw:list    id="lstBook_ccy" 		 style="display:none"></gw:list>
<gw:textbox id="txtLang"             style="display:none" />
<gw:textbox id="txtUserPK"             style="display:none" />
<gw:textbox id="txtseq" styles="width:100%" style="display:none" />
</body>
</html>
