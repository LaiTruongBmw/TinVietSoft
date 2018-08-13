<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser("acnt")%>
<head id="Head1" runat="server">
    <title>Allocation Cost(Goods)</title>
</head>

<script>
    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;      
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
//    idGrid.GetGridControl().FrozenCols = 2 ;
var std_ym = "<%=CtlLib.SetDataSQL("select max (std_ym)  from tac_whmmclose where del_if = 0 and close_yn = 'Y'")%>";
	if(std_ym != ""){
		dtMonth.SetDataText(std_ym);
		
	}
    OnMergeHeader();
	OnFormatGrid();
}
//------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data) ;
	ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(A.CODE) code, A.code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'EACBK054' and A.use_yn = 'Y' and A.code = '1' " )%>";	
	lstRptType.SetDataText(ls_data);
	lstRptType.value = '1' ;
	btnMakeSlip.SetEnable(false);
}
//------------------------------------------------------------------------
function OnDataReceive(obj)
{
	if(obj.id == 'fmgf00230')
	{
		var i ;
		var v_sum_consump_amt = 0 ;
		var v_sum_consump_qty = 0 ;
		var v_by_prod_qty = 0, v_prod_qty = 0, v_defect_qty = 0, v_defect_amt = 0;
		var v_raw_mat_qty = 0, v_raw_mat_amt = 0, v_total_gener_cost = 0;
		var v_by_prod_amt = 0 ;
		var v_sum_manufacture_cost = 0, v_material_cost = 0;
		for( i =1; i < idGrid.rows; i++)
		{
			v_prod_qty += Number(idGrid.GetGridData(i,1 ));
			v_sum_manufacture_cost += Number(idGrid.GetGridData(i, 2));
			v_sum_consump_qty += Number(idGrid.GetGridData(i, 4 ));
			v_sum_consump_amt += Number(idGrid.GetGridData(i, 5));
			v_raw_mat_amt += Number(idGrid.GetGridData(i, 6 ));
			v_total_gener_cost += Number(idGrid.GetGridData(i, 7));
			v_by_prod_qty += Number(idGrid.GetGridData(i, 8));
			v_by_prod_amt += Number(idGrid.GetGridData(i, 9));						
		}
		idGrid.AddRow();
		idGrid.SetGridText(idGrid.rows - 1, 1, v_prod_qty);
		idGrid.SetGridText(idGrid.rows - 1, 2, v_sum_manufacture_cost);
		idGrid.SetGridText(idGrid.rows - 1, 4, v_sum_consump_qty);
		idGrid.SetGridText(idGrid.rows - 1, 5, v_sum_consump_amt);
		idGrid.SetGridText(idGrid.rows - 1, 6, v_raw_mat_amt);
		idGrid.SetGridText(idGrid.rows - 1, 7, v_total_gener_cost);
		idGrid.SetGridText(idGrid.rows - 1, 8, v_by_prod_qty);
		idGrid.SetGridText(idGrid.rows - 1, 9, v_by_prod_amt);
		idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1,idGrid.cols-1,0xA9EBD7);
	}
}
//------------------------------------------------------------------------
function OnFormatGrid(iCase)
{
//Item Code|Prod Qty|Manufacturing Cost|Unit Cost|Consumption Qty|Comsumption Amt|Material Cost|
//General Cost|By prod qty|By prod Amt|_Item_PK|Defect Qty|Defect Amt
	var fg = idGrid.GetGridControl();
	fg.ColFormat(1) = "#,###,###,###.##R"; // prod qty
	fg.ColFormat(2) = "#,###,###,###R"; // manufacture cost
	fg.ColFormat(3) = "#,###,###,###R"; // unit cost
	fg.ColFormat(4) = "#,###,###,###.##R"; // Consumption Qty
	fg.ColFormat(5) = "#,###,###,###R"; //Comsumption Amt
	fg.ColFormat(6) = "#,###,###,###R"; // Material Cost
	fg.ColFormat(7) = "#,###,###,###R"; //General Amt
	fg.ColFormat(8) = "#,###,###,###.##R"; // By prod qty
	fg.ColFormat(9) = "#,###,###,###R"; // By prod amt
	fg.ColFormat(11) = "#,###,###,###.##R"; // Defect Qty
	fg.ColFormat(12) = "#,###,###,###.##R"; // Defect Amt
	
}
//-----------------------------------------------------
//function Upcase()
//{
//    var c = String.fromCharCode (event.keyCode);
//	var x = c.toUpperCase().charCodeAt(0);
//	event.keyCode = x;
//}	
//-----------------------------------------------------
function OnSearch()
{
	fmgf00230.Call('SELECT');
}
//-----------------------------------------------------
function OnExcel()
{
	// var url =System.RootURL + '/standard/reports/fm/gf/fmgf00230.aspx?p_std_ym=' + dtMonth.value + '&p_tco_company_pk=' + lstCompany.value + '&p_mat_grp=' + txtMat_Grp_2.text ;
      //System.OpenTargetPage(url); 
	switch(lstRptType.value)
	{
		case "0":
	   var url =System.RootURL + '/standard/reports/fm/gf/rpt_fmgf00230_Allocation_Method.aspx?p_std_ym=' + dtMonth.value + '&p_comp_pk=' + lstCompany.value ;
		System.OpenTargetPage(url); 
	   break ;
	   case "1":
	   var url =System.RootURL + '/standard/reports/fm/gf/rpt_fmgf00230_Manufacturing_Cost.aspx?p_comp_pk=' + lstCompany.value + '&p_std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	   case "2":
	   var url =System.RootURL + '/standard/reports/fm/gf/rpt_fmgf00230_Cost_Checking.aspx?comp_pk=' + lstCompany.value + '&p_std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	   case "3":
	   var url =System.RootURL + '/standard/reports/fm/gf/fmgf00230_cost_collect.aspx?comp_pk=' + lstCompany.value + '&std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	   case "4":
	   var url =System.RootURL + '/standard/reports/fm/gf/fmgf00230_Profit_Loss_income.aspx?comp_pk=' + lstCompany.value + '&std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	   case "5":
	   var url =System.RootURL + '/standard/reports/fm/gf/fmgf00230_manufacturing_cost.aspx?comp_pk=' + lstCompany.value + '&std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	   case "6":
	   var url =System.RootURL + '/standard/reports/fm/gf/fmgf00230_Sale_Expense.aspx?comp_pk=' + lstCompany.value + '&std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	    case "7":
	   var url =System.RootURL + '/standard/reports/fm/gf/fmgf00230_General_Expense.aspx?comp_pk=' + lstCompany.value + '&std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;

	   //  var url =System.RootURL + '/standard/reports/fm/gf/rpt_fmgf00230_WIP_monthy.aspx?p_std_ym='+dtMonth.value+"&p_comp_pk="+lstCompany.value;
     // System.OpenTargetPage(url); 
	} 
}
//-----------------------------------------------------
function OnProcess()
{
	
}		
//-----------------------------------------------------
function OnMergeHeader()
{
}
//-----------------------------------------------------
function OnMakeSlip()
{
	
}
//-----------------------------------------------------
function OnCancelSlip()
{
	
}
//-----------------------------------------------------
function OnShowDTL()
{
	
	//fmgf00230_2.Call("SELECT");
}
//-----------------------------------------------------
function OnRemove()
{
	if(confirm("Are you sure you want to remove data?"))
	{
		
	}
}
//-----------------------------------------------------
</script>

