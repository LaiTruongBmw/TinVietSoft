<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Allocation Cost(Goods)</title>
</head>

<script>
    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;      
	
	var iItem_Code = 0 ,
		iProd_Qty = 1 ,
		iManufacturing_Cost = 2 ,
		iUnitCost = 3 ,
		iConsumption_Qty = 4 ,
		iComsumption_Amt = 5 ,
		iMaterial_Cost = 6 ,
		iGeneral_Cost = 7 ,
		iNoil_Ratio = 8 ,
		iNoil_Qty = 9 ,
		iNoil_Amt = 10 ,
		iWaste_Ratio = 11 ,
		iWaste_Qty = 12 ,
		iWaste_Amt = 13 ,
		iYarn_Ratio = 14 ,
		iYarn_Qty = 15 ,
		iYarn_Amt = 16 ,
		iItem_PK = 17 ,
		iDefect_Ratio=18,
		iDefect_Qty = 19 ,
		iDefect_Amt = 20 ,
		iEmpty = 21 ;
		
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
//    idGrid.GetGridControl().FrozenCols = 2 ;
    OnMergeHeader();
	OnFormatGrid();
}
//------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data) ;
	ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(A.CODE) code, A.code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'EACBK054' and A.use_yn = 'Y' " )%>";	
	lstRptType.SetDataText(ls_data);
	lstRptType.value = '0' ;
	btnMakeSlip.SetEnable(false);
}
//------------------------------------------------------------------------
function OnDataReceive(obj)
{
	if(obj.id == 'fmgf00230')
	{
		OnMergeHeader();
		OnFormatGrid();
		var i ;
		var v_sum_consump_amt = 0 ;
		var v_sum_consump_qty = 0 ;
		var v_by_prod_qty_noil = 0, v_prod_qty = 0, v_defect_qty = 0, v_defect_amt = 0;
		var v_raw_mat_qty = 0, v_raw_mat_amt = 0, v_total_gener_cost = 0;
		var v_by_prod_amt_noil = 0 ;
		var v_sum_manufacture_cost = 0, v_material_cost = 0;
		
		var v_by_prod_qty_waste = 0 , v_by_prod_amt_waste = 0 ;
		
		var v_by_prod_qty_yarn = 0 , v_by_prod_amt_yarn = 0 ;
		
		
		for( i = 2; i < idGrid.rows; i++)
		{
			v_prod_qty += Number(idGrid.GetGridData(i, iProd_Qty ));
			v_sum_manufacture_cost += Number(idGrid.GetGridData(i, iManufacturing_Cost));
			v_sum_consump_qty += Number(idGrid.GetGridData(i, iConsumption_Qty ));
			v_sum_consump_amt += Number(idGrid.GetGridData(i, iComsumption_Amt));
			v_raw_mat_amt += Number(idGrid.GetGridData(i, iMaterial_Cost ));
			v_total_gener_cost += Number(idGrid.GetGridData(i, iGeneral_Cost));
			v_by_prod_qty_noil += Number(idGrid.GetGridData(i, iNoil_Qty));
			v_by_prod_amt_noil += Number(idGrid.GetGridData(i, iNoil_Amt));	
			
			v_by_prod_qty_waste += Number(idGrid.GetGridData(i, iWaste_Qty));
			v_by_prod_amt_waste += Number(idGrid.GetGridData(i, iWaste_Amt));	
			
			v_by_prod_qty_yarn += Number(idGrid.GetGridData(i, iYarn_Qty));
			v_by_prod_amt_yarn += Number(idGrid.GetGridData(i, iYarn_Amt));	
			
			
		}
		idGrid.AddRow();
		idGrid.SetGridText(idGrid.rows - 1, iProd_Qty, v_prod_qty);
		idGrid.SetGridText(idGrid.rows - 1, iManufacturing_Cost, v_sum_manufacture_cost);
		idGrid.SetGridText(idGrid.rows - 1, iConsumption_Qty, v_sum_consump_qty);
		idGrid.SetGridText(idGrid.rows - 1, iComsumption_Amt, v_sum_consump_amt);
		idGrid.SetGridText(idGrid.rows - 1, iMaterial_Cost, v_raw_mat_amt);
		idGrid.SetGridText(idGrid.rows - 1, iGeneral_Cost, v_total_gener_cost);
		
		idGrid.SetGridText(idGrid.rows - 1, iNoil_Qty, v_by_prod_qty_noil);
		idGrid.SetGridText(idGrid.rows - 1, iNoil_Amt, v_by_prod_amt_noil);
		
		idGrid.SetGridText(idGrid.rows - 1, iWaste_Qty, v_by_prod_qty_waste);
		idGrid.SetGridText(idGrid.rows - 1, iWaste_Amt, v_by_prod_amt_waste);

		idGrid.SetGridText(idGrid.rows - 1, iYarn_Qty, v_by_prod_qty_yarn);
		idGrid.SetGridText(idGrid.rows - 1, iYarn_Amt, v_by_prod_amt_yarn);
		
		idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1,idGrid.cols-1,0xA9EBD7);
		
		dso_search_data.Call();		
	}
	else if(obj.id == "dso_remove_data")
	{
		fmgf00230.Call("SELECT");
	}
	else if(obj.id == "dso_process_cost")
	{
		fmgf00230.Call("SELECT");
	}
	else if(obj.id == "dso_search_data")
	{
		if(txtSeq.text == "")
		{
			btnMakeSlip.SetEnable(true);
			btnCancelSlip.SetEnable(false);
		}
		else
		{
			btnCancelSlip.SetEnable(true);
			btnMakeSlip.SetEnable(false);
		}	
	}
}
//------------------------------------------------------------------------
function OnFormatGrid()
{
//Item Code|Prod Qty|Manufacturing Cost|Unit Cost|Consumption Qty|Comsumption Amt|Material Cost|
//General Cost|By prod qty|By prod Amt|_Item_PK|Defect Qty|Defect Amt
	var fg = idGrid.GetGridControl();
	fg.ColFormat(iProd_Qty) = "#,###,###,###.##R"; // prod qty
	fg.ColFormat(iManufacturing_Cost) = "#,###,###,###R"; // manufacture cost
	fg.ColFormat(iUnitCost) = "#,###,###,###R"; // unit cost
	fg.ColFormat(iConsumption_Qty) = "#,###,###,###.##R"; // Consumption Qty
	fg.ColFormat(iComsumption_Amt) = "#,###,###,###R"; //Comsumption Amt
	fg.ColFormat(iMaterial_Cost) = "#,###,###,###R"; // Material Cost
	fg.ColFormat(iGeneral_Cost) = "#,###,###,###R"; //General Amt
	fg.ColFormat(iNoil_Ratio) = "#,###,###,###.####R"; 
	fg.ColFormat(iNoil_Qty) = "#,###,###,###.##R"; // By prod qty
	fg.ColFormat(iNoil_Amt) = "#,###,###,###R"; // By prod amt
	
	fg.ColFormat(iWaste_Ratio) = "#,###,###,###.####R"; 
	
	fg.ColFormat(iWaste_Qty) = "#,###,###,###.##R"; 
	fg.ColFormat(iWaste_Amt) = "#,###,###,###.##R"; 
	
	fg.ColFormat(iYarn_Ratio) = "#,###,###,###.####R"; 
	
	fg.ColFormat(iYarn_Qty) = "#,###,###,###.##R"; 
	fg.ColFormat(iYarn_Amt) = "#,###,###,###.##R"; 
	
	fg.ColFormat(iDefect_Qty) = "#,###,###,###.##R"; 
	fg.ColFormat(iDefect_Amt) = "#,###,###,###.##R"; 
	
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
	// var url =System.RootURL + '/standard/standard/reports/fm/gf/fmgf00230.aspx?p_std_ym=' + dtMonth.value + '&p_tco_company_pk=' + lstCompany.value + '&p_mat_grp=' + txtMat_Grp_2.text ;
      //System.OpenTargetPage(url); 
	switch(lstRptType.value)
	{
		case "0":
	   var url =System.RootURL + '/standard/standard/reports/fm/gf/rpt_fmgf00230_Allocation_Method.aspx?p_std_ym=' + dtMonth.value + '&p_comp_pk=' + lstCompany.value ;
		System.OpenTargetPage(url); 
	   break ;
	   case "1":
	   var url =System.RootURL + '/standard/standard/reports/fm/gf/rpt_fmgf00230_Manufacturing_Cost.aspx?p_comp_pk=' + lstCompany.value + '&p_std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	   case "2":
	   var url =System.RootURL + '/standard/standard/reports/fm/gf/rpt_fmgf00230_Cost_Checking.aspx?comp_pk=' + lstCompany.value + '&p_std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	   case "3":
	   var url =System.RootURL + '/standard/standard/reports/fm/gf/fmgf00230_cost_collect.aspx?comp_pk=' + lstCompany.value + '&std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	   case "4":
	   var url =System.RootURL + '/standard/standard/reports/fm/gf/fmgf00230_Profit_Loss_income.aspx?comp_pk=' + lstCompany.value + '&std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	   case "5":
	   var url =System.RootURL + '/standard/standard/reports/fm/gf/fmgf00230_manufacturing_cost.aspx?comp_pk=' + lstCompany.value + '&std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	   case "6":
	   var url =System.RootURL + '/standard/standard/reports/fm/gf/fmgf00230_Sale_Expense.aspx?comp_pk=' + lstCompany.value + '&std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;
	    case "7":
	   var url =System.RootURL + '/standard/standard/reports/fm/gf/fmgf00230_General_Expense.aspx?comp_pk=' + lstCompany.value + '&std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
	   break ;

	   //  var url =System.RootURL + '/standard/standard/reports/fm/gf/rpt_fmgf00230_WIP_monthy.aspx?p_std_ym='+dtMonth.value+"&p_comp_pk="+lstCompany.value;
     // System.OpenTargetPage(url); 
	} 
}
//-----------------------------------------------------
function OnProcess()
{
	
}		
//-----------------------------------------------------
function OnCancelSlip()
{
	if(confirm("Are you sure you want to cancel slip?"))
	{
		dso_cancel_slip.Call() ;
	}
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
		dso_remove_data.Call();
	}
}
//-----------------------------------------------------
function OnProcess()
{
	if(confirm("Are you sure you want to process Allocation Cost for " + dtMonth.value + " ?" ))
	{
		dso_process_cost.Call() ;
	}	
}
//-----------------------------------------------------
function OnMakeSlip()
{
	if(confirm("Are you sure you want to make slip?"))
	{
		dso_make_slip.Call() ; 
	}	
}
//-----------------------------------------------------

