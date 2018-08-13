<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Slip Cancel</title>
  </head>
 <%CtlLib.SetUser("acnt")%>
 
<script>

function BodyInit()
{
	System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_date_to     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
	
	var ls_data2    ="<%=CtlLib.SetListDataSQL("SELECT 'ALL' CODE,'Select All' CODE_NM FROM DUAL  UNION ALL SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0130' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY CODE")%>"; 
   
    lstCompany.SetDataText(ls_data);
    ls_data = "<%=CtlLib.SetListDataFUNC("SELECT acnt.SF_A_GET_COMMONCODE_ord('EACAB030') FROM DUAL")%>";
    lstApptype.SetDataText(ls_data);
	lstVouchertype.SetDataText(ls_data2);
	lstVouchertype.SetDataText('ALL');
    dtPropos_fr.SetDataText(ls_date_fr);
    dtPropos_to.SetDataText(ls_date_to);
    lblRecord.SetDataText("0");
    txttrans_nm.SetEnable(false);
    txtchk.SetDataText("0");
    btnAppr.SetEnable(false);
    btnNAppr.SetEnable(false);
    btnCancel.SetEnable(false);
    txtseq.GetControl().focus();
    var tempGrid = grid.GetGridControl();
    tempGrid.FixedCols = 1;
	
	ls_data = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0160' AND M.DEL_IF = 0 AND D.DEL_IF = 0 AND D.DEF_YN = 'Y'")%>";
	txtAprDate_Opt.SetDataText(ls_data);
}

function Reset_Trans()
{
    txttrans_cd.SetDataText("");
    txttrans_nm.SetDataText("");
    txttrans_pk.SetDataText("");
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

function OnChkAll()
{
    if (txtchk.GetData() == 0)
    {
        btnChk.text="Un Chk All";
        txtchk.SetDataText("1");
        for (i = 1; i< grid.rows; i++)
        {
            grid.SetGridText(i, 1, -1);
        }
    }
    else
    {
        btnChk.text="Chk All";
        txtchk.SetDataText("0");
        for (i = 1; i< grid.rows; i++)
        {
            grid.SetGridText(i, 1, 0);
        }
    }
}

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
	if ((txttrans_nm.GetData() == "") && (txttrans_cd.GetData() != ""))
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
	    btnChk.SetEnable(true);
    }
    else
    {
        lblRecord.SetDataText(0);
        SetDisableButton();
    }
    btnChk.text="Chk All";
    txtchk.SetDataText("0");
    CheckStatus();
}

function CheckStatus()
{
    if (rbstatus.GetData() == " ")
    {
        btnAppr.SetEnable(false);
        btnNAppr.SetEnable(false);
        btnCancel.SetEnable(false);
    }
    else if (rbstatus.GetData() == 1)
    {
        btnAppr.SetEnable(false);
        btnNAppr.SetEnable(false);
        btnCancel.SetEnable(false);
    }
    else if (rbstatus.GetData() == 2)
    {
        btnAppr.SetEnable(true);
        btnNAppr.SetEnable(false);
        btnCancel.SetEnable(false);
    }
    else if (rbstatus.GetData() == 3)
    {
        btnAppr.SetEnable(false);
        btnNAppr.SetEnable(false);
        btnCancel.SetEnable(false);
    }
    else if (rbstatus.GetData() == 4)
    {
        btnAppr.SetEnable(true);
        btnNAppr.SetEnable(false);
        btnCancel.SetEnable(false);
    }
    else if (rbstatus.GetData() == 0)
    {
        btnAppr.SetEnable(false);
        btnNAppr.SetEnable(true);
        btnCancel.SetEnable(true);
    }
}

function OnChangeList()
{
    grid.ClearData();
}

function SetDisableButton()
{
    btnAppr.SetEnable(false);
    btnNAppr.SetEnable(false);
    btnCancel.SetEnable(false);
    btnChk.SetEnable(false);
}

function OnChangeRb()
{
    CheckStatus();
    OnSearch();
}

function OnSearchTrans()
{
    dso_pro_get_transname.Call();
}

function OnApprove()
{
    var data;
	data = "";
	var ctrl 	= grid.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	
	for (i=1; i<ctrl.Rows; i++)
	{
		var tmp = grid.GetGridData(i, 1);
		if (tmp == "-1")
		{
			data  = grid.GetGridData(i, 2)+ "," + data ;
			index = index + 1 ;
		}
	}
	if(index == 0)
	{
		alert('Please select check SEQ for approval!!!'+'\n'+'  Bạn hãy chọn số SEQ để Approval!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to approve?'+'\n'+'Bạn có chắc Approval số SEQ này?'))
		{
	        txtStatus.text  = 0;
	        txtseq_str.text = data;
	        txtindex.text   = index;
	        dso_upd_approval_cancel.Call();	
        }
    }
}