<body>
    <!-------------------------------------------------------------------->
  <gw:data id="fmgf00230" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="acnt.sp_sel_fmgf00230" > 
                <input bind="idGrid" >                 
                     <input bind="lstCompany"/>	
					 <input bind="dtMonth"/>
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>      
	
	<!-------------------------------------------------------------------->
		

	<table style="width:100%; height:100% " border="1" cellpadding="0" cellspacing="0"  >
    <tr style="height:10%" >
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%" >
                <tr>
					<td style="width:20%;"></td>
					<td style="width:20%;"></td>
					<td style="width:10%;"></td>
					<td style="width:10%;"></td>
					<td style="width:5%;"></td>
					<td style="width:5%;"></td>
					<td style="width:5%;"></td>
					<td style="width:5%;"></td>
					<td style="width:10%;"></td>
					<td style="width:10%;"></td>
                </tr>
                <tr >
                    <td align="right">Company</td>
                    <td align="left"><gw:list id="lstCompany" styles="width:100%" /></td>
					<td align="right">Month</td>
					<td align="left"><gw:datebox id="dtMonth" lang="1" type="month" /></td>					
					<td align="right"><gw:icon id="btnProcess" text="Process" alt="Process Data" onclick="OnProcess()" style="display:none;" /></td>
					<td align="right"><gw:icon id="btnMakeSlip" text="Make Slip" alt="Make Slip" onclick="OnMakeSlip()" style="display:none;" /></td>
					<td align="right"><gw:icon id="btnCancelSlip" text="Cancel Slip" alt="Cancel Slip" onclick="OnCancelSlip()" style="display:none;" /></td>
					<td align="right"><gw:icon id="btnRemove" text="Remove" alt="Remove" onclick="OnRemove()" style="display:none;" /></td>
					<td align="right"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
					<td align="left"><gw:imgBtn id="btnExcel" img="excel" alt="Print Report" onclick="OnExcel()" /></td>
                </tr>
				<tr>
					<td align="right">Seq</td>
					<td align="left"><gw:textbox id="txtSeq" styles="width:100%" /></td>
					<td align="right">Report</td>					
					<td align="left" colspan="2" ><gw:list id="lstRptType" styles="width:100%" >						
					</gw:list>
					</td>
				</tr>
            </table>            
        </td>                     
    </tr>        
    <tr style="height:90%" >
        <td >
            <table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%"  >
                <tr>
                    <td>					
                        <gw:grid id="idGrid" 
                            header="Item Code|Prod Qty|Manufacturing Cost|Unit Cost|Consumption Qty|Comsumption Amt|Material Cost|General Cost|By prod qty|By prod Amt|_Item_PK|Defect Qty|Defect Amt|-"
                            format="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                            aligns="1|3|3|3|3|3|3|3|3|3|0|3|3|0"
                            defaults="|||||||||||||" 
                            editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                            widths="1500|1500|2000|2000|2000|2000|2000|2000|2000|2000|0|1800|1800|0"
                            styles="width:100%; height:100% " 
                            acceptNullDate="T" 
                            sorting="F" 
							oncellclick=""
                            />                    
                    </td>
                </tr>
            </table>
        </td>
    </tr>	
</table>
<gw:textbox id="txtReturn" styles="display:none; " />
<gw:textbox id="txtMat_Grp_2" styles="display:none; " />      
<gw:textbox id="txtMstPK" styles="display:none; " />         
</body>
</html>