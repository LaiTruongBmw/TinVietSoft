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

var c_crdad_pk =0,
    c_seq       =1,
    c_slip_no   =2,
    c_po_no     =3,
    c_in_date   =4,
    c_item_cd   =5,
    c_item_nm   =6,
    c_input_qty =7,
    c_voucher_no =8,   
    c_other_seq     =9,
    c_AP_qty        =10,
    c_unit_price    =11,
    c_trans_amt     =12,
    c_book_amt      =13,
    c_ap_trans_amt  = 14,
    c_ap_book_amt   = 15,
    c_tr_diff_amt   = 16,
    c_book_diff_amt = 17,
    c_serial_no     = 18,
    c_invoice_dt    = 19,
    c_invoice_no    = 20,
    c_tax_rate      = 21,
    c_clear_yn      = 22,
    c_partner_pk    = 23,
    c_partner_id    =   24,
    c_partner_nm    =   25,
    c_pl_pk         =   26,
    c_pl_nm         = 27,
    c_warehouse     = 28,
    c_trans_dt      = 29,
    c_acc_code_pk   = 30,
    c_acc_cd        = 31,
    c_acc_nm        = 32,
    c_AP_seq        = 33;
    
function BodyInit()
{
    lang = "<%=Session("SESSION_LANG")%>";
    g_company_pk = "<%=Session("COMPANY_PK")%>";
    g_user_pk = "<%=Session("USER_PK")%>";

    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_current     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
	var ls_date        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
	var ls_Book_ccy    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
	var ls_date1        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
	var ls_Type = "DATA|PAY|Payable|PAID|Payment";
	var ls_Report_Type = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK047') FROM DUAL ")%>";	
    	
    lstCompany.SetDataText(ls_data);
    lstCompany.value = g_company_pk ;
    dtPay_duefr.SetDataText(ls_date_fr);
    lstBook_ccy.SetDataText(ls_Book_ccy);
    txtLang.SetDataText(lang);
   
    txtcust_nm.SetEnable(false);
    txtpl_nm.SetEnable(false);
    
    var ctr =  grid.GetGridControl();
   ctr.FrozenCols = c_po_no;
    
    SetGridData();
    txtUserPK.SetDataText(g_user_pk);
    dso_getCompany.Call();
}

function OnAfterInputAmt()
{
    var col, row;
    col = event.col;
    row = event.row;
    if(col == c_ap_trans_amt|| col == c_ap_book_amt)
    {
        var tran_diff = Number(grid.GetGridData(row,c_trans_amt))-Number(grid.GetGridData(row,c_ap_trans_amt));
        var book_diff =  Number(grid.GetGridData(row,c_book_amt))-Number(grid.GetGridData(row,c_ap_book_amt))
        grid.SetGridText(row,c_tr_diff_amt,tran_diff);
        grid.SetGridText(row,c_book_diff_amt,book_diff);
    }
    
}

function GetPeriod()
{
    dso_get_period.Call();
}

function Popup_Cust()
{
    var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk=' + lstCompany.GetData();
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
    if ( object != null )
    {
        if (object[1] != 0)
        {
            txtcust_pk.text    = object[0];
            txtcust_nm.text    = object[2];
            txtcust_cd.text    = object[1];
            GetPeriod();
        }
    }
}

function Reset_Cust()
{
    txtcust_cd.SetDataText("");
    txtcust_nm.SetDataText("");
    txtcust_pk.SetDataText("");
}