function OnMergeHeader()
{
	if(idGrid.rows == 1)
		idGrid.AddRow();
	
	var fg = idGrid.GetGridControl();
	fg.FixedRows = 2; 
	fg.Cell(13, 1, 0, 1, fg.Cols - 1) = true ;    
	fg.MergeCells = 5;
	
	fg.MergeRow(0) = true;   
	
	fg.MergeCol(iItem_Code) = true;
	fg.Cell(0, 0, iItem_Code, 1, iItem_Code) = 'Item Code';  

	fg.MergeCol(iProd_Qty) = true;
	fg.Cell(0, 0, iProd_Qty, 1, iProd_Qty) = 'Prod Qty';  
	
	fg.MergeCol(iManufacturing_Cost) = true;
	fg.Cell(0, 0, iManufacturing_Cost, 1, iManufacturing_Cost) = 'Manufacturing' + '\n' + 'Cost';  

	fg.MergeCol(iUnitCost) = true;
	fg.Cell(0, 0, iUnitCost, 1, iUnitCost) = 'Unit' + '\n' + 'Cost';  
	
	fg.MergeCol(iConsumption_Qty) = true;
	fg.Cell(0, 0, iConsumption_Qty, 1, iConsumption_Qty) = 'Consumption' + '\n' + 'Qty';  
	
	fg.MergeCol(iComsumption_Amt) = true;
	fg.Cell(0, 0, iComsumption_Amt, 1, iComsumption_Amt) = 'Consumption' + '\n' + 'Amt';  

	fg.MergeCol(iMaterial_Cost) = true;
	fg.Cell(0, 0, iMaterial_Cost, 1, iMaterial_Cost) = 'Material' + '\n' + 'Cost';  
	
	fg.MergeCol(iGeneral_Cost) = true;
	fg.Cell(0, 0, iGeneral_Cost, 1, iGeneral_Cost) = 'General' + '\n' + 'Cost';  
	
	fg.Cell(0, 0, iNoil_Ratio, 0, iNoil_Amt) = 'NOIL';  

	fg.Cell(0, 1, iNoil_Ratio, 1, iNoil_Ratio) = "Allo. Ratio"; 
	
	fg.Cell(0, 1, iNoil_Qty, 1, iNoil_Qty) = "Qty";
	
	fg.Cell(0, 1, iNoil_Amt, 1, iNoil_Amt) = "Amount";
	
	fg.Cell(0, 0, iWaste_Ratio, 0, iWaste_Amt) = 'WASTE'; 

	fg.Cell(0, 1, iWaste_Ratio, 1, iWaste_Ratio) = "Allo. Ratio"; 	

	fg.Cell(0, 1, iWaste_Qty, 1, iWaste_Qty) = "Qty";
	
	fg.Cell(0, 1, iWaste_Amt, 1, iWaste_Amt) = "Amount";

	fg.Cell(0, 0, iYarn_Ratio, 0, iYarn_Amt) = 'YARN'; 

	fg.Cell(0, 1, iYarn_Ratio, 1, iYarn_Ratio) = "Allo. Ratio"; 	

	fg.Cell(0, 1, iYarn_Qty, 1, iYarn_Qty) = "Qty";
	
	fg.Cell(0, 1, iYarn_Amt, 1, iYarn_Amt) = "Amount";
	
	fg.Cell(0, 0, iDefect_Ratio, 0, iDefect_Amt) = 'DEFECT';
		
	fg.Cell(0, 1, iDefect_Ratio, 1, iDefect_Ratio) = "Defect Ratio";
	
	fg.Cell(0, 1, iDefect_Qty, 1, iDefect_Qty) = "Qty";
	
	fg.Cell(0, 1, iDefect_Amt, 1, iDefect_Amt) = "Amount";
	
	
	
	fg.MergeCol(iEmpty) = true;
	fg.Cell(0, 0, iEmpty, 1, iEmpty) = '-';  
	
}

