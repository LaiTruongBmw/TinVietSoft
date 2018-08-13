<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1"  runat="server">
    <title>Takeout Mat Slip(E.B)</title>
</head>

<script>

    var  user_pk        = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name      = "<%=Session("USER_NAME")%>" ;
    var  user_id        = "<%=Session("USER_ID")%>" ;  
var  g_user_pk        = "<%=Session("USER_PK")%>" ;  
    var g_option = '';  
// index of grdDetail
var g_tac_stockmm_pk 		= 0,
	g_tac_hgtrh_pk			= 1,
	g_tco_item_pk			= 2,
	g_ItemCode				= 3,
	g_ItemName				= 4,
	g_Unit					= 5,
	g_Qty					= 6,
	g_Price                 = 7,
	g_TransAmount			= 8,
	g_BookAmount			= 9,
	g_tac_acct_pk			= 10,
	g_Acccode				= 11,
	g_AccName				= 12,
	g_DebitAcc				= 13,
	g_DebitAccNM				= 14,
	g_Description			= 15,
	g_LocalDesc				= 16,
	g_tin_wh_pk				= 17,
	g_WH					= 18,
	g_tac_abpl_pk			= 19,
	g_PLCode				= 20,
	g_PLName				= 21;	
		
//-----------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    OnFormatGrid();
    var ls_today = dtTo.value ;
    var lmonth = ls_today.substring(0,6);
    dtFrom.value = lmonth + '01';
    // set trang thai cua cac nut
    btnMakeSlip.SetEnable(true);
    btnCancelSlip.SetEnable(true);        
    btnSearch.SetEnable(true);
    // 
    OnFormatGrid();
}
//-----------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);    
    var ls_trtype_pk, ls_trtype_code, ls_trtype_nm, ls_slipremarkeng , ls_slipremarklocal ;
    ls_trtype_pk = "<%=CtlLib.SetDataSQL("select pk from tac_abtrtype where TRIM(TR_TYPE) = 'Y010' and del_if = 0 ")%>";
    ls_trtype_code = 'Y010';
    ls_trtype_nm = "<%=CtlLib.SetDataSQL("select TR_TPNM from tac_abtrtype where TRIM(TR_TYPE) = 'Y010' and del_if = 0 ")%>";
    ls_slipremarkeng = "<%=CtlLib.SetDataSQL("select SLIPREMARKENG from tac_abtrtype where TRIM(TR_TYPE) = 'Y010' and del_if = 0 ")%>";
    ls_slipremarklocal = "<%=CtlLib.SetDataSQL("select SLIPREMARKLOCAL from tac_abtrtype where TRIM(TR_TYPE) = 'Y010' and del_if = 0 ")%>";
    var l_book_ccy = "<%=CtlLib.SetDataSQL("select a.code from tco_abcode a, TCO_ABCODEGRP b where a.del_if = 0 and b.del_if = 0 and a.TCO_ABCODEGRP_PK = b.PK and B.ID = 'ACBG0040' and a.def_yn = 'Y' ")%>";
	ls_data = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0130' AND M.DEL_IF = 0 AND D.DEL_IF = 0 and d.use_yn='Y' and M.TCO_COMPANY_PK='"+ Session("COMPANY_PK") +"'  ORDER BY ORD")%>"; 
	lstVoucherType.SetDataText(ls_data);
	lstVoucherType.value = "XNL";
    txtCurr.text = l_book_ccy ;
    txtTransCD.text     = "Y010";
    txtTransNM.text     = ls_trtype_nm;
    txtTrans_PK.text    = ls_trtype_pk;
    txtDesc.text        = ls_slipremarkeng;
    txtLocalDesc.text   = ls_slipremarklocal;    
    txtTransCD.SetEnable(false);
    txtTransNM.SetEnable(false); 
    txtDRACC_CD.SetEnable(false); 
    txtDRACC_NM.SetEnable(false);
    txtCurr.SetEnable(false);        
    // option: Month, Day, Period
    g_option = "<%=CtlLib.SetDataSQL("select d.code from tac_commcode_detail d, tac_commcode_master a where a.pk =  d.tac_commcode_master_pk and a.del_if = 0 and d.del_if = 0 and a.id = 'ACBG0184' and d.def_yn = 'Y' ")%>";
    lstOption.value = g_option;
	txtUser_Pk.text = g_user_pk ;
	dso_getCompany.Call();
}
//-----------------------------------------------------
function OnPopup(iObj)
{
    switch(iObj)
    {
        case 'Trans Type':
            var path = System.RootURL + '/standard/forms/gf/hg/gfhg00010_transaction.aspx?compk='+ lstCompany.value;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if( object != null )
            {
		        var tmp = object[0];
		        if (tmp[1] != null)
		        {
		            txtTransCD.text     = tmp[1];
		            txtTransNM.text     = tmp[2];
		            txtTrans_PK.text    = tmp[0];
		            txtDesc.text        = tmp[3];
		            txtLocalDesc.text   = tmp[4];
                }                
            }                        
        break ;
        case 'Debit Account':
			//standard/forms/60/05/60050010_popup_new.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txtTransCode.text + "&val1=" + txtTransName.text + "&val2=D" + "&val3=" + lstCompany.value + "&dsqlid=ac_sel_60170130_acc_new_drcr" ;
            var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_new.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txtTransCD.text + "&val1=" + txtTransNM.text + "&val2=D" + "&val3=" + lstCompany.value + "&dsqlid=ac_sel_60170130_acc_new_drcr" ;
            var object      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	        
            if(object!=null)
            {               
                var tmp = object[0];
                if( tmp != null && Trim(tmp[1]) != '' )
                {
                    txtDRACC_CD.text = tmp[4];
                    txtDRACC_NM.text = tmp[5];
                    txtDebit_PK.text = tmp[1] ;                    
                }
            }                                    
        break ;
        case 'PL':
		var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                txtPLPK.text = object[2]; 		// PL_PK
                txtPLCD.text = object[0] ;     // PL Code
                txtPLNM.text = object[1];     // PL Name
            }            
        }        
        break ;
    }        
}
//-----------------------------------------------------
function OnSearch(iObj)
{   
    switch(iObj)
    {
        case "1":
            cons_mapping_master.Call("SELECT");
			grdDetail.ClearData();
        break ;
    }    
}
//-----------------------------------------------------
function OnFormatGrid()
{
    var ctrl                                = grdDetail.GetGridControl();
	if(txtCurr.text = "VND")
	{
		ctrl.ColFormat(g_TransAmount)              			= "###,###,###,###,###R";
		ctrl.ColFormat(g_BookAmount)            			= "###,###,###,###,###R";	
    }
	else
	{
		ctrl.ColFormat(g_TransAmount)              			= "###,###,###,###,###.##R";
		ctrl.ColFormat(g_BookAmount)            			= "###,###,###,###,###R";
	}		
    ctrl.ColFormat(g_Qty)                 					= "###,###,###,###,###.#####R";
}
//-----------------------------------------------------
function OnDataReceive(iObj)
{
    switch(iObj.id)
    {
        case "consum_omcost_pricer":
            SetParentPK(); // gan tac_omcost_pricer_pk 
            cons_mapping_detail_2.Call();            
        break ;
        case 'cons_mapping_detail':
            OnFormatGrid();
        break ;
        case 'consum_makeslip':
            //alert(txtReturn.text);            
            cons_mapping_master.Call("SELECT");
        break ;
        case 'consum_cancelslip':
            //alert(txtReturn.text);
            cons_mapping_master.Call("SELECT");
        break ;
        case 'consum_cancelconsum':
            //alert(txtReturn.text);
            if(p_consum == 1)
            {
                cons_mapping_master.Call('SELECT');
            }
        break ;
        case 'cons_mapping_detail_2':
            if(p_consum == 1)
            {
                cons_mapping_master.Call('SELECT');
            }
            p_consum = 0;
        break ;
    }
}
//-----------------------------------------------------
function OnDtlPopup()
{
    var lrow = event.row ;
    var lcol = event.col;
    var i ;
    if(lcol == g_Acccode)
    {        
        var fpath   = System.RootURL + "/standard/forms/gf/co/ffco002004.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txtTransCD.text + "&val1=" + txtTransNM.text + "&val2=D" + "&val3=" + lstCompany.value + "&dsqlid=SP_SEL_ACCOUNT_NEW_DRCR" ;
        var object      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	        
        if(object!=null)
        {               
            var tmp = object[0];
            if( tmp != null && Trim(tmp[1]) != '' )
            {
                grdDetail.SetGridText(lrow, g_tac_acct_pk, tmp[1]);
                grdDetail.SetGridText(lrow, g_Acccode, tmp[4]);
                grdDetail.SetGridText(lrow, g_AccName, tmp[5]);
            }
        }                                            
    }
    else if(lcol == g_PLCode)
    {
		var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                grdDetail.SetGridText(lrow, g_tac_abpl_pk, object[2]);
                grdDetail.SetGridText(lrow, g_PLCode, object[0]);
                grdDetail.SetGridText(lrow, g_PLName, object[1]);
            }            
        }            
    }
}
//-----------------------------------------------------
function OnConsumption()
{
    if(Trim(txtDebit_PK.text)=="")
    {
        alert('Please choose the debit account');
        return;
    }
    p_consum = 1;
    // double click de chon dong can make slip
    consum_omcost_pricer.Call();            
}
//-----------------------------------------------------
function OnShowConSum()
{
    var ls_tachgtrh_pk = grdSearch.GetGridData(grdSearch.row, 2);
//    if(Trim(ls_tachgtrh_pk) != "")
//    {
//        btnMakeSlip.SetEnable(false);
//        btnCancelSlip.SetEnable(true);        
//    }
//    else
//    {
//        btnMakeSlip.SetEnable(true);
//        btnCancelSlip.SetEnable(false);            
//    }
    txtTac_hgtrh_pk.text = ls_tachgtrh_pk;
    dtTransDate.value = grdSearch.GetGridData(grdSearch.row, 1); // trans date
    txtVoucherNo_2.text = grdSearch.GetGridData(grdSearch.row, 0); // voucher no
    cons_mapping_detail.Call("SELECT");       
}
//-----------------------------------------------------
function OnCancelSlip()
{
    if(grdSearch.row > 0)
    {
        txttac_omcost_pricer_pk.text = grdSearch.GetGridData(grdSearch.row, 4);
        txtTac_hgtrh_pk.text = grdSearch.GetGridData(grdSearch.row, 2);
        grdDetail.ClearData();
        consum_cancelslip.Call();            
    }    
}
//-----------------------------------------------------
function OnShowTAccount()
{
    var lcol = event.col;
    var lrow = event.row ;
    if(lrow < 1)
        return ;
    if( lcol == 2 && Trim(grdSearch.GetGridData(lrow, lcol)) != '' )
    {
        var pk = grdSearch.GetGridData(lrow, 2);
        var status = grdSearch.GetGridData(lrow, 3);

        var fpath = System.RootURL + '/standard/forms/gf/br/gfbr00030_popup.aspx?PK_ROW=' + pk + '&APPRCANCEL=' + status;
        var wWidth = 950;
        var wHeight = 565;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
        "lef="+ x +",top=" + y;

        var object = System.OpenModal(fpath, wWidth, wHeight, features);                        
    }            
}
//-----------------------------------------------------
function OnCancelConsumption()
{
    p_consum = 1;
    txttac_omcost_pricer_pk.text = grdSearch.GetGridData(grdSearch.row, 4);
    consum_cancelconsum.Call();
}
//-----------------------------------------------------
function OnMakeSlip()
{
   
    if(g_option == '2')
    {
        var fpath = System.RootURL + '/standard/forms/fm/gf/fmgf00131_makeslip.aspx';
        var wWidth = 500;
        var wHeight = 260;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
        "lef="+ x +",top=" + y;

        var object = System.OpenModal(fpath, wWidth, wHeight, features);                        
        if(object != null )
        {
           txttrans_dt.SetDataText(object[0]);
           txttrans_dt_TO.SetDataText(object[1]);
           consum_makeslip.Call();
        }
    }
    else
    {
        if(confirm('Are you sure you want to make slip?'))
        {
            var v_tr_date_fr = "", v_tr_date_to = "";
            v_tr_date_fr = dtTransDate.value ;
            txttrans_dt.SetDataText(v_tr_date_fr);
            txttrans_dt_TO.SetDataText( dtTransDate.value);
			//alert(dtTransDate.value);
	        consum_makeslip.Call();
        }	        
    }	   
}
//-----------------------------------------------------
function OnCancelSlip()
{
	consum_cancelslip.Call();
}
//-----------------------------------------------------
function OnFormatGrid()
{
    var fg = grdDetail.GetGridControl();
    fg.ColFormat(6) = "###,###,###,###.###R";
    fg.ColFormat(7) = "###,###,###,###R";
    fg.ColFormat(8) = "###,###,###,###R";
}
//-----------------------------------------------------
function OnPrintAcctSlip()
{
    if(grdSearch.row > 0)
    {        
        var l_seq = grdSearch.GetGridData(grdSearch.row, 2) ;// Seq    
        if(l_seq != "")
        {
             var url =System.RootURL + '/standard/reports/gf/hg/60080010_envn.aspx?seq=' + l_seq ;
             System.OpenTargetPage( url , 'newform' );     
        }             
    }         
}
//-----------------------------------------------------
</script>
<body>
<!-------------------------------------------------------->
<gw:data id="cons_mapping_master" onreceive=""> 
    <xml> 
        <dso type="grid" function="ac_60170140_sel_consum" > 
            <input bind="grdSearch" > 
				 <input bind="lstVoucherType" /> 	
                 <input bind="dtFrom" />
                 <input bind="dtTo" /> 
                 <input bind="txtSeq" /> 
                 <input bind="txtVoucherNo" />    
                 <input bind="lstCompany" />             
             </input> 
            <output bind="grdSearch" /> 
        </dso> 
    </xml> 
