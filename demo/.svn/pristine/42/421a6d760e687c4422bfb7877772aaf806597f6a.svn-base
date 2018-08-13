<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>

var rowclick    = 0;

function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_date_to     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
    
    <%=CtlLib.SetGridColumnComboFormat("gridD", 15,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    
    lstCompany.SetDataText(ls_data);
    dtPropos_fr.SetDataText(ls_date_fr);
    dtPropos_to.SetDataText(ls_date_to);
    txttrans_nm.SetEnable(false);
    txtcust_nm.SetEnable(false);
    txtcust_cd.SetEnable(false);
    txtSumNetBook.SetEnable(false);
    txtSumTaxBook .SetEnable(false);
    var tempGrid = grid.GetGridControl();
    tempGrid.FixedCols = 1;
    txtseq.GetControl().focus();
    grid.GetGridControl().FrozenCols  = 5;
    gridD.GetGridControl().FrozenCols = 7;
    SetNumGrid();
    SetFormatGrid();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
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
        rowclick    = 0;
        gridD.ClearData();
        lblVoucher.text = "";
        dso_sel_grd_dtl_vat_declare.Call("SELECT");
    }
}

function OnChangeList()
{
    grid.ClearData();
    gridD.ClearData();
    lblVoucher.text = "";
    rowclick    = 0;
}

function OnSearchTrans()
{
    dso_pro_get_transname.Call();
}

function Popup_Trans()
{
    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=AC_SP_SEL_POPUP_TRANS&col_code=' + '' +"Transaction code" + '&col_nm=' + '' + "Transaction name";
    var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null )  
    {
        if (object[2] != 0)
        {
            txttrans_pk.text    = object[2];
            txttrans_nm.text    = object[1];
            txttrans_cd.text    = object[0];
        }
    }
}

function Reset_Trans()
{
    txttrans_cd.SetDataText("");
    txttrans_nm.SetDataText("");
    txttrans_pk.SetDataText("");
}

function OnSearchCust()
{
	var path = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx';
	var object = System.OpenModal( path ,800, 600, 'resizable:yes;status:yes');
	if ( object != null )
	{
	    if (object[0] != 0)
        {
            txtcust_pk.text = object[0];
            txtcust_nm.text = object[2];
            txtcust_cd.text = object[1];
        }
    }
}

function Reset_Cust()
{
    txtcust_pk.SetDataText("");
    txtcust_nm.SetDataText("");
    txtcust_cd.SetDataText("");
}

function SetNumGrid()
{
    var fg=grid.GetGridControl();
	fg.ColFormat(9)     = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(10)    = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(8)    = "#,###,###,###,###,###,###,###,###R"; 
}

function SetFormatGrid()
{
    var tempGrid1 = gridD.GetGridControl();
    tempGrid1.FixedRows = 1;
    tempGrid1.FixedCols = 2;
    tempGrid1.MergeCells =5;
    tempGrid1.MergeRow(0) = true;
    tempGrid1.Cell(0, 0, 6, 0, 7)  = "Invoice Date";
    tempGrid1.AllowUserResizing    = 0;
    tempGrid1.AutoResize = true;
}

function onClickRow()
{
    if (grid.rows < 2)
    {
        return;
    }
	else
	{
	    if (grid.selrow < 1)
	    {
	        return;
	    }
	    if ((grid.rows > 1) && (grid.selrow < grid.rows) && (grid.selrow != rowclick))
	    {
            for (i = 1; i < grid.rows; i++)
            {
                if (grid.selrow == i)
                {
	                grid.SetCellBold(i,1,i,14,true);
                }
                else
                {
	                grid.SetCellBold(i,1,i,14,false);
                }
            }
            rowclick = grid.selrow;
            lblVoucher.text = grid.GetGridData(grid.selrow, 3);
            onGetItem();
        }
    }
}

