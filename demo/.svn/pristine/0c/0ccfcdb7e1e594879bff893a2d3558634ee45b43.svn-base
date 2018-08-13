<%  CtlLib.SetUser("genuwin")%>
<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
   <%  CtlLib.SetUser(Session("APP_DBUSER"))%> 
<script>

function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_date_to     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
    
    <%=CtlLib.SetGridColumnComboFormat("grid", 2,"SELECT A.CODE, A.CODE_NM FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TAC_COMMCODE_MASTER_PK = B.PK AND B.ID = 'EACAB030'  ORDER BY A.CODE")%>;
    
    lstCompany.SetDataText(ls_data);
    lblRecord.SetDataText("0");
    dtApp_fr.SetDataText(ls_date_fr);
    dtApp_to.SetDataText(ls_date_to);
    txtuser_nm.SetEnable(false);
    txtvoucher_no.GetControl().focus();
    
    var tempGrid = grid.GetGridControl();
    tempGrid.FixedCols = 1;

    txtAc_level.text= "<%=session("ACNT_LEVEL")%>";
     txtSesion_company.text = "<%=session("company_pk")%>";
     var _company;
     if(txtAc_level.text=='6')
     {
        _company = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if=0")%>"; 
        lstCompany.SetDataText(_company);
        //cboOrganization.value= 'ALL';
     }
     else if(txtAc_level.text=='3')
     {
        
     }
	  txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	 dso_getCompany.Call();
}

function Reset_Trans()
{
    txtuser_id.SetDataText("");
    txtuser_nm.SetDataText("");
    txtuser_pk.SetDataText("");
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
    var std_dt, etd_dt ;
	std_dt = dtApp_fr.GetData();
	etd_dt = dtApp_to.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert('    End date can’t be earlier than start date!!!'+'\n'+'Ngày kết thúc không thể nhỏ hơn ngày bắt đầu!!!');
		return false;
	}
	if ((txtuser_nm.GetData() == "") && (txtuser_id.GetData() != ""))
	{
	    alert('    This transaction is not exists. Please Choose again!!!'+'\n'+'Transaction này không tồn tại. Bạn hãy chọn lại Transaction!!!');
	    return false;
	}
	return true;
}