function Popup_PL()
{
    var path = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?dsqlid=ac_sel_pl_popup_plpk&company=" + lstCompany.value + "&col_code=PL Code&col_nm=PL Name" ;
    var object = System.OpenModal(path , 600 , 500 , 'resizable:yes;status:yes'); 
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

function OnSearch()
{
    if(txtcust_pk.text =="")
    {
        alert("Please select partner first! \n Vui lòng chọn nhà cung cấp trước!")
    }else
    {
        dso_60090200.Call('SELECT');
    }
    
}
//-------------------------------
function OnSave()
{
    dso_60090200.Call();
}

function SetGridData()
{
    var fg  = grid.GetGridControl();
        
    if (lstBook_ccy.GetData() == 'VND')
    {
        fg.ColFormat(c_book_amt)    = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(c_ap_book_amt)    = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(c_book_diff_amt)    = "#,###,###,###,###,###,###,###,###.##R";

    }
    else
    {
        fg.ColFormat(c_book_amt)    = "#,###,###,###,###,###,###,###,###,###R"; 
        fg.ColFormat(c_ap_book_amt)    = "#,###,###,###,###,###,###,###,###,##R";       
        fg.ColFormat(c_book_diff_amt)    = "#,###,###,###,###,###,###,###,###,##R"; 
     }
        fg.ColFormat(c_input_qty) = "###,###,###,###";
        fg.ColFormat(c_AP_qty) = "###,###,###,###";
        fg.ColFormat(c_unit_price) = "###,###,###,###.##R";
        fg.ColFormat(c_trans_amt) = "###,###,###,###.##R";  
        fg.ColFormat(c_ap_trans_amt) = "###,###,###,###.##R";  
        fg.ColFormat(c_tr_diff_amt) = "###,###,###,###.##R";  
}
//-----------------------------------------
function SetValueToGrid()
{
     var ctrl  = grid.GetGridControl();
     var idx =0;
     for(i=0;i<ctrl.SelectedRows;i++)
		{
			 idx = ctrl.SelectedRow(i);	
			 if(grid.GetGridData(idx,c_clear_yn)=='N')
			 {
			    grid.SetGridText(idx,c_serial_no,txtSerialNo.text);
			    grid.SetGridText(idx,c_invoice_dt,dtInvoiceDT.value);
			    grid.SetGridText(idx,c_invoice_no,txtSerialNo.text);
			 }
	    }

}
//----------------------------------------------
function OnProcess()
{
    dso_APClear_process.Call();
}

function OnCancel()
{
    dso_APClear_cancel.Call();
}


function Popup_Acc()
{
  
   var fpath =System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=AC_SEL_ACCT_POPUP";
	o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;')
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

function Reset_Acc()
{
    txtac_cd.SetDataText("");
	txtac_nm.SetDataText("");
	txtac_pk.SetDataText("");
}

function OnPopup()
{
   
}

function SetTotal()
{
    if (grid.rows > 1)
    {
        var ctrl = grid.GetGridControl();
	    var i = ctrl.rows - 1;
	    //lblRecord.SetDataText(i);
    }
    else
    {
        //lblRecord.SetDataText(0);
    }
}

//----------------------------------------------------------------------------
function OnDataReceive(iObj)
{
    if(iObj.id=='dso_60090200')
    {
        if (grid.rows >1 )
        {
        var i, v_qty = 0,  v_tot_tr_famt = 0, v_tot_tr_amt = 0,v_tot_clear_famt = 0, v_tot_clear_amt = 0,v_tot_diff_famt = 0, v_tot_diff_amt = 0;
        for( i = 1; i < grid.rows; i++)
        {
            v_tot_tr_famt += Number(grid.GetGridData(i, c_book_amt));
            v_tot_tr_amt += Number(grid.GetGridData(i, c_trans_amt));
            
            v_tot_clear_famt += Number(grid.GetGridData(i, c_ap_book_amt));
            v_tot_clear_amt += Number(grid.GetGridData(i, c_ap_trans_amt));
            
            v_tot_diff_famt += Number(grid.GetGridData(i, c_book_diff_amt));
            v_tot_diff_amt += Number(grid.GetGridData(i, c_tr_diff_amt));
            
            v_qty += Number(grid.GetGridData(i, c_AP_qty));
           
        }          
        grid.SetCellBgColor( 1, c_slip_no, grid.rows-1, c_input_qty,0xA9EBD7);        
        grid.SetCellBgColor( 1, c_ap_trans_amt, grid.rows-1, c_clear_yn,0x66ffff);
        grid.SetCellBgColor( 1, c_AP_seq, grid.rows-1, c_AP_seq,0x66ffff);
        
        grid.AddRow();
        grid.SetCellBgColor(grid.rows-1, 0, grid.rows-1, grid.cols-1,0x99CCFF);
        grid.SetGridText(grid.rows - 1, c_book_amt, v_tot_tr_famt);
        grid.SetGridText(grid.rows - 1, c_trans_amt, v_tot_tr_amt);  
         
        grid.SetGridText(grid.rows - 1, c_ap_book_amt, v_tot_clear_famt);
        grid.SetGridText(grid.rows - 1, c_ap_trans_amt, v_tot_clear_amt);  
        
        grid.SetGridText(grid.rows - 1, c_tr_diff_amt, v_tot_diff_amt);
        grid.SetGridText(grid.rows - 1, c_book_diff_amt, v_tot_diff_famt);        
        
        grid.SetGridText(grid.rows - 1, c_AP_qty, v_qty);
        grid.SetCellBold(grid.rows-1, 0, grid.rows-1, grid.cols-1,true);
        }
    }
    if(iObj.id=='dso_APClear_cancel')
    {
         dso_60090200.Call('SELECT')
        alert(txtReturn.text);
    }
     if(iObj.id=='dso_APClear_process')
    {
        dso_60090200.Call('SELECT')
        alert(txtReturn.text);
    }
}
//----------------------------------------------------------------------------
function OnPrintReport()
{
    if(txtcust_pk.text =="")
    {
        alert("Please,select a partner!")
    }else
    {
     var url = System.RootURL + '/standard/reports/60/09/rpt_60090200_pkt2.aspx?p_company_pk='+lstCompany.value+'&partner_pk='+txtcust_pk.text+'&from_date='+dtPay_duefr.value+'&to_date='+dtPay_dueto.value; 
     System.OpenTargetPage( url , 'newform' );
    }
}
//----------------------------------------------------------------------------
</script>
<body style="margin:0; padding:0;">

     <gw:data id="dso_APClear_process" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_60090200_process"> 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="txtcust_pk"/>
                     <input bind="dtPay_duefr"/>
                     <input bind="dtPay_dueto"/>                   
                     <input bind="txtUserPK"/>
                </input>
                <output>
                     <output bind="txtReturn"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    <body style="margin:0; padding:0;">

     <gw:data id="dso_APClear_cancel" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_60090200_cancel"> 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="txtcust_pk"/>
                     <input bind="dtPay_duefr"/>
                     <input bind="dtPay_dueto"/>                   
                     <input bind="txtUserPK"/>
                </input>
                <output>
                     <output bind="txtReturn"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
     <gw:data id="dso_get_period" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_60090200_period"> 
                <input> 
                     <input bind="txtcust_pk"/>
                     <input bind="dtMonth"/>
                </input>
                <output>
                     <output bind="dtPay_duefr"/>
                     <output bind="dtPay_dueto"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_60090200" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_SEL_60090200" parameter="0,14,15,16,17,18,19,20,21" procedure="ac_UPD_60090200">
                <input bind="grid">
                    <input bind="lstCompany"/>
                     <input bind="dtPay_duefr"/>
                     <input bind="dtPay_dueto"/>
                     <input bind="txtcust_pk"/>                     
                     <input bind="txtpl_pk"/>
                     <input bind="txtPO_no"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>

<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
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
                    <td width="20%"><gw:list id="lstCompany" onChange="" styles='width:100%'></gw:list></td>
                    <td align="right" width="10%"><a title="Click here to select Customer" onclick="Popup_Cust()" href="#tips">Partner</td>
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
                    <td></td>
                    <td  colspan="2">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width=""><gw:imgbtn id="btnSearch"    img="search" alt="Search"  styles='width:100%' onclick="OnSearch()"/></td>
                                <td width=""><gw:imgbtn id="btnSave"     img="save" alt="save"      style='width:100%; ' onclick="OnSave()"/></td>
                                <td width=""><gw:imgbtn id="btnExcel"    img="excel" alt="Search"  styles='width:100%' onclick="OnPrintReport()"/></td>
                                <td width=""><gw:icon id="btnUpload"     text="Upload" alt="Upload"      style='width:100%; ' onclick="OnUpload()"/></td>
                                <td width=""><gw:imgbtn id="btnProcess"    img="process" alt="Process"      style='width:100%;' onclick="OnProcess()"/></td>
                                <td width=""><gw:imgbtn id="btnCancel"     img="cancel" alt="Cancel"      style='width:100%; ' onclick="OnCancel()"/></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="10%">Trans Date</td>                    
                    <td width="20%">
                         <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="20%"><gw:datebox id="dtMonth" 	onchange="GetPeriod()" styles='width:100%' type="month" lang="1"/></td>
                                <td width="10%"></td>
                                <td width="20%"><gw:datebox id="dtPay_duefr" 	onchange="" styles='width:100%' lang="1"/></td>
                                <td width="5%">~</td>
                                <td width="20%"><gw:datebox id="dtPay_dueto" 	onchange="" styles='width:100%' lang="1"/></td>
                            </tr>
                        </table>
                    </td>
                    <td align="right" width="10%"><a title="Click here to select PL" onclick="Popup_PL()" href="#tips">PL</td>                  
                    <td width="30%">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="35%"><gw:textbox id="txtpl_cd" styles='width:100%'/></td>
                                <td width="65%"><gw:textbox id="txtpl_nm" styles='width:100%'/></td>
                                <td width="5%"><gw:textbox  id="txtpl_pk" styles='display:none'/></td>
                                <td width="5%"><gw:imgBtn   img="reset"	id="idResetPL"  alt="Reset" onclick="Reset_PL()"/></td>
                            </tr>
                        </table>
                    </td>
                    <td align="right" width="10%">Po No</td>
                    <td width="20%"><gw:textbox id="txtPO_no" styles="width:100%" onenterkey="OnSearch()"/></td>                    
                </tr>
                <tr>
                    <td colspan="10" style="width:100%">
                        <table  style="height:100%;width:100%; background-color:99ffff" >
                            <tr style="height:100%">   
                                <td align="right" width="10%">Serial No</td>
                                <td width="15%"> <gw:textbox id="txtSerialNo" styles="width:100%" onenterkey="OnSearch()"/></td>
                                <td align="right" width="10%">Invoice Dt</td>
                                <td width="15%"><gw:datebox id="dtInvoiceDT" 	onchange="" styles='width:100%' lang="1"/></td>
                                <td align="right" width="10%">Invoice No</td>
			                    <td width="15%"><gw:textbox id="txtinvoice" styles="width:100%" onenterkey="OnSearch()"/></td>  
			                     <td width="25%" align="left"><gw:icon text ="Set Grid" id="idSet"  alt="Set Data to Grid" onclick="SetValueToGrid()"/></td>
                            </tr>
                        </table>
                    </td>
                              
                </tr>
            </table>
        </fieldset>
    </td>
</tr>
<tr style="height:94%">
    <td width="100%">
    <!--header  ='0.Row|1.Seq|2.Voucher No|3.Trans Date|4.Trans Amt|5.Book Amt|6.Seq|7.Voucher No|8.Pay Date|9.Trans Amt|10.Book Amt|11.Partner Code|12.Partner Name|13.Description|14.Local Description'-->
    
        <gw:grid id='grid'
            header='_TAC_CRDAD_OTHER_PK|SEQ|Slip No|Ref No|In Date|Item CD|Item Name|Input Qty|Voucher No|SEQ|AP Qty|Unit Price|Tran AMT|Book AMT|AP Tran AMT|AP Book AMT|Diff AMT|Book Diff AMT|Serial No|Invoice Dt|Invoice No|Tax Rate|Clear YN|_TCO_BUSPARTNER_PK|Partner ID|Partner NM|_PLCENTER_PK|PL Nm|Ware House|Trans Dt|_TAC_ABACCTCODE_PK|ACC CD|ACC Nm|AP SEQ'
            format='0|0|0|0|4|0|0|1|0|0|1|1|1|1|1|1|1|1|0|4|0|0|0|0|0|0|0|0|0|4|0|0|0|0'
            aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0'
            check='|||||||||||||||||||||||||||||||||'
            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|0|0|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0'
            widths='0|800|1500|1000|1200|1500|2000|1500|1500|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1200|1500|1500|800|0|0|2000|0|2000|2000|1200|0|1000|1500|1000'
            sorting='T'
            acceptNullDate="T"
            oncelldblclick="OnPopup()"
            onafteredit = "OnAfterInputAmt()"
            styles='width:100%; height:100%'
         />
    </td>
</tr>
</table>

<gw:list    id="lstBook_ccy" 		 style="display:none"></gw:list>
<gw:textbox id="txtLang"             style="display:none" />
<gw:textbox id="txtReturn"             style="display:none" />
<gw:textbox id="txtUserPK"             style="display:none" />
</body>
</html>