function onNew()
{
	if (lblVoucher.GetData() == '')
	{
	    alert('You must choose SEQ in master frist!!!'+'\n'+'Bạn hãy chọn số SEQ ở phía trên!!!');
	    return;
	}
	gridD.DeselectRow(gridD.selrow);
	gridD.AddRow();
	gridD.SelectRow(gridD.rows - 1);
	
	gridD.SetGridText( gridD.rows - 1 ,1, gridD.rows - 1);
	var fg=gridD.GetGridControl();
	fg.ColEditMask(6)   = '00/00/0000';
	gridD.SetGridText( gridD.rows - 1 , 18, txthgtrh.GetData());
	gridD.SetGridText( gridD.rows - 1 , 19, txthgtrd.GetData());
	gridD.SetGridText( gridD.rows - 1 , 17, lblVoucher.GetData());
	gridD.SetGridText( gridD.rows - 1 , 7, '');
	onSetItem();
}

function onSave()
{
	if (onCheckItem())
	{
	    for (i = 1; i < gridD.rows; i++)
	    {
	        gridD.SetGridText( i , 18, txthgtrh.GetData());
	        gridD.SetGridText( i , 19, txthgtrd.GetData());
	        gridD.SetGridText( i , 17, lblVoucher.GetData());
	    }
	    dso_upd_grd_dtl_vat_declare.Call();
	}
}

function SelectChange()
{
    if (event.col == 7)
    {
        var ls_ddmmyyy
        var ls_tmp = gridD.GetGridData(gridD.selrow, 7);
        ls_ddmmyyy = ls_tmp.substr(6,2) + '/' + ls_tmp.substr(4,2) + '/' + ls_tmp.substr(0,4);
        gridD.SetGridText( gridD.selrow , 6, ls_ddmmyyy);
        gridD.SetGridText( gridD.selrow , 7, '');
    }
    else if ((event.col == 15) || (event.col == 14))
    {
        famt        = Number(gridD.GetGridData(event.row, 14));
        tax_rate    = Number(gridD.GetGridData(event.row, 15));
        
        if (tax_rate != 'NO')
        {
            if (tax_rate != 1)
            {
                gridD.SetGridText(event.row, 16, Math.round(Number(famt*tax_rate/100)*100)/100);
            }
        }
    }
   SumNetTaxBooks(); 
}

function onCheckAll()
{
	if (gridD.rows < 2) 
	{
	    chkauto_YN.SetDataText('F');
	    return
	}
	if (chkauto_YN.GetData() == 'F')
	{
	    for (i= 1; i < gridD.rows; i++)
	    {
	        gridD.SetGridText(i, 2, 0);
	    }
	}
	else
	{
		for (i= 1; i < gridD.rows; i++)
	    {
	        gridD.SetGridText(i, 2, -1);
	    }
	}
}


function onGetItem()
{
	chkauto_YN.SetDataText('F');
	idGridTempItem.ClearData(); 
	txthgtrd.text       = grid.GetGridData(grid.selrow, 15);
	txtacpk.text        = grid.GetGridData(grid.selrow, 16);
	txthgtrh.text       = grid.GetGridData(grid.selrow, 2);
	dso_sel_grd_vat_declare_item.Call("SELECT");
}

function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_sel_grd_vat_declare_item":
            dso_upd_grd_dtl_vat_declare.Call("SELECT");
        break;
        case "dso_upd_grd_dtl_vat_declare":
            onSetItem();
            SumNetTaxBooks();            
        break;
    }
}

function onSetItem()
{
	if (gridD.rows < 2) return;
	
	for (i = 1; i < idGridTempItem.rows; i++)
	{
	    var data_yn_i = idGridTempItem.GetGridData(i, 0);
	    var data_i    = idGridTempItem.GetGridData(i, 1);
	    for (j = 3; j < gridD.cols; j++)
	    {
	        var data_j    = gridD.GetGridData(0, j);
	        if ((data_j == data_i) && (data_yn_i == 'Y'))
	        {
	            if (data_i == 'Cust Code')
	            {
	                for (k = 1; k < gridD.rows; k++)
	                {
	                    gridD.SetCellBgColor(k, 10, k, 11, Number(0XCDFAFF));
	                }
	            }
	            else if (data_i == 'Invoice Date')
	            {
	                for (k = 1; k < gridD.rows; k++)
	                {
	                    gridD.SetCellBgColor(k, 7, k, 7, Number(0XCDFAFF));
	                }
	            }
	            for (k = 1; k < gridD.rows; k++)
	            {
	                gridD.SetCellBgColor(k, j, k, j, Number(0XCDFAFF));
	            }	            
	        }
	        if ((data_i == 'Item') && (data_yn_i == 'Y'))
            {
            	for (k = 1; k<gridD.rows; k++)
                {
                    gridD.SetCellBgColor(k, 13, k, 13, Number(0XCDFAFF));
                }
            }
	    }
	}
}