function OnNoApp()
{
    var data;
	data = "";
	var ctrl 	= grid.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	
	for (i=1; i<ctrl.Rows; i++)
	{
		var tmp = grid.GetGridData( i, 1);
		if(tmp == "-1")
		{
			data =  grid.GetGridData( i, 2)+ "," + data ;
			index = index + 1 ;
		}
	}
	if(index == 0)
	{
		alert('Please select check SEQ for No Approval!!!'+'\n'+'Bạn hãy chọn số SEQ để No Approval!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to No Approve?'+'\n'+'Bạn có chắc No Approval số SEQ này?'))
		{
	        txtStatus.text  = 4;
	        txtseq_str.text = data;
	        txtindex.text   = index;
            dso_upd_approval_cancel.Call();
        }
    }
}

function OnCancel()
{

    var data;
	data = "";
	var ctrl 	= grid.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	
	for (i=1; i<ctrl.Rows; i++)
	{
		var tmp = grid.GetGridData( i, 1);
		if(tmp == "-1")
		{
			data =  grid.GetGridData( i, 2)+ "," + data ;
			index = index + 1 ;
		}
	}
	if(index == 0)
	{
		alert('Please select check SEQ for Cancelled!!!'+'\n'+'Bạn hãy chọn số SEQ để Cancelled!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to Cancelled?'+'\n'+'Bạn có chắc Cancelled số SEQ này?'))
		{
	        txtStatus.text  = 3;
	        txtseq_str.text = data;
	        txtindex.text   = index;
           // dso_upd_approval_cancel.Call();

		    var path = System.RootURL + '/standard/forms/gf/hg/gfhg00020_causecancelapp.aspx?com_pk='+ lstCompany.GetData() + '&seq=' + txtseq_str.GetData() + '&status=' + txtStatus.GetData()  + '&dsqlid=ACNT.SP_PRO_CTL_MST_APPROVAL_CANCEL' + '&table=TAC_HGTRH&p_index=' + txtindex.GetData() + '&lstApptype=' + lstApptype.GetData() + '&dtApp=' + dtApp.GetData() +'&chkCombine_YN=' + chkCombine_YN.GetData();
			var object = System.OpenModal( path,  400 , 400,'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no');
			if ( object != null )
			{
				if (object[0] !=0)
				{
					//txtseq.text = object[0];
					//CheckKeySeq();
					OnSearch();
				}
			}
        }
    }
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
		if (event.col > 1)
		{
			var pk      = grid.GetGridData(ctrl.row, 2);
			var status  = grid.GetGridData(ctrl.row, 14);
			var ls_arr = "";
//			for (i = 1; i < grid.rows; i++)
//			{
//			    ls_arr = ls_arr + ' ' + grid.GetGridData(i, 2);
//			}
			
			var fpath   = System.RootURL + '/standard/forms/gf/hg/gfhg00020_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
			var wWidth  = 950;
			var wHeight = 580;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			this.name = "gfhg00020";
			var object = System.OpenModal(fpath, wWidth, wHeight, features,window);
	    }
    }
}

function GetRowPK(row_index){
    if((row_index < grid.rows) && (row_index > 0)){
        return grid.GetGridData(row_index, 2);
    }
    return -1;
}

function Popup_Trans()
{
    var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_POPUP_TRANS&col_code=' + '' +"Transaction code" + '&col_nm=' + '' + "Transaction name";
    var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null )  
    {
        if (object[0] != 0)
        {
            txttrans_pk.text    = object[2];
            txttrans_nm.text    = object[1];
            txttrans_cd.text    = object[0];
        }
    }
}

function OnApproveDate()
{
	if(event.col == 1)
	{
		if(txtAprDate_Opt.value == "1")
		{
			dtApp.value = dtAprDate.value; // sysdate
		}
		else if(txtAprDate_Opt.value == "2")
		{
			dtApp.value = grid.GetGridData(event.row, 4); // transaction date
		}
	}	
}

