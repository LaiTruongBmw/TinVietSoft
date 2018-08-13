<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1"  runat="server">
    <title>In Out Bal Inq.</title>
</head>

<script>
   
    var  user_pk = "<%=Session("USER_PK")%>" ;
    var  user_name = "<%=Session("USER_NAME")%>" ;
    var  user_id = "<%=Session("USER_ID")%>" ;
	var org_pk = "<%=Session("TCO_ORG_PK")%>" ;
	
//-----------------------------------------------------
function BodyInit()
{
	System.Translate(document);
	BindingDataList();
} 
//-----------------------------------------------------
 function BindingDataList()
 {
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
	ls_data     = "<%=CtlLib.SetListDataSQL("select pk, wh_id ||'-' || WH_NAME from tlg_in_warehouse where del_if = 0 and use_yn = 'Y' order by wh_id ")%>|0|ALL";
	lstWH.SetDataText(ls_data);
	lstWH.value = '0';
	lstPurOrigin.value = '0';
	ls_data = "<%=CtlLib.SetListDataFUNC("select SF_A_GET_COMMONCODE('EACBK013') from dual")%>"; 
	lstRptType.SetDataText(ls_data);
	
 }  
 //-----------------------------------------------------
 
function OnPopUp(iObject)
{
	switch(iObject)
	{
		case 'Group Item':
		break;
		case 'Item Code':
			var fpath   = System.RootURL + "/standard/forms/fm/gf/PopUpGetOneItem.aspx?purchase_yn=Y" + "&group_pk=" ;
			var object  = System.OpenModal(fpath , 750 , 550 , 'resizable:yes;status:yes'); 
			if ( object != null )  
			{
				if (object[0] != 0)
				{
					txtItemNM.text = object[2]; //item name
					txtItemPK.text = object[0]; // item pk
					txtItemCD.text =object[1];     // item code
				}
			}					
		break;
		case 'Cost Center':
			var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
			var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
			if ( object != null )  
			{
				if (object[2] != 0)
				{
					txtCenterPK.text = object[2]; //PL PK
					txtPLCD.text = object[0]; // PL Code
					txtPLNM.text =object[1];     // PL Name
				}
			}		
		break;
		case 'Account code':
			var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
			o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if (o != null)
			{
				if(o[3] != 0)
				{
					txtAccPK.text = o[3];
					txtAccCD.text = o[0];
					txtAccNM.text = o[1];
				}				
			}			
		break;
	}
}
//----------------------------------------------------------
function OnReset(iCase)
{
	switch(iCase)
	{
		case 'Item Group':
			txtGroupItemCD.text = '';
			txtGroupItemNM.text = '';
			txtItemGrpPK.text = '';
		break;
		case 'Account Code':
			txtAccPK.text  = '';
			txtAccCD.text = '';
			txtAccNM.text = '';
		break;
		case 'Cost Center':
			txtPLCD.text = '';
			txtPLNM.text = '';
			txtCenterPK.text = '';
		break;
		case 'Item Code':
			txtItemPK.text = '';
			txtItemCD.text ='';
			txtItemNM.text = '';
		break;
	}
}
//----------------------------------------------------------