function OnSearch()
{
    if (OnCheck())
    {
        dso_sel_grd_dtl_slip_app_cancel.Call("SELECT");
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

function OnChangeList()
{
    grid.ClearData();
}

function OnSearchUser()
{
    dso_pro_sel_user.Call();
}

function OnPopupSlipEntry()
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
			var pk      = grid.GetGridData(ctrl.row, 1);
			var status  = grid.GetGridData(ctrl.row, 14);
			var ls_arr = "";
			for (i = 1; i < grid.rows; i++)
			{
			    ls_arr = ls_arr + ' ' + grid.GetGridData(i, 1);
			}
			
			var fpath   = System.RootURL + '/standard/forms/60/06/60060020_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
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

function Popup_Trans()
{
    var fpath   = System.RootURL + "/standard/forms/60/08/60080030_popup_bank.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=AC_SEL_USER_ID_NM&col_code=' + '' +"User ID" + '&col_nm=' + '' + "User name";
    var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null )  
    {
        if (object[0] != 0)
        {
            txtuser_pk.text    = object[2];
            txtuser_nm.text    = object[1];
            txtuser_id.text    = object[0];
        }
    }
}


</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_sel_grd_dtl_slip_app_cancel" onreceive="SetTotal()">
        <xml>
            <dso type="grid" function="AC_SEL_60060050_1">
                <input bind="grid">
                    <input bind="lstCompany"/>
                    <input bind="lstVouchertype"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtseq"/>
                    <input bind="dtApp_fr"/>
                    <input bind="dtApp_to"/>
                    <input bind="txtuser_pk"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_pro_sel_user"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_SEL_USER_ID_NM" > 
                <input> 
                     <input bind="txtuser_id"/>
                </input>
                <output>
                     <output bind="txtuser_id"/>
                     <output bind="txtuser_nm"/>
                     <output bind="txtuser_pk"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

 
 <gw:data id="dso_getCompany" onreceive=""> 
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
<table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="1">
<tr style='height:6%'>
    <td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
            <td width="100%">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
		        <tr>
                    <td width="10%"></td>
                    <td width="25%"></td>
                    <td width="9%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="10%"></td>
                    <td width="3%"></td>
                    <td width="10%"></td>
                    <td width="15%"></td>
                </tr>
                <tr>
                    <td align="right">Company</td>
                    <td><gw:list id="lstCompany" onChange="OnChangeList()" value ="" styles='width:100%'></gw:list></td>
                    <td align="right">App. Type</td>
                    <td><gw:list id="lstVouchertype" onChange="OnChangeList()" value ="ALL" styles='width:100%'>
                        <data><%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACAB030') FROM DUAL")%>|ALL|Select ALL</data>
                        </gw:list>
                    </td>
                    <td align="right">Voucher No</td>
                    <td><gw:textbox id="txtvoucher_no" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch()"/></td>
                    <td align="right">Seq</td>
                    <td><gw:textbox id="txtseq" styles="width:100%" onkeypress="CheckNumeric()" onenterkey="OnSearch()"/></td>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td width="15%" align="right">Total</td>
                            <td align="center"><gw:label id="lblRecord" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td> 
					        <td width="15%" align="left">vouchers</td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Approve DT</td>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td><gw:datebox id="dtApp_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                            <td align="center">~</td>
                            <td align="right"><gw:datebox id="dtApp_to" 	onchange="" styles='width:100%' lang="1"/></td>        
                        </tr>
                        </table>
                    </td>
                    
                    <td align="right">Approve by</td>
                    <td colspan="5">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txtuser_id" styles='width:100%' onenterkey="OnSearchUser()"/></td>
                            <td width="60%"><gw:textbox id="txtuser_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtuser_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="popup"	id="idSearchTr" alt="Popup" onclick="Popup_Trans()"/></td> 
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Trans()"/></td>
                        </tr>
                        </table>
                    </td>
                    <td align="right"><gw:imgbtn id="btnSearch" img="Search" alt="Search"   onclick="OnSearch()" /></td>
                </tr>
                </table>
            </td>
        </tr>
        </table>
    </td>
</tr>
<tr style='height:94%'>
    <td width="100%">
	    <gw:grid   
		    id="grid"
		    header="Row|Seq|App. Type|Voucher No|Approve DT|Approve no|Approvel by|Trans Code|Trans Name|Propose DT|Propose Dept|Propose By|Amount|Description|Description (LC)"   
		    format  ="0|0|0|0|4|0|0|0|0|4|0|0|0|0|0" 
	        aligns  ="1|1|1|1|1|1|1|1|0|1|0|1|3|0|0" 
		    defaults="||||||||||||||"  
		    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
		    acceptNullDate="T"
		    widths="500|600|1250|1600|1100|700|800|800|1500|1100|1500|800|1500|1700|1500"  
		    styles="width:100%; height:100%"
		    sorting="T"   
		    oncelldblclick="OnPopupSlipEntry()"
		    />
    </td>
</tr>
</table>

<gw:textbox id="txtchk"                 style="display:none" />
<gw:textbox id="txtDescription"         style="display:none" />
<gw:textbox id="txtLocalDescription"    style="display:none" />
<gw:textbox id="txtStatus"              style="display:none" />
<gw:textbox id="txtseq_str"             style="display:none" />
<gw:textbox id="txtindex"               style="display:none" />
<gw:textbox id="txtAc_level"  styles='display:none' />
         <gw:textbox id="txtSesion_company"  styles='display:none' />
		 <gw:textbox id="txtProposedByUserPk"  styles='display:none' />
</body>
</html>