function onCheckItem()
{
	if (gridD.rows < 2) return;
	
	for (i = 1; i < idGridTempItem.rows; i++)
	{
	    var data_yn_i = idGridTempItem.GetGridData(i, 0);
	    var data_i    = idGridTempItem.GetGridData(i, 1);
	    for (j = 3; j < gridD.cols; j++)
	    {
	        var data_j    = gridD.GetGridData(0, j);
	        if ((data_j == data_i) && (data_yn_i == 'Y'))
	        {
	            for (k = 1; k < gridD.rows; k++)
	            {
	                var data_k = gridD.GetGridData(k, j);
                    if (data_k == '')
                    {
                        alert('           '+ data_i + ' is mandatory. Please input!!!'+'\n'+ data_i +' thông tin bắt buộc nhập. Vui lòng nhập vào!!!');
		                return false;
                    }
	            }
	            
	        }
	        if ((data_i == 'Item') && (data_yn_i == 'Y'))
            {
            	for (k = 1; k<gridD.rows; k++)
                {
                    var data_k = gridD.GetGridData(k, 12);
                    if (data_k == '')
                    {
                        alert('           Description is mandatory. Please input!!!'+'\n'+ 'Description thông tin bắt buộc nhập. Vui lòng nhập vào!!!');
		                return false;
                    }
                }
            }
	    }
	}
	return true;
}

function OnDoubleClk()
{
    if (event.col == 9)
    {
        var path = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
		var object = System.OpenModal( path ,800, 600, 'resizable:yes;status:yes');
		if ( object != null )
		{
		    if (object[0] != 0)
            {
		        gridD.SetGridText( gridD.selrow , 9, object[1]);
		        gridD.SetGridText( gridD.selrow , 10, object[2]);
		        gridD.SetGridText( gridD.selrow , 11, object[2]);
		        gridD.SetGridText( gridD.selrow , 8, object[0]);
		        if (gridD.GetGridData(gridD.selrow, 4) == '')
		        {
		            gridD.SetGridText( gridD.selrow , 4, object[7]);
		        }
		        if (gridD.GetGridData(gridD.selrow, 12) == '')
		        {
		            gridD.SetGridText( gridD.selrow , 12, object[6]);
		        }
		    }
        }
    }
}

function onMapping()
{
	var lb_bool = true;
	var j   = 0;
	var row_chk_mst = 0;
	for (i = 1; i < grid.rows; i++)
	{
	    if (grid.GetGridData(i, 1) == -1)
	    {
	        j = j + 1;
	        row_chk_mst = i;
	    }
	}
	if (j > 1)
	{
	    alert('    You must one check in master!!!'+'\n'+'Bạn chỉ chọn 1 dấu check ở phía trên!!!!');
	    return;
	}
	else if (j < 1)
	{
	    alert('  You must choose one check in master!!!'+'\n'+'Bạn hãy chọn 1 dấu check ở phía trên!!!!');
	    return;
	}
	j = 0;
	for (i = 1; i < gridD.rows; i++)
	{
	    if (gridD.GetGridData(i, 2) == -1)
	    {
	        j = j + 1;
	    }
	}
	if (j < 1)
	{
	    alert(' You must choose and check Voucher No to Mapping!!!'+'\n'+'Bạn hãy chọn và check số Voucher No cần Mapping!!!');
	    return;
	}
	var trh = grid.GetGridData(row_chk_mst, 2);
    var trd = grid.GetGridData(row_chk_mst, 15);
	for (i = 1; i < gridD.rows; i++)
	{
	    if (gridD.GetGridData(i, 2) == -1)
	    {
	        gridD.SetGridText( i , 18, trh);
	        gridD.SetGridText( i , 19, trd);
	    }
	}
	dso_upd_grd_dtl_vat_declare.Call();
}

function onDelete()
{
	var ctrl = gridD.GetGridControl();
    if (gridD.rows > 1)
    {
        var j = 0;
        var i = 1;
        for (i = 1; i < ctrl.rows; i++)
		{
		    if (ctrl.isSelected(i) == true)
		    {
                gridD.DeleteRow();
            }
        }
    }
}