function OnDataReceive(iObj)
{
	switch(iObj.id)
	{
		case "fmgf00220":
			var i;
			var l_qty_begin = 0, l_famt_begin = 0, l_amt_begin = 0;
			var l_qty_ap = 0, l_famt_ap = 0, l_amt_ap = 0;
			var l_qty_return = 0, l_famt_return = 0, l_amt_return = 0;
			var l_qty_move	= 0, l_famt_move = 0, l_amt_move = 0;
			var l_o_qty_out = 0, l_o_famt_out = 0, l_o_amt_out = 0;
			var l_o_qty_move = 0, l_o_famt_move = 0, l_o_amt_move = 0;
			var l_qty_end = 0, l_famt_end = 0, l_amt_end = 0;
			for(i= 1; i < grdIOB.rows; i++)
			{
				l_qty_begin += Number(grdIOB.GetGridData(i, 8));
				l_famt_begin += Number(grdIOB.GetGridData(i, 9));
				l_amt_begin += Number(grdIOB.GetGridData(i, 10));
				l_qty_ap += Number(grdIOB.GetGridData(i, 11));
				l_famt_ap += Number(grdIOB.GetGridData(i, 12));
				l_amt_ap += Number(grdIOB.GetGridData(i, 13));
				l_qty_return += Number(grdIOB.GetGridData(i, 14));
				l_famt_return += Number(grdIOB.GetGridData(i, 15));
				l_amt_return += Number(grdIOB.GetGridData(i, 16));
				l_qty_move += Number(grdIOB.GetGridData(i, 17));
				l_famt_move += Number(grdIOB.GetGridData(i, 18));
				l_amt_move += Number(grdIOB.GetGridData(i, 19));
				l_o_qty_out += Number(grdIOB.GetGridData(i, 20));
				l_o_famt_out += Number(grdIOB.GetGridData(i, 21));
				l_o_amt_out += Number(grdIOB.GetGridData(i, 22));
				l_o_qty_move += Number(grdIOB.GetGridData(i, 23));
				l_o_famt_move += Number(grdIOB.GetGridData(i, 24));
				l_o_amt_move += Number(grdIOB.GetGridData(i, 25));
				
				l_qty_end += Number(grdIOB.GetGridData(i, 29));
				l_famt_end += Number(grdIOB.GetGridData(i, 30));
				l_amt_end += Number(grdIOB.GetGridData(i, 31));			
			}
			grdIOB.AddRow();
			grdIOB.SetGridText(grdIOB.rows - 1, 8, l_qty_begin);
			grdIOB.SetGridText(grdIOB.rows - 1, 9, l_famt_begin);
			grdIOB.SetGridText(grdIOB.rows - 1, 10, l_amt_begin);
			grdIOB.SetGridText(grdIOB.rows - 1, 11, l_qty_ap);
			grdIOB.SetGridText(grdIOB.rows - 1, 12, l_famt_ap);
			grdIOB.SetGridText(grdIOB.rows - 1, 13, l_amt_ap);
			
			grdIOB.SetGridText(grdIOB.rows - 1, 14, l_qty_return);
			grdIOB.SetGridText(grdIOB.rows - 1, 15, l_famt_return);
			grdIOB.SetGridText(grdIOB.rows - 1, 16, l_amt_return);

			grdIOB.SetGridText(grdIOB.rows - 1, 17, l_qty_move);
			grdIOB.SetGridText(grdIOB.rows - 1, 18, l_famt_move);
			grdIOB.SetGridText(grdIOB.rows - 1, 19, l_amt_move);

			grdIOB.SetGridText(grdIOB.rows - 1, 20, l_o_qty_out);
			grdIOB.SetGridText(grdIOB.rows - 1, 21, l_o_famt_out);
			grdIOB.SetGridText(grdIOB.rows - 1,22, l_o_amt_out);
			
			grdIOB.SetGridText(grdIOB.rows - 1, 23, l_o_qty_move);
			grdIOB.SetGridText(grdIOB.rows - 1, 24, l_o_famt_move);
			grdIOB.SetGridText(grdIOB.rows - 1,25, l_o_amt_move);
			
			grdIOB.SetGridText(grdIOB.rows - 1, 29, l_qty_end);
			grdIOB.SetGridText(grdIOB.rows - 1, 30, l_famt_end);
			grdIOB.SetGridText(grdIOB.rows - 1, 31, l_amt_end);
			
			grdIOB.SetCellBgColor(grdIOB.rows-1, 0,grdIOB.rows-1,grdIOB.cols-1,0xA9EBD7);
			Format_grdIOB();
		break ;
		case "fmgf00220_1":
			Format_grdBAL();
			var l_qty_end = 0, l_famt_end = 0, l_amt_end = 0, i;
			for(i= 1; i < grdBAL.rows; i++)
			{
				l_qty_end += Number(grdBAL.GetGridData(i, 8));
				l_famt_end += Number(grdBAL.GetGridData(i, 9));
				l_amt_end += Number(grdBAL.GetGridData(i, 10));
			}
			grdBAL.AddRow();
			grdBAL.SetGridText(grdBAL.rows - 1, 8, l_qty_end);
			grdBAL.SetGridText(grdBAL.rows - 1, 9, l_famt_end);
			grdBAL.SetGridText(grdBAL.rows - 1, 10, l_amt_end);			
			grdBAL.SetCellBgColor(grdBAL.rows-1, 0, grdBAL.rows-1, grdBAL.cols-1,0xA9EBD7);
		break;
		case 'fmgf00220_2':
			Format_grdOUT();
			var l_qty_out = 0, l_famt_out = 0, l_amt_out = 0, i;
			var l_qty_moveout = 0, l_famt_moveout = 0, l_amt_moveout = 0;
			var l_qty_outvendor = 0, l_famt_outvendor = 0, l_amt_outvendor = 0;
			for(i= 1; i < grdOUT.rows; i++)
			{
				l_qty_out += Number(grdOUT.GetGridData(i, 8));
				l_famt_out += Number(grdOUT.GetGridData(i, 9));
				l_amt_out += Number(grdOUT.GetGridData(i, 10));
				l_qty_moveout += Number(grdOUT.GetGridData(i, 11));
				l_famt_moveout += Number(grdOUT.GetGridData(i, 12));
				l_amt_moveout += Number(grdOUT.GetGridData(i, 13));
				l_qty_outvendor += Number(grdOUT.GetGridData(i, 14));
				l_famt_outvendor += Number(grdOUT.GetGridData(i, 15));
				l_amt_outvendor += Number(grdOUT.GetGridData(i, 16));				
			}
			grdOUT.AddRow();
			grdOUT.SetGridText(grdOUT.rows - 1, 8, l_qty_out);
			grdOUT.SetGridText(grdOUT.rows - 1, 9, l_famt_out);
			grdOUT.SetGridText(grdOUT.rows - 1, 10, l_amt_out);			
			grdOUT.SetGridText(grdOUT.rows - 1, 11, l_qty_moveout);
			grdOUT.SetGridText(grdOUT.rows - 1, 12, l_famt_moveout);
			grdOUT.SetGridText(grdOUT.rows - 1, 13, l_amt_moveout);			
			grdOUT.SetGridText(grdOUT.rows - 1, 14, l_qty_outvendor);
			grdOUT.SetGridText(grdOUT.rows - 1, 15, l_famt_outvendor);
			grdOUT.SetGridText(grdOUT.rows - 1, 16, l_amt_outvendor);						
			grdOUT.SetCellBgColor(grdOUT.rows-1, 0, grdOUT.rows-1, grdOUT.cols-1,0xA9EBD7);		
		break ;
		case 'fmgf00220_3':
			Format_grdIN();
			grdIN.Subtotal(1   ,2                ,-1       ,"6!7!8!9!10!11!12!13",""          ,true        ,0        ," Grand total %s ",0X00ffff,0x000000,true);
			grdIN.Subtotal(1,2,0,"6!7!8!9!10!11!12!13","",true,0,"    Total %s ");
		break;
	}
}
//---------------------------------------------------
function OnSearch()
{
	fmgf00220.Call("SELECT");
}
//------------------------------------------------------------
function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}
//------------------------------------------------------------
function Format_grdIOB()
{
	var fg = grdIOB.GetGridControl();
	fg.ColFormat(8) = "###,###,###.###R";
	fg.ColFormat(9) = "###,###,###,###R";
	fg.ColFormat(10) = "###,###,###,###.##R";
	fg.ColFormat(11) = "###,###,###.###R";
	fg.ColFormat(12) = "###,###,###,###R";
	fg.ColFormat(13) = "###,###,###,###.##R";
	fg.ColFormat(14) = "###,###,###.###R";
	fg.ColFormat(15) = "###,###,###,###R";
	fg.ColFormat(16) = "###,###,###,###.##R";
	fg.ColFormat(17) = "###,###,###.###R";
	fg.ColFormat(18) = "###,###,###,###R";
	fg.ColFormat(19) = "###,###,###,###.##R";
	fg.ColFormat(20) = "###,###,###.###R";
	fg.ColFormat(21) = "###,###,###,###R";
	fg.ColFormat(22) = "###,###,###,###.##R";
	fg.ColFormat(23) = "###,###,###.###R";
	fg.ColFormat(24) = "###,###,###,###R";
	fg.ColFormat(25) = "###,###,###,###.##R";
	fg.ColFormat(26) = "###,###,###.###R";
	fg.ColFormat(27) = "###,###,###,###R";
	fg.ColFormat(28) = "###,###,###,###.##R";	
	fg.ColFormat(30) = "###,###,###,###R";
	fg.ColFormat(31) = "###,###,###,###.##R";		
}
//------------------------------------------------------------
function Format_grdOUT()
{
	var fg = grdOUT.GetGridControl();
	fg.ColFormat(8) = "###,###,###.###R";
	fg.ColFormat(9) = "###,###,###,###R";
	fg.ColFormat(10) = "###,###,###,###.##R";
	fg.ColFormat(11) = "###,###,###.###R";
	fg.ColFormat(12) = "###,###,###,###R";
	fg.ColFormat(13) = "###,###,###,###.##R";
	fg.ColFormat(14) = "###,###,###.###R";
	fg.ColFormat(15) = "###,###,###,###R";
	fg.ColFormat(16) = "###,###,###,###.##R";
}
//------------------------------------------------------------