</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_sel_grd_dtl_slip_app_cancel" onreceive="SetTotal()">
        <xml>
            <dso type="grid" function="acnt.SP_SEL_GRD_DTL_SLIP_APP_CANCEL">
                <input bind="grid">
                    <input bind="lstCompany"/>
                    <input bind="dtPropos_fr"/>
                    <input bind="dtPropos_to"/>
                    <input bind="txttrans_pk"/>
                    <input bind="rbstatus"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtseq"/>
                    <input bind="lstVouchertype"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_pro_get_transname"> 
        <xml> 
            <dso type="process" procedure="ACNT.SP_PRO_GET_TRANS_NAME" > 
                <input> 
                     <input bind="txttrans_cd"/>
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="txttrans_nm"/>
                     <output bind="txttrans_pk"/>
                     <output bind="txtDescription"/>
                     <output bind="txtLocalDescription"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_upd_approval_cancel" onreceive="OnSearch()"> 
        <xml> 
            <dso type="process" procedure="ACNT.SP_PRO_CTL_MST_APPROVAL_CANCEL" > 
                <input> 
                     <input bind="txtseq_str"/>
                     <input bind="lstCompany"/>
                     <input bind="txtStatus"/>
                     <input bind="txtindex"/>
                     <input bind="lstApptype"/>
                     <input bind="dtApp"/>
                     <input bind="chkCombine_YN"/>
                     
                </input>
                <output>
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
<table width="100%" cellpadding="0" cellspacing="0" border="1">
<tr>
    <td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
		    <tr>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="9%"></td>
                <td width="10%"></td>
                <td width="9%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="1%"></td>
                <td width="2%"></td>
                <td width="13%"></td>
                <td width="3%"></td>
                <td width="3%"></td>
                <td width="3%"></td>
            </tr>
            <tr>
                <td align="right">Company&nbsp;</td>
                <td><gw:list id="lstCompany" onChange="OnChangeList()" value ="" styles='width:100%' /></td>
                <td align="center">Appr. DT</td>
                <td><gw:datebox id="dtApp" 	onchange="" styles='width:100%'  lang="1"/></td>
                <td colspan=1 align=right>Appr. type</td>
                <td colspan=2><gw:list id="lstApptype" onChange="OnChangeList()" value ="" styles='width:100%' /></td>
                 <td align=right>Combine</td>
               <td ><gw:checkbox id="chkCombine_YN" defaultvalue="Y|N" value="Y" onclick="" /></td>                                              
			    <td align="right">&nbsp;Seq&nbsp;</td>
                <td ><gw:textbox id="txtseq" styles="width:100%" onkeypress="CheckNumeric()" onenterkey="OnSearch()"/></td>
                <td align="right">Total</td>
                <td align="center"><gw:label id="lblRecord" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td> 
			    <td align="left">vouchers</td>			   			  
            </tr>
            <tr>
                <td align="right">Proposed Date&nbsp;</td>
                <td><gw:datebox id="dtPropos_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                <td align="center"><font color="black"><b>~&nbsp;</b></font></td>
                <td><gw:datebox id="dtPropos_to" 	onchange="" styles='width:100%' lang="1"/></td>
                <td align="right">Slip Status</td>
	            <td colspan="7" align="left"><gw:radio id="rbstatus" value="2" onchange="OnChangeRb()"> 
			            <span value=" ">All</span>
			            <span value="1">Saved</span>
			            <span value="2">Confirmed</span>
			            <span value="0">Approved</span>
			            <span value="3">Cancel</span>
                        </gw:radio>
                </td>
               
                <td><gw:icon id="btnNAppr"  img="in" text="Approve(In)" styles='width:100%;display:none;' onclick="OnNoApp()"/></td>
                 <td><gw:icon id="btnAppr"   img="in" text="Approve" style='width:100%; display:none;' onclick="OnApprove()"/></td>
            </tr>
            <tr>
                <td align="right">Voucher Type&nbsp;</td>
                <td><gw:list id="lstVouchertype" onChange="OnChangeList()" value ="ALL" styles='width:100%'> </gw:list></td>
                <td align="center">Voucher No</td>
                <td ><gw:textbox id="txtvoucher_no" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch()"/></td>
                <td align="right">Trans Type&nbsp;</td> 
                <td colspan=6>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td width="30%"><gw:textbox id="txttrans_cd" styles='width:100%' onenterkey="OnSearchTrans()" onkeypress="Upcase()"/></td>
                        <td width="60%"><gw:textbox id="txttrans_nm" styles='width:100%'/></td>
                        <td width="0%"><gw:textbox  id="txttrans_pk" styles='display:none'/></td>
                        <td width="5%"><gw:imgBtn   img="popup"	id="idSearchTr" alt="Popup" onclick="Popup_Trans()"/></td> 
                        <td width="5%"><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Trans()"/></td>
                    </tr>
                    </table>
                </td>
                <td><gw:imgbtn id="btnSearch" img="Search" alt="Search" onclick="OnSearch()" /></td>
                <td><gw:icon id="btnChk"    img="in" text="Chk All" styles='width:100%' onclick="OnChkAll()"/></td>
                 
                
                <td><gw:icon id="btnCancel" img="in" text="Cancel"  styles='width:100%' onclick="OnCancel()"/></td>
            </tr>
        </table>
    </td>
</tr>
<tr>
    <td>
	    <gw:grid   
		    id="grid"
		    header="Row|Chk|Seq|Voucher No|Prps Date|Prps No|Appr.Date|Appr.No|Prps By|Trs Type|Trs Name|Amount|Desc|Desc Local|_|Cancel cause"   
		    format="0|3|0|0|4|0|4|0|0|0|0|0|0|0|0|0"  
		    aligns="1|1|1|1|1|1|1|0|1|1|0|3|0|0|0|2" 
		    defaults="|||||||||||||||"  
		    editcol="0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
		    widths="500|400|800|1600|1100|800|1100|800|800|800|1500|1500|1500|1500|0|1500"  
		    styles="width:100%; height:400"
		    sorting="T"   
		    acceptNullDate="T"
		    oncelldblclick="OnPopupSlipEntry()"
			onafteredit="OnApproveDate()"
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
<gw:list id="txtAprDate_Opt"         style="display:none" />
<gw:datebox id="dtAprDate" lang="1" style="display:none" />
</body>
</html>