function onReport()
{
	alert('Not yet');
}
function SumNetTaxBooks()
{
    var l_Net = 0;
    var l_Tax = 0;
   
    for(i=1;i<gridD.rows;i++)
   {
        if (gridD.GetGridData(i,14)!="")
        {
             l_Net = Number(l_Net) + Number(gridD.GetGridData(i,14));
        }
        if (gridD.GetGridData(i,16)!="")
        {
            l_Tax = Number(l_Tax) + Number(gridD.GetGridData(i,16));
        }
   } 
    txtSumNetBook.SetDataText(""+l_Net);
    txtSumTaxBook.SetDataText(""+l_Tax);
   
}
</script>
<body style="margin:0; padding:0;">
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_6008180_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	
    <gw:data id="dso_sel_grd_dtl_vat_declare">
        <xml>
            <dso type="grid" function="ac_sel_60120040_vat_dec_vas">
                <input bind="grid">
                    <input bind="lstCompany"/>
                    <input bind="txtcust_pk"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtseq"/>
                    <input bind="dtPropos_fr"/>
                    <input bind="dtPropos_to"/>
                    <input bind="rbstatus"/>
                    <input bind="txttrans_pk"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_grd_dtl_vat_declare" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,3,4,5,6,8,10,11,12,13,14,15,16,17,18,19" function="ac_sel_60120040_vatdtl_dec_vas" procedure="ac_upd_60120040_vat_dec_vas">
                <input bind="gridD">
                    <input bind="lblVoucher"/>
                    <input bind="lstCompany"/>
                </input>
                <output bind="gridD"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_grd_vat_declare_item" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="AC_SEL_60120040_DEC_ITEM">
                <input bind="idGridTempItem">
                    <input bind="txthgtrd"/>
                    <input bind="txtacpk"/>
                </input>
                <output bind="idGridTempItem"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_pro_get_transname"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_GET_TRANS_NAME" > 
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

<table width="100%" cellpadding="0" cellspacing="0" border="1">
<tr>
    <td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
            <td width="100%">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
		        <tr>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="15%"></td>
                    <td width="45%"></td>
                    
                    
                </tr>
                <tr>
                    <td align="right">Company</td>
                    <td><gw:list id="lstCompany" onChange="OnChangeList()" value ="" styles='width:100%'></gw:list></td>
                    <td align="center">Biz. Place</td>
                    <td><gw:list id="lstBizplace" onChange="OnChangeList()" value ="" styles='width:100%'></gw:list></td>
                    <td align="right">Customer</td>
                    <td >
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txtcust_cd" styles='width:100%'/></td>
                            <td width="60%"><gw:textbox id="txtcust_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtcust_pk" styles='display:none'/></td>
                            <td width="5%"><gw:button   img="popup"	id="idSearchTr" alt="Popup" onclick="OnSearchCust()"/></td> 
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Cust()"/></td>
                        </tr>
                        </table>
                    </td>
                    
                </tr>
                <tr>
                    <td align="right">Proposed Date</td>
                    <td><gw:datebox id="dtPropos_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPropos_to" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="right">Trans Type</td> 
                    <td >
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txttrans_cd" styles='width:100%' onenterkey="OnSearchTrans()" onkeypress="Upcase()"/></td>
                            <td width="60%"><gw:textbox id="txttrans_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txttrans_pk" styles='display:none'/></td>
                            <td width="5%"><gw:button   img="popup"	id="idSearchTr" alt="Popup" onclick="Popup_Trans()"/></td> 
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Trans()"/></td>
                        </tr>
                        </table>
                    </td>
                    
                </tr>
                <tr>
                    <td align="right">Voucher No</td>
                    <td ><gw:textbox id="txtvoucher_no" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch()"/></td>
                    <td align="center">Seq</td>
                    <td ><gw:textbox id="txtseq" styles="width:100%" onkeypress="CheckNumeric()" onenterkey="OnSearch()"/></td>
                    <td align="right">Slip Status</td>
			        <td>
			            <table style="width:100%">
			                <tr>
			                
			                    <td  ><gw:radio id="rbstatus" value="2" onchange="OnSearch()"> 
					                    <span value="1">Saved</span>
					                    <span value="2">Confirmed</span>
					                    <span value="0">Approved</span>
					                    </gw:radio>
                                </td>
                              
                                
                                <td width="5%"  ><gw:imgbtn id="btnSearch" img="Search" alt="Search" styles="width:100"  onclick="OnSearch()" /></td>
                            </tr>
                        </table>
                    </td>
                    
                   
                </tr>
              </table>
            </td>
        </tr>
        </table>
    </td>