function Format_grdBAL()
{
	var fg = grdBAL.GetGridControl();
	fg.ColFormat(8) = "###,###,###.###R";
	fg.ColFormat(9) = "###,###,###,###R";
	fg.ColFormat(10) = "###,###,###,###.##R";
}
//------------------------------------------------------------
function Format_grdOUT()
{
	var fg = grdOUT.GetGridControl();
	fg.ColFormat(8) = "###,###,###.###R";
	fg.ColFormat(9) = "###,###,###,###R";
	fg.ColFormat(10) = "###,###,###,###.##R";
	fg.ColFormat(11) = "###,###,###.###R";
	fg.ColFormat(12) = "###,###,###,###R";
	fg.ColFormat(13) = "###,###,###,###.##R";
	fg.ColFormat(14) = "###,###,###.###R";
	fg.ColFormat(15) = "###,###,###,###R";
	fg.ColFormat(16) = "###,###,###,###.##R";
}
//------------------------------------------------------------
function Format_grdIN()
{
	var fg = grdIN.GetGridControl();
	fg.ColFormat(5) = "###,###,###.###R";
	fg.ColFormat(6) = "###,###,###,###.##R";
	fg.ColFormat(7) = "###,###,###,###R";
	fg.ColFormat(8) = "###,###,###.##R";
	fg.ColFormat(9) = "###,###,###,###R";
	fg.ColFormat(10) = "###,###,###,###.##R";
}
//------------------------------------------------------------
function OnSearchTab()
{
	var l_tab = tabItem.GetCurrentPageNo();
	
	switch(l_tab)
	{
		case 0:
				fmgf00220.Call('SELECT');
		break ;
		case 1:
			fmgf00220_1.Call('SELECT');
		break ;
		case 2:
			fmgf00220_2.Call('SELECT');
		break;
		case 3:
		fmgf00220_3.Call('SELECT');
		break ;
	}
}
//------------------------------------------------------------
function OnExcel()
{
	if(lstRptType.value == "B")
	{
		var url = System.RootURL + "/standard/reports/fm/gf/fmgf00220.aspx?company_pk=" + lstCompany.value + "&from_dt=" + dtFrom.value + "&to_dt=" + dtTo.value + "&item=" + txtItemCD.text + "&tac_abplcenter_pk=" + txtCenterPK.text ;
		System.OpenTargetPage(url);			
	}
	else if(lstRptType.value == "I")
	{
	    var url = System.RootURL + "/standard/reports/fm/gf/fmgf00220_In.aspx?company_pk=" + lstCompany.value + "&from_dt=" + dtFrom.value + "&to_dt=" + dtTo.value ;
		System.OpenTargetPage(url);		
	}
	else if(lstRptType.value == "O")
	{
	    var url = System.RootURL + "/standard/reports/fm/gf/fmgf00220_Out.aspx?company_pk=" + lstCompany.value + "&from_dt=" + dtFrom.value + "&to_dt=" + dtTo.value + "&item=" + txtItemCD.text + "&tac_abplcenter_pk=" + txtCenterPK.text ;
		System.OpenTargetPage(url);		
	}
	else if(lstRptType.value == "T")
	{
	    var url = System.RootURL + "/standard/reports/fm/gf/fmgf00220_Transfer.aspx?company_pk=" + lstCompany.value + "&from_dt=" + dtFrom.value + "&to_dt=" + dtTo.value ;
		System.OpenTargetPage(url);			
	}
}
//=====================================nt===================================================
function OnPrint(n)
{
	switch(n)
	{
		case 1:
			if(lstRptType.value == "I")
				{
					var url = System.RootURL + "/standard/reports/60/17/rpt_ac6013_6070230_tab_in.aspx?p_compk=" + lstCompany.value +
					"&p_from_dt="+ dtFrom.value +"&p_to_dt="+ dtTo.value +"&p_grp_item_pk=" + txtItemGrpPK.text + "&p_item_cd="
					+ txtItemCD.text + "&p_item_nm=" + txtItemNM.text + "&p_acc_pk=" + txtAccPK.text + "&p_wh_pk=" + lstWH.value +
					"&p_tac_abplcenter_pk=" + txtCenterPK.text + "&p_asset_yn=" + chkAsset.value + "&p_form=" + lstform.value+
					"&p_from_text="+dtFrom.text+"&p_to_text="+ dtTo.text+"&p_purion_text="+lstPurOrigin.text+"&p_form_text="+lstWH.text;
					System.OpenTargetPage(url);		
				}
			else
				{
					alert('You must select report type !!!');
				}
		break;
		
	}
}
//=====================================ntm===================================================
</script>
<body>
<!------------------------------------------------------------------------>
  <gw:data id="fmgf00220" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_in_out_bal_inq" > 
                <input bind="grdIOB" >                 
                    <input bind="lstCompany" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtItemGrpPK" />
                    <input bind="txtItemCD" />                    
                    <input bind="txtItemNM" />
                    <input bind="txtAccPK" />
                    <input bind="lstWH" />					
					<input bind="txtCenterPK" />           
					<input bind="chkAsset" />
					<input bind="txtAccCD" />
                </input>
                <output  bind="grdIOB" />
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------>
  <gw:data id="fmgf00220_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="sp_sel_fmgf00220_1" > 
                <input bind="grdBAL" >                 
                    <input bind="lstCompany" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtItemGrpPK" />
                    <input bind="txtItemCD" />                    
                    <input bind="txtItemNM" />
                    <input bind="txtAccPK" />
                    <input bind="lstWH" />
					<input bind="txtCenterPK" />  
					<input bind="chkAsset" />         
                </input>
                <output  bind="grdBAL" />
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------>
  <gw:data id="fmgf00220_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="sp_sel_fmgf00220_2" > 
                <input bind="grdOUT" >                 
                    <input bind="lstCompany" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtItemGrpPK" />
                    <input bind="txtItemCD" />                    
                    <input bind="txtItemNM" />
                    <input bind="txtAccPK" />
                    <input bind="lstWH" />
					<input bind="txtCenterPK" />   
					<input bind="chkAsset" />        
                </input>
                <output  bind="grdOUT" />
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------>
  <gw:data id="fmgf00220_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="sp_sel_fmgf00220_3" > 
                <input bind="grdIN" >                 
                    <input bind="lstCompany" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtItemGrpPK" />
                    <input bind="txtItemCD" />                    
                    <input bind="txtItemNM" />
                    <input bind="txtAccPK" />
                    <input bind="lstWH" />
					<input bind="txtCenterPK" />      
					<input bind="chkAsset" />  
					<input bind="lstform" />  
		         </input>
                <output  bind="grdIN" />
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------>
<table border="1" style="width:100%" cellpadding="0" cellspacing="0" style="height:100%">
    <tr style="height:100%"> 
        <td id="tRIGHT" style="width: 100%; ">
            <table style="width: 100%; height:100%; " border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="15%" ></td>
					<td width="12%" ></td>
					<td width="3%" ></td>
					<td width="12%" ></td>
					<td width="15%" ></td>
					<td width="10%" ></td>
					<td width="20%" ></td>
					<td width="3%" ></td>
					<td width="5%" ></td>
					<td width="5%" ></td>
				</tr>
                <tr style="height:4%">
                    <td align="right" >Company&nbsp;</td>
                    <td align="right" colspan="3" ><gw:list id="lstCompany" styles="width:100%;" /></td>
                    <td align="right"><a title="Click here to select item group" href="#tips" onclick="OnPopUp('Group Item')" >Group Item&nbsp;</a></td>
                    <td align="left"><gw:textbox id="txtGroupItemCD" styles="width:100%;" /></td>
					<td align="left"><gw:textbox id="txtGroupItemNM" styles="width:100%;" /></td>
					<td align="left"><gw:imgbtn id="btnReset" img="reset" alt="Reset" onclick="OnReset('Item Group')" /></td>
                    <td align="right"><gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearchTab()" /></td>
                    <td align="left" ><gw:imgbtn id="btnPrint" img="excel" alt="Excel" onclick="OnExcel()" /></td>
					<td align="left" ><gw:Button id="btnPrint1" img="excel" text="Print" alt="Print Out Report File Excel" onclick="OnPrint(1)" /></td>
					
                </tr>
				<tr style="height:4%">
					<td align="right">From&nbsp;</td>
					<td align="left"><gw:datebox id="dtFrom" lang="1" /></td>
					<td align="center">~</td>
					<td align="left"><gw:datebox id="dtTo" lang="1" /></td>
					<td align="right"><a title="Click here to select item code" href="#tips" onclick="OnPopUp('Item Code')" >Item Code&nbsp;</a></td>
					<td><gw:textbox id="txtItemCD" styles="width:100%;" text="" /></td>
					<td><gw:textbox id="txtItemNM" styles="width:100%;" text="" /></td>					
					<td align="left"><gw:imgbtn id="btnReset_1" img="reset" alt="Reset" onclick="OnReset('Item Code')" /></td>
					<td align="right">Fixed Asset&nbsp;</td>
					<td align="left"><gw:checkbox id="chkAsset" value="F" /></td>
				</tr>	
				<tr style="height:4%;">
					<td align="right">Report Type&nbsp;</td>
					<td colspan="3" align="left" ><gw:list id="lstRptType" styles="width:100%;" /></td>
					<td align="right"><a title="Click here to select Cost Center" href="#tips" onclick="OnPopUp('Cost Center')">Cost Center&nbsp;</a></td>
					<td align="left"><gw:textbox id="txtPLCD" styles="width:100%;" /></td>
					<td align="left"><gw:textbox id="txtPLNM" styles="width:100%;" /></td>					
					<td align="left"><gw:imgbtn id="btnReset_2" img="reset" alt="Reset" onclick="OnReset('Cost Center')" /></td>
				</tr>
				<tr style="height:4%;">
					<td align="right">Purchase Origin&nbsp;</td>
					<td align="left" colspan="3"><gw:list id="lstPurOrigin" styles="width:100%;" >
					<data>DATA|0|ALL|1|Domestic|2|Oversea</data>
					</gw:list>
					</td>
					<td align="right">Warehouse&nbsp;</td>
					<td colspan="2" ><gw:list id="lstWH" styles="width:100%;" /></td>										
				</tr>
				<tr style="height:4%;">
				    <td align="right">Form</td>
					<td align="left" colspan="3"><gw:list id="lstform" styles="width:100%;" >
					<data>DATA|0|ALL|AC0604|AC.06.04 A/P Domestic|AC0605|AC.06.05 A/P Foreign|AC0601|AC.06.01 A/P Others|AC0610|AC.06.10 Accrued Expense Entry</data>
					</gw:list>
					</td>
					<td colspan="1" align="right"><a title="Click here to select account code" href="#tips" onclick="OnPopUp('Account code')" >Account Code&nbsp;</a></td>
					<td ><gw:textbox id="txtAccCD" styles="width:100%;" /></td>
					<td ><gw:textbox id="txtAccNM" styles="width:100%;" /></td>
					<td align="left"><gw:imgbtn id="btnReset_3" img="reset" alt="Reset" onclick="OnReset('Account Code')" /></td>
				</tr>
                <tr style="height:80%;">
                    <td colspan="11">
						<gw:tab id="tabItem" onpageactivate="OnSearchTab()" >
							<table name="IOB" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0"  >
								<tr>
									<td>
										<gw:grid id='grdIOB'
											header='No|Account Code|Account Name|Item Code|Item Name|WH|Cost Center|Cost Center Name|Begin Qty|Begin TrAmt|Begin BkAmt|In Qty (A/P)|In TR Amt(A/P)|In BK Amt(A/P)|In Qty(Return)|In TR Amt(Return)|In BK Amt(Return)|In Qty(Move)|In Tr Amt(Move)|In Bk Amt(Move)|Out Qty|Out TR Amt|Out BK Amt|Out Qty (Move)|Out TR Amt  (Move)|Out BK Amt (Move)|_Out Qty(Vendor)|_Out Tr Amt(Vendor)|_Out Bk Amt(Vendor)|Endding Qty|Endding TR Amt|Endding BK Amt'
											format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
											aligns='1|1|0|1|0|0|1|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
											defaults='|||||||||||||||||||||||||||||||' 
											editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
											widths='600|1200|1500|1200|1500|1500|1400|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
											acceptNullDate='T'
											sorting='T' 
											styles='width:100%; height:100%' 
											/>                                                                                                                               										
									</td>
								</tr>
							</table>
							<table name="BAL" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0"  >
								<tr>
									<td>
										<gw:grid id='grdBAL'
											header='No|Account Code|Account Name|Item Code|Item Name|WH|Cost Center|Cost Center Name|Endding Qty|Endding TR Amt|Endding BK Amt'
											format='0|0|0|0|0|0|0|0|0|0|0'
											aligns='1|1|0|1|0|0|1|0|3|3|3'
											defaults='||||||||||' 
											editcol='0|0|0|0|0|0|0|0|0|0|0'
											widths='600|1200|1500|1200|1500|1500|1400|1600|1500|1500|1500'
											acceptNullDate='T'
											sorting='T' 
											styles='width:100%; height:100%' 
											/>                                                                                                                               									
									</td>
								</tr>
							</table>
							<table name="OUT" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0"  >
								<tr>
									<td>
										<gw:grid id='grdOUT'
											header='No|Account Code|Account Name|Item Code|Item Name|WH|Cost Center|Cost Center Name|Out Qty|Out TR Amt|Out BK Amt|Out Qty (Move)|Out TR Amt  (Move)|Out BK Amt (Move)|Out Qty(Vendor)|Out TR Amt(Vendor)|Out BK Amt(Vendor)'
											format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
											aligns='1|1|0|1|0|0|1|0|3|3|3|3|3|3|3|3|3'
											defaults='||||||||||||||||' 
											editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
											widths='600|1200|1500|1200|1500|1500|1400|1600|1500|1500|1500|1500|1500|1500|1500|1500|1500'
											acceptNullDate='T'
											sorting='T' 
											styles='width:100%; height:100%' 
											/>                                                                                                                               									
									</td>
								</tr>
							</table>
							<table name="IN" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0"  >
								<tr>
									<td>
										<gw:grid id='grdIN'
											header='Form|Voucher. No.|Trans Date|Code|Name of material|Unit|Qty|U.price|Trans Amount|Books Amount|VAT Trans|VAT Books|Import Tax(trs.)|Import Tax(book.)|P/L Unit Code|P/L Unit Name|Supplier Code|Supplier Name|Invoice No(custom number)|InvoiceDate (custom date)|Remark'
											format='0|0|4|0|0|0|0|0|0|0|0|-2|-2|-2|0|0|0|0|0|0|0'
											aligns='0|0|1|1|0|1|3|3|3|3|3|3|3|3|1|0|0|0|0|0|0'
											defaults='||||||||||||||||||||' 
											editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
											widths='1000|1500|1400|1200|1500|800|1400|1300|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
											acceptNullDate='T'
											sorting='T' 
											styles='width:100%; height:100%' 
											/>                                                                                                                               									
									</td>
								</tr>
							</table>							
						</gw:tab>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </table>
<!------------------------------------------------------------------------>
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />      
<!------------------------------------------------------------------------>
<gw:textbox id="txtItemGrpPK" style="display:none" />    
<gw:textbox id="txtItemPK" style="display:none" />
<gw:textbox id="txtCenterPK" style="display:none" />
<gw:textbox id="txtAccPK" style="display:none" />
</body>
</html>