</gw:data>
<!---------------------------------------------------Ta----->
<gw:data id="cons_mapping_detail" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="grid" function="ac_sel_60170140_detail"  > 
            <input bind="grdDetail" > 
                    <input bind="txtTac_hgtrh_pk" /> 
             </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>
<!-------------------------------------------------------->
 <gw:data id="consum_makeslip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60170140_makeslip">
                <input> 
                     <input bind="lstCompany" />
                     <input bind="txttrans_dt" />				
                     <input bind="txttrans_dt_TO" />					 
                     <input bind="txtDebit_PK" />					 
                     <input bind="txtTrans_PK" />
					 <input bind="lstVoucherType" />
					 <input bind="chkAuto_YN" />
					 <input bind="txtVoucherNo_2" />
					 <input bind="txtDesc" />
					 <input bind="txtLocalDesc" />	
					 <input bind="txtCurr" />				
					 <input bind="lstOption" />	 	 
                </input>
                <output>
                    <output bind="txtReturn" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------------------------->
 <gw:data id="consum_cancelslip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="sp_pro_fmgf00131_1">
                <input>                      
                     <input bind="txtTac_hgtrh_pk" />
                </input>
                <output>
                    <output bind="txtReturn" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------------------------->
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
<!-------------------------------------------------------->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%" >
        <tr>
            <td>
                <table border="1" cellpadding="0" cellspacing="0" width="100%" height="100%" >
                    <tr>
                        <td style="width:22%; ">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%" >
                                <tr>
                                    <td style="width:36%;"></td>
                                    <td style="width:30%;"></td>
                                    <td style="width:4%;"></td>
                                    <td style="width:30%;"></td>
                                </tr>
                                <tr style="height:5%" >
                                    <td align="right">Trans Date</td>
                                    <td align="left"><gw:datebox id="dtFrom" lang="1" styles="width:100%" /></td>
                                    <td align="center">~</td>
                                    <td align="right"><gw:datebox id="dtTo" lang="1" styles="width:100%" /></td>                                
                                </tr>
                                <tr style="height:5%" >
                                    <td align="right">Seq&nbsp;</td>
                                    <td align="left" colspan="2" ><gw:textbox id="txtSeq" styles="width:100%" /></td>
                                    <td align="right"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('1')" /></td>                                
                                </tr>
                                <tr style="height:5%" >
                                    <td align="right">Voucher No&nbsp;</td>
                                    <td align="left" colspan="3" ><gw:textbox id="txtVoucherNo" styles="width:100%" /></td>
                                </tr>
                                <tr style="height:85%">
                                    <td colspan="4">
                                        <gw:grid id="grdSearch"
                                        header="Voucher No|Trans Date|Seq|_Status|_tac_omcost_pricer_pk"
                                        format="0|4|0|0|0"
                                        aligns="0|1|1|2|0"
                                        defaults="||||" 
                                        editcol="1|1|1|1|0"
                                        widths="2000|1200|1500|1000|0"
                                        acceptNullDate="T"
                                        sorting="T" 
                                        styles="width:100%; height:100%"
                                        oncellclick="OnShowConSum()"
                                        oncelldblclick = "OnShowTAccount()"  />                                                                                              
                                    </td>
                                </tr>
                            </table>    
                        </td>
                        <td style="width:78%; ">			                        
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%" >
                                <tr>
                                    <td style="width:8%; "></td>
                                    <td style="width:14%; "></td>
                                    <td style="width:8%; "></td>
                                    <td style="width:8%; "></td>
                                    <td style="width:17%; "></td>
                                    <td style="width:9%; "></td>
                                    <td style="width:8%; "></td>
                                    <td style="width:17%; "></td>
                                    <td style="width:6%; "></td>
                                    <td style="width:2%; "></td>
                                    <td style="width:3%; "></td>
                                </tr>
                                <tr style="height:5%" >
                                    <td align="right">Company</td> 
                                    <td align="left" ><gw:list id="lstCompany" styles="width:100%" /></td>
                                    <td align="right" ><a title="Click to select transaction type" onclick="OnPopup('Trans Type')" href="#tips" >Trans Type</a></td>
                                    <td align="right"><gw:textbox id="txtTransCD" text="" styles="width:100%; " csstype="mandatory" /></td>
                                    <td align="right"><gw:textbox id="txtTransNM" text="" styles="width:100%" csstype="mandatory" /></td>
                                    <td align="right" ><a title="Click here to select Debit Account" onclick="OnPopup('Debit Account')" href="#tips" >Debit Account</a></td>
                                    <td align="right"><gw:textbox id="txtDRACC_CD" text="" styles="width:100%" csstype="mandatory" /></td>
                                    <td align="right"><gw:textbox id="txtDRACC_NM" text="" styles="width:100%" csstype="mandatory" /></td>                        
                                    <td align="right"><gw:icon id="btnMakeSlip" text="Make Slip" onclick="OnMakeSlip()" /></td>
                                    <td align="right" colspan="2"><gw:icon id="btnCancelSlip" text="Cancel Slip" onclick="OnCancelSlip()" /></td>                                
                                </tr>
                                <tr style="height:5%">
                                    <td align="right">Trans Date</td> 
                                    <td align="left" ><gw:datebox id="dtTransDate" lang="1" styles="width:100%" /></td>
                                    <td align="right" >Description</td>                        
                                    <td align="right" colspan="2" ><gw:textbox id="txtDesc" text="" styles="width:100%" /></td>                        
                                    <td align="right" >Local Desc</td>
                                    <td align="right" colspan="2" ><gw:textbox id="txtLocalDesc" text="" styles="width:100%" /></td>                        
                                    <td align="right"><gw:imgBtn id="btnPrinter" img="printer" alt="Accounting Slip" onclick="OnPrintAcctSlip()" /></td>
                                </tr>
                                <tr style="height:5%">
                                    <td align="right">Voucher Type</td>
                                    <td align="left"><gw:list id="lstVoucherType" styles="width:100%" /></td>									
									<td align="right">Voucher No</td>									
									<td align="right"><gw:checkbox id="chkAuto_YN" value='T' styles="width:100%" /></td>
									<td align="right"><gw:textbox id="txtVoucherNo_2" styles="width:100%" /></td>
                                    <td align="right"><a title="Click here to select PL" href="#tips" onclick="OnPopup('PL')" >PL</a></td>
                                    <td align="left"><gw:textbox id="txtPLCD" styles="width:100%" /></td>
                                    <td align="left"><gw:textbox id="txtPLNM" styles="width:100%" /></td>                                    
                                    <td align="right">Book Ccy</td>
                                    <td align="left"><gw:textbox id="txtCurr" styles="width:100%" /></td>									
                                </tr>
                                <tr style="height:85%">
                                    <td colspan="11">
                                        <gw:grid id="grdDetail"
                                        header="_tac_stockmm_pk|_tac_hgtrh_pk|_tco_item_pk|Item Code|Item Name|Unit|Q'ty|UPrice|Trans Amount|Book Amount|_tac_acct_pk|Acc. code|Acc. Name|Debit Acc|Debit Acc|Description|Local Desc|_tin_wh_pk|WH|_tac_abpl_pk|PL Code|PL Name"
                                        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        aligns='0|0|0|1|0|1|3|3|3|3|0|0|0|0|0|0|0|0|0'
                                        defaults='||||||||||||||||||' 
                                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        widths='0|0|0|1600|2500|800|1500|800|1800|1800|1200|1800|2000|2000|0|1500|0|1400|2000'
                                        acceptNullDate='T'										
                                        sorting='T' styles='width:100%; height:100%'
                                        oncellclick = "OnSearch()"                                                                                                                             
                                        oncelldblclick="OnDtlPopup()"                                     
                                        />                                                                                                                                  
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
    </table>    
    <gw:textbox id="txtTrans_PK" styles="display:none" />    
    <gw:textbox id="txtDebit_PK" styles="display:none" />    
    <gw:textbox id="txtTac_hgtrh_pk" styles="display:none" />    
    <gw:textbox id="txttac_omcost_pricer_pk" styles="display:none" />    
    <gw:textbox id="txtPLPK" styles="display:none" />
    <gw:textbox id="txtReturn" styles="display:none" />
    <gw:textbox id="txttrans_dt" styles="display:none" />
    <gw:textbox id="txttrans_dt_TO" styles="display:" />
    <gw:list id="lstOption" styles="display:none" >
        <data>DATA|0|Month|1|Day|2|Period</data>
    </gw:list>
	<gw:textbox id="txtUser_Pk" styles="display:none" />
</body>
</html>