</tr>
<tr>
    <td width="100%">
	    <gw:grid   
		    id="grid"
		    header="Row|Chk|Seq|Voucher No|Date|Acc Code|Acc Name|Ccy|Trans Amount|Ex.Rate|Books Amount|Cust Code|Cust Name|Desc|Desc Local|_thd_pk|_acpk"
		    format="0|3|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0"  
		    aligns="1|1|1|1|1|1|0|1|3|1|3|1|0|0|0|0|0" 
		    defaults="||||||||||||||||"  
		    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
		    widths="500|400|800|1800|1500|1000|2500|800|2000|1000|2000|1000|2500|2500|2500|400|400"  
		    styles="width:100%; height:187"
		    sorting="T"
		    acceptNullDate="T"
		    oncellclick="onClickRow()"
		    />
    </td>
</tr>
<tr>
    <td width="100%">
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td align="center" bgcolor="bde9ff">Voucher No</td>
            <td width="50%" align="left">
                    <table border="0"  cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                                <td width="30%"><gw:label id="lblVoucher" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td>
                                <td width="10%">Total</td>
                                <td width="30%"><gw:textbox id="txtSumNetBook"   type="number" format="#,###,###,###,###.##R"    styles="width:100%" /></td>
                                <td width="30%"><gw:textbox id="txtSumTaxBook"   type="number" format="#,###,###,###,###.##R"     styles="width:100%" /></td>
                        </tr>
                    </table>
            </td>
            <td align="right">Check All<gw:checkbox id="chkauto_YN" value="F"  onclick="onCheckAll()"/> 
		    </td>
            <td><gw:button    id="btnMapping" img="Mapping Slip" text="Mapping Slip"  styles='width:100%;color:#007FFF' onclick="onMapping()"/></td>
            <td><gw:button id="ibtnNew"    img="new"       alt="New"           onclick="onNew()"/></td>
            <td><gw:button id="ibtnSave"   img="save"      alt="Save"          onclick="onSave()"/></td>
			<td><gw:button id="ibtnDelete" img="delete"    alt="Delete"        onclick="onDelete()"/></td>
			<td><gw:button id="ibtnReport" img="excel"   alt="Print"         onclick="onReport()"/></td>
        </tr>
        </table>
    </td>
</tr>
<tr>
    <td width="100%">
	    <gw:grid   
		    id="gridD"
		    header  ="_PK|Row|Chk|No|Serial No|Invoice No|Invoice Date||_custpk|Cust Code|Cust Name|Cust Name Sell|Tax Code|Description|Net Books|Tax Rate|Tax Books|Voucher No|_trh_pk|_trd_pk"
		    format  ="0|0|3|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0"  
		    aligns  ="1|1|1|1|1|1|1|1|1|1|0|0|1|0|3|1|3|1|1|1"
		    defaults="|||||||||||||||||||"  
		    editcol ="0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
		    widths  ="400|500|400|800|1800|1500|1500|250|400|1000|2500|2500|1500|2000|1500|1000|1500|2000|400|400"
		    styles  ="width:100%; height:187"
		    sorting ="F"
		    acceptNullDate="T"
		    onafteredit     = "SelectChange()"
		    oncelldblclick  = "OnDoubleClk()"
		    />
    </td>
</tr>
</table>

<gw:textbox id="txtDescription"         style="display:none" />
<gw:textbox id="txtLocalDescription"    style="display:none" />
<gw:textbox id="txthgtrh"               style="display:none" />
<gw:textbox id="txthgtrd"               style="display:none" />
<gw:textbox id="txtacpk"                style="display:none" />
	<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>


<gw:grid style="Display:none"
    id      ="idGridTempItem"
    header  ="itemYN|itemnm"
    format  ="0|0"
    aligns  ="0|0"
    defaults="|"
    editcol ="0|0"
    widths  ="1300|3500"
    styles  ="width:100%; height:100"
/>

</body>
</html>