</script>

<body>
    <!-------------------------------------------------------------------->
  <gw:data id="fmgf00230" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60170360" > 
                <input bind="idGrid" >                 
                     <input bind="lstCompany"/>	
					 <input bind="dtMonth"/>
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>      
	
	<!-------------------------------------------------------------------->
    <gw:data id="dso_process_cost" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60170360">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dtMonth" />					 
                </input>  
                <output>  
                     <output bind="txtReturn"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
	<!-------------------------------------------------------------------->
    <gw:data id="dso_make_slip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60170360_1">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dtMonth" />					 
                </input>  
                <output>  
                     <output bind="txtSeq"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
	<!-------------------------------------------------------------------->
    <gw:data id="dso_cancel_slip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60170360_2">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dtMonth" />	
					 <input bind="txtSeq" />						 
                </input>  
                <output>  
                     <output bind="txtSeq"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
	<!-------------------------------------------------------------------->
    <gw:data id="dso_remove_data" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60170360_3">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dtMonth" />						 						
                </input>  
                <output>  
                     <output bind="txtReturn"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
	<!-------------------------------------------------------------------->
    <gw:data id="dso_search_data" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_PRO_60170360_4">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dtMonth" />						 						
                </input>  
                <output>  
                     <output bind="txtSeq"/>
               </output> 
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
					<td align="right"><gw:icon id="btnProcess" text="Process" alt="Process Data" onclick="OnProcess()" /></td>
					<td align="right"><gw:icon id="btnMakeSlip" text="Make Slip" alt="Make Slip" onclick="OnMakeSlip()" /></td>
					<td align="right"><gw:icon id="btnCancelSlip" text="Cancel Slip" alt="Cancel Slip" onclick="OnCancelSlip()" /></td>
					<td align="right"><gw:icon id="btnRemove" text="Remove" alt="Remove" onclick="OnRemove()" /></td>
					<td align="right"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
					<td align="right"><gw:imgBtn id="btnExcel" img="excel" alt="Print Report" onclick="OnExcel()" /></td>
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
                            header="Item Code|Prod Qty|Manufacturing Cost|Unit Cost|Consumption Qty|Comsumption Amt|Material Cost|General Cost|Noil Ratio|By prod qty|By prod Amt|Waste Ratio|By prod qty|By prod Amt|Yarn Ratio|By prod qty|By prod Amt|_Item_PK|ratio_defect|Defect Qty|Defect Amt|-"
                            format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                            aligns="1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|0|3|3|3|0"
                            defaults="|||||||||||||||||||||" 
                            editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                            widths="1500|1500|2000|2000|2000|2000|2000|2000|1500|2000|2000|1500|1500|2000|1500|2000|2000|0|1800|1800|1800|0"
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