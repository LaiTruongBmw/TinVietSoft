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
	
	var iItem_pk = 0 ,
		iItem_Code = 1 ,
		iProd_Qty = 2 ,
		iMatAmt = 3,
		iCostAmt = 4,
		iManufacturing_Cost = 5 ,
		iUnitCost = 6 ,
		iConsumption_Qty = 7 ,
		iComsumption_Amt = 8 ,
		iMaterial_Cost = 9,
		iGeneral_Cost = 10 ;
		
		
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
//    idGrid.GetGridControl().FrozenCols = 2 ;
   // OnMergeHeader();
	//OnFormatGrid();
	form_60170360_header.Call('SELECT');
	txtGroupView.text = 'COST';	
	
		var ctrl = idGridCostdetail.GetGridControl();
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
}
//------------------------------------------------------------------------
function BindingDataList()
{
	 var ls_today = dtMonth1.value ;
	var lmonth = ls_today.substring(0,4);
    dtMonth1.value = lmonth + '01';
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data) ;
	ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(A.CODE) code, A.code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'EACBK054' and A.use_yn = 'Y' " )%>";	
	lstRptType.SetDataText(ls_data);
	lstRptType.value = '0' ;
	btnMakeSlip.SetEnable(false);
	var ctrl = idGridmmaster.GetGridControl();
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
	ctrl.MergeCol(2) = true;
}
//------------------------------------------------------------------------
function OnDataReceive(obj)
{
	if(obj.id == 'form_60170360')
	{
		idGridMaterialDetail.ClearData();
		idGridCostdetail.ClearData();
		
		OnMergeHeader();
		OnFormatGrid();
		var i ;
		var v_sum_consump_amt = 0 ;
		var v_sum_consump_qty = 0 ;
		var v_imat_amt = 0;
		var v_icost_amt = 0;
		var v_by_prod_qty_noil = 0, v_prod_qty = 0, v_defect_qty = 0, v_defect_amt = 0;
		var v_raw_mat_qty = 0, v_raw_mat_amt = 0, v_total_gener_cost = 0;
		var v_by_prod_amt_noil = 0 ;
		var v_sum_manufacture_cost = 0, v_material_cost = 0;
		
		var v_by_prod_qty_waste = 0 , v_by_prod_amt_waste = 0 ;
		
		var v_by_prod_qty_yarn = 0 , v_by_prod_amt_yarn = 0 ;
		var v_by_prod_qty_dust = 0 , v_by_prod_amt_dust = 0 ;
		
		
		for( i = 2; i < idGrid.rows; i++)
		{
			v_prod_qty += Number(idGrid.GetGridData(i, iProd_Qty ));
			v_imat_amt += Number(idGrid.GetGridData(i, iMatAmt ));
			v_icost_amt += Number(idGrid.GetGridData(i, iCostAmt ));
			v_sum_manufacture_cost += Number(idGrid.GetGridData(i, iManufacturing_Cost));
			v_sum_consump_qty += Number(idGrid.GetGridData(i, iConsumption_Qty ));
			v_sum_consump_amt += Number(idGrid.GetGridData(i, iComsumption_Amt));
			v_raw_mat_amt += Number(idGrid.GetGridData(i, iMaterial_Cost ));
			v_total_gener_cost += Number(idGrid.GetGridData(i, iGeneral_Cost));
			
			
			
		}
		idGrid.AddRow();
		idGrid.SetGridText(idGrid.rows - 1, iProd_Qty, v_prod_qty);
		idGrid.SetGridText(idGrid.rows - 1, iMatAmt, v_imat_amt);
		idGrid.SetGridText(idGrid.rows - 1, iCostAmt , v_icost_amt);
		idGrid.SetGridText(idGrid.rows - 1, iManufacturing_Cost, v_sum_manufacture_cost);
		idGrid.SetGridText(idGrid.rows - 1, iConsumption_Qty, v_sum_consump_qty);
		idGrid.SetGridText(idGrid.rows - 1, iComsumption_Amt, v_sum_consump_amt);
		idGrid.SetGridText(idGrid.rows - 1, iMaterial_Cost, v_raw_mat_amt);
		idGrid.SetGridText(idGrid.rows - 1, iGeneral_Cost, v_total_gener_cost);
		
		
		
		idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1,idGrid.cols-1,0xA9EBD7);
		
		dso_search_data.Call();		
	}
	else if(obj.id == "dso_remove_data")
	{
		form_60170360.Call("SELECT");
	}
	else if(obj.id == "dat_sel_FMGF00230_header")
	{
		form_60170360.Call("SELECT");
	}
	else if(obj.id == "dso_process_cost")
	{
		form_60170360.Call("SELECT");
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
	}else if(obj.id =="form_60170360_header"){
		initHeader();
		OnMergeHeader();
		OnFormatGrid();
	}
	else if(obj.id == "dat_sel_sel_60170360_MaterialD"){
		/*idGridMaterialDetail.setFormat('1|0|0|1|1|1|0');
		dat_sel_60170360_Cost_D.Call('SELECT');*/
		
		idGridMaterialDetail.Subtotal (0,2 ,'-1', '5!6!7!8!9');
		idGridMaterialDetail.setFormat('0|0|1|-0|0|-0|1|-0|1|1|0');
		
		var 	 ctrl = idGridMaterialDetail.GetGridControl();
				ctrl.ColFormat(9) = "#,###,###,###.##%"; 
		ctrl.MergeCells = 2;
		ctrl.MergeCol(0) = true;
		ctrl.MergeCol(1) = true;
		ctrl.MergeCol(2) = true;
		ctrl.MergeCol(3) = true; 
		dat_sel_60170360_Cost_D.Call('SELECT');
	}
	else if(obj.id == "dat_sel_60170360_Cost_D"){
		/*idGridCostdetail.setFormat('0|0|0|0|1|1|-2|-2|-2|-2');
		for(var i = 1; i< idGridCostdetail.rows; i++){
			if(idGridCostdetail.GetGridData(i,1) == "" && idGridCostdetail.GetGridData(i,2) == "" && idGridCostdetail.GetGridData(i,3) == "")
				idGridCostdetail.SetCellBgColor(i, 0, i,11,0XEE82EE);
			else if(idGridCostdetail.GetGridData(i,1) == "" && idGridCostdetail.GetGridData(i,2) == "" && idGridCostdetail.GetGridData(i,3) != "")
				idGridCostdetail.SetCellBgColor(i, 0, i,11,0xB0E2FF);
			else
				idGridCostdetail.SetCellBgColor(i, 0, i,11,0xCCFFFF);

		}*/
		
			for(var i = 1; i< idGridCostdetail.rows; i++){
			if(idGridCostdetail.GetGridData(i,1) != ""  && idGridCostdetail.GetGridData(i,5) == "")
			{
				idGridCostdetail.SetCellBgColor(i, 0, i,9,0XEE82EE);
				idGridCostdetail.SetGridText(i, 5,"Sub Total");
			}
			else if(idGridCostdetail.GetGridData(i,1) == "" && idGridCostdetail.GetGridData(i,5) == "" )
				idGridCostdetail.SetCellBgColor(i, 0, i,9,0xB0E2FF);
			else
				idGridCostdetail.SetCellBgColor(i, 0, i,9,0xCCFFFF);

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
	fg.ColFormat(iMatAmt) = "#,###,###,###R";
	fg.ColFormat(iCostAmt) = "#,###,###,###R";
	fg.ColFormat(iUnitCost) = "#,###,###,###R"; // unit cost
	fg.ColFormat(iConsumption_Qty) = "#,###,###,###.##R"; // Consumption Qty
	fg.ColFormat(iComsumption_Amt) = "#,###,###,###R"; //Comsumption Amt
	fg.ColFormat(iMaterial_Cost) = "#,###,###,###R"; // Material Cost
	fg.ColFormat(iGeneral_Cost) = "#,###,###,###R"; //General Amt
	
	///
	var fg = idGridCostdetail.GetGridControl();
	fg.ColFormat(2) = "#,###,###,###"; // 
	fg.ColFormat(3) = "#,###,###,###"; // 
	fg.ColFormat(6) = "#,###,###,###"; // 
	fg.ColFormat(7) = "#,###,###,###.##"; // 
	fg.ColFormat(8) = "#,###,###,###.##%"; //
	
}
//-----------------------------------------------------
//function Upcase()
//{
//    var c = String.fromCharCode (event.keyCode);
//	var x = c.toUpperCase().charCodeAt(0);
//	event.keyCode = x;
//}	
//-----------------------------------------------------

function initHeader(){
	var tmp;
	var format;
	var aligns;
	var widths;
	for(var i=1; i<idGridHeader.rows; i++){
		if(i==1)
		{
			tmp="";
			format="";
			aligns="";
			widths="";
		}
		tmp += '|_' + idGridHeader.GetGridData(i,3) + '|' + idGridHeader.GetGridData(i,3) + '|' + idGridHeader.GetGridData(i,3);
		format += '|0|0|0';
		aligns += '|3|3|3';
		widths += '|1000|1000|1000';
	}
	//empty col
	tmp+='|-';
	format += '|0';
	aligns += '|3';
	widths += '|0';
	idGrid.AddCol(tmp,format,aligns,widths);
}
function OnSearch(index)
{

switch(index) 
	{
		case 'griddetail':
			form_60170360.Call('SELECT');
		 break;
		 
		 case 'control':
			 //txt_allocate_cost_pk.text = idGridmmaster.GetGridData(idGridmmaster.row,0);
			 //txt_seqgrid.text = idGridmmaster.GetGridData(idGridmmaster.row,1);
			  dtMonth.SetDataText(idGridmmaster.GetGridData(idGridmmaster.row,1));
			  lstBiz.value =idGridmmaster.GetGridData(idGridmmaster.row,4)	;
			 form_60170360.Call('SELECT');
			 
		 break;
	 }
	
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
function OnByProduct()
{
	   var fpath = System.RootURL + "/standard/forms/60/17/60170360_by_prod.aspx?p_month="+dtMonth.value;
		o = System.OpenModal( fpath , 700, 550 , 'resizable:yes;status:yes');
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
	
	//
	fg.MergeCol(iMatAmt) = true;
	fg.Cell(0, 0, iMatAmt, 1, iMatAmt) = 'Material' + '\n' + 'Cost';  
	
	fg.MergeCol(iCostAmt) = true;
	fg.Cell(0, 0, iCostAmt, 1, iCostAmt) = 'General' + '\n' + 'Cost';  
	//
	
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
}
function OnSearchMaster(){
	dso_search_master.Call("SELECT");
}


  //---------------------------------------------------------
     function OnToggle()
     {
	 
        var left1  = document.all("left1");    
        var right1 = document.all("right1");   
         //var left2  = document.all("left2");    
        //var right3 = document.all("right2"); 
        var imgArrow = document.all("imgArrow");   
        
        if(imgArrow.status == "expand")
        {
            left1.style.display="none";  
           // left2.style.display="none";       
            imgArrow.status = "collapse";
            right1.style.width="100%";
           // right2.style.width="100%";
            imgArrow.src = "../../../system/images/next_orange.gif";
        }
        else
        {
            left1.style.display="";
           // left2.style.display="";
            imgArrow.status = "expand";
           // right2.style.width="75%";
            right1.style.width="75%";
            imgArrow.src = "../../../system/images/prev_orange.gif";
        }
     }
	 
	 function Ongrid(){
		
		txtWipDetail_Pk.text = idGrid.GetGridData(idGrid.row,0);
		//alert(idGrid.GetGridData(idGrid.row,0));
		dat_sel_sel_60170360_MaterialD.Call('SELECT');
}	
</script>

<body>
    <!-------------------------------------------------------------------->
  <gw:data id="form_60170360" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="sp_sel_60170360" > 
                <input bind="idGrid" >                 
                     <input bind = "lstCompany"/>	
					 <input bind = "dtMonth"/>
					 <input bind = "lstBiz"/>
					 <input bind = "txtSeq"/>
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>  
<!-------------------------------------------------------------------->
  <gw:data id="form_60170360_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60170360_header" > 
                <input bind="idGridHeader" >                 
                     <input bind = "lstCompany"/>	
                </input>
                <output  bind="idGridHeader" />
            </dso> 
        </xml> 
    </gw:data>      
	
	<!-------------------------------------------------------------------->
    <gw:data id="dso_process_cost" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="sp_pro_60170360">
                <input>                      
                     <input bind = "lstCompany" />
					 <input bind = "lstBiz"/>	
					 <input bind = "dtMonth" />					 
                </input>  
                <output>  
                     <output bind = "txtReturn"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
	<!-------------------------------------------------------------------->
    <gw:data id="dso_make_slip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="sp_pro_60170360_4">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind = "lstBiz"/>						 
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
            <dso type="process" procedure="sp_pro_60170360_3">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dtMonth" />
					 <input bind = "lstBiz"/>		
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
            <dso type="process" procedure="sp_pro_60170360_2">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dtMonth" />	
					 <input bind = "lstBiz"/>		
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
            <dso type="process" procedure="SP_PRO_60170360_5">
                <input>                      
                     <input bind="lstCompany" />					 
					 <input bind = "lstBiz"/>	
					 <input bind="dtMonth" />							 
                </input>  
                <output>  
                     <output bind="txtSeq"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
	<!-------------------------------------------------------------------->	
	
	<gw:data id="dso_search_master" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="SP_SEL_60170360_6" > 
                <input bind="idGridmmaster" >                 
                     <input bind="lstCompany"/>	
					  <input bind = "txtSeq1"/>
					 <input bind="dtMonth1"/>
					 <input bind="dtMonth2"/>
					
                </input>
                <output  bind="idGridmmaster" />
            </dso> 
        </xml> 
    </gw:data> 
	
	<!------------------------------------------------------------------------>
	
	<!--<gw:data id="dat_sel_FMGF00230_header" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="control" function="ac_sel_60170360_header1"> 
				<inout> 
				<inout bind="txt_seqgrid"/>	
					<inout bind="dtMonth"/>
					<inout bind="txtSeq"/>				
				</inout>
			</dso>
		</xml> 
	</gw:data>-->
	<!------------------------------------------------------------------------>
	
	<gw:data id="dat_sel_FMGF00230_header" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="control" function="ac_sel_60170360_header1"> 
				<inout> 
				<inout bind="txt_seqgrid"/>	
					<inout bind="dtMonth"/>
					<inout bind="txtSeq"/>				
				</inout>
			</dso>
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------>
	
	
	<!------------------------------------------------------------------------>
	<gw:data id="dat_sel_sel_60170360_MaterialD" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="ac_sel_60170360_Material_D"> 
				<input>
					<input bind="txtWipDetail_Pk" /> 
					<input bind="dtMonth" /> 											
				</input> 
				<output bind="idGridMaterialDetail" /> 				
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------>
		<gw:data id="dat_sel_60170360_Cost_D" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="ac_sel_60170360_Cost_D"> 
				<input>
					<input bind="lstCompany" /> 
					<input bind="txtWipDetail_Pk" /> 
					<input bind="dtMonth" /> 	
				</input> 
				<output bind="idGridCostdetail" /> 				
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------>
	

	<table style="width:100%; height:100% " border="1" cellpadding="0" cellspacing="0"  >
	
	<tr>
		<td style="width:20%"  valign:top" id="left1">
			<table width="100%" border="1" cellpadding="0" cellspacing="0" style="height:100%">
				<tr style="height:1%">
				<td>
						<table border="0">
								<tr>
									<td align="left" style="width:5%" >Company</td>
									<td align="left"  colspan="1"><gw:list id="lstCompany" styles="width:100%" />	</td>
									<td >									
									<table border="0" width="100%">
										<tr>
											<td >
												Seq
											</td>
											<td align="left" style="width:95%" ><gw:textbox id="txtSeq1" styles="width:100%" /></td>
										</tr>
									</table>
									</td>
								</tr>
								
								<tr>
									
									<td align="left"  style="width:10%">Month</td>
									<td align="left" style="width:20%"><gw:datebox id="dtMonth1" lang="1" type="month" /></td>
									<td align="left" style="width:20%"><gw:datebox id="dtMonth2" lang="1" type="month" /></td>
									<td align="right"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearchMaster()" /></td>
								</tr>
							</table>
						</td>
				</tr>
				
				<tr>
					
				<td style="height:85%"  >
						<table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%;width:100%;"  >
							<tr>
								<td>					
									<gw:grid id="idGridmmaster" 
										header="_pk|Month|Seq|Biz Center|_Center PK"
										format="0|5|0|0|0" 
										aligns="1|3|3|1|0"
										defaults="|||||" 
										editcol="0|0|0|0|0" 
										widths="1500|1500|1500|2000|0"
										styles="width:100%; height:100% " 
										acceptNullDate="T" 
										sorting="F" 
										oncellclick="OnSearch('control')"
										/>                    
								</td>
							</tr>
						</table>
					</td>
					
				</tr>
			</table>
			
		</td>
		<td style="width:70%; valign:top;height:100%"  id="right1">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%">
				<td>
				<tr style="height:10%" >
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%" >
							<tr>
								<td style="width:10%;"></td>
								<td style="width:20%;"></td>
								<td style="width:10%;"></td>
								<td style="width:20%;"></td>
								<td style="width:10%;"></td>
								<td style="width:5%;"></td>
								<td style="width:5%;"></td>
								<td style="width:5%;"></td>
								<td style="width:5%;"></td>
								<td style="width:5%;"></td>
							</tr>  
							<tr >
								<!--<td align="right">Company</td>
								<td align="left"><gw:list id="lstCompany" styles="width:100%" /></td>-->
								<td align="right">Month</td>
								<td align="left"><gw:datebox id="dtMonth" lang="1" type="month" /></td>		
								<td align="right">Biz Center</td>
								<td >
										<gw:list id="lstBiz"  onchange="OnSearch('grdWipMaster')"  onchange="" >
											<data><%=CtlLib.SetListDataSQL("SELECT A.PK, A.plc_cd||'-'||A.PLC_NM FROM TAC_ABCENTER A WHERE A.DEL_IF = 0 AND A.PLC_TYPE = '01' order by 1" )%></data>
										</gw:list>
								</td>
								<td align="right"><gw:icon id="btnProcess" text="Process" alt="Process Data" onclick="OnProcess()" /></td>
								<td align="right"><gw:icon id="btnMakeSlip" text="Make Slip" alt="Make Slip" onclick="OnMakeSlip()" /></td>
								<td align="right"><gw:icon id="btnCancelSlip" text="Cancel Slip" alt="Cancel Slip" onclick="OnCancelSlip()" /></td>
								<td align="right"><gw:icon id="btnRemove" text="Remove" alt="Remove" onclick="OnRemove()" /></td>
								<td align="right"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('griddetail')" /></td>
								<td align="right"><gw:imgBtn id="btnExcel" img="excel" alt="Print Report" onclick="OnExcel()" /></td>
							</tr>
							<tr>
								<td align="right">Seq</td>
								<td align="left"><gw:textbox id="txtSeq" styles="width:100%" /></td>
								<td align="right" style="display:none">Report</td>					
								<td align="left" style="display:none" ><gw:list id="lstRptType" styles="width:100%" >						
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
										header="_pk|Item Code|Prod Qty|||Manufacturing Cost|Unit Cost|Consumption Qty|Comsumption Amt|Material Cost|General Cost"
										format="0|0|0|0|0|0|0|0|0|0|0" 
										aligns="1|1|3|3|3|3|3|3|3|3|3"
										defaults="||||||||||" 
									   editcol="0|0|0|0|0|0|0|0|0|0|0" 
										widths="0|1500|1500|2000|2000|2000|2000|2000|2000|1500|2000"
										styles="width:100%; height:100% " 
										acceptNullDate="T" 
										sorting="F" 
										oncellclick="Ongrid();"
										/>                     
								</td>
							</tr>
						</table>
					</td>
				</tr>	

				</td>
			</tr>
			
			<tr   >
				
					<td colspan="10" >
						<gw:grid id="idGridMaterialDetail" 
												header="_pk|Prod Item|Prod Qty|MFC Cost|Mat Name|Qty|U/P|Amt|Unit Cost|MFC Cost Ratio|-
												format="0|0|0|-0|0|-0|1|-0|1|1|0"
												aligns="0|0||0|00|0|0|0|0|0|0|0"
												defaults="||||||||||"
											    editcol="0|0|0|0|0|0|0|0|0|0|0|0"
												widths="0|1000|1000|2000|2000|1000|1500|2000|1500|1500|2500"
												styles="width:100%; height:200" 
												sorting="T"                                 
												acceptnulldate="T" />
					</td>
				</tr>
				<tr   >
					
					<td colspan="10" >
						<gw:grid id="idGridCostdetail" 
												header="_pk|Product Item|Product Qty|MFC Cost|Cost Type|Process|Cost Amount|Unit Cost|MFC Cost Ratio|-
												format="1|0|N|-0|0|0|0|0|0|0"
												aligns="0|0|0|0|0|0|0|0|0|0|0"
												defaults="|||||||||||"
												editcol="0|0|0|0|0|0|0|0|0|0|0"
												widths="0|2000|2000|2000|1500|1500|2000|2000|2000|2000|0"
												styles="width:100%; height:200 " 
												sorting="T"       
												autosize="T"												
												acceptnulldate="T" />
					</td>
					</td>
				</tr>
		</table>
		</td>
	</tr>
</table>
<gw:grid id='idGridHeader'
header='PK|ITEM_CODE|VIRTUAL_CODE|ITEM_NAME|ITEM_LNAME|ITEM_FNAME|UOM|REF_UOM'
format='0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0'
check='|||||||'
editcol='1|1|1|1|1|1|1|1'
widths='1000|1000|1000|1000|1000|1000|1000|1000'
sorting='T'
autosize='T' 
styles='width:100%; height:460;display:none;'
/>
 <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle();" />
<gw:textbox id="txtReturn" styles="display:none; " />
<gw:textbox id="txtMat_Grp_2" styles="display:none; " />      
<gw:textbox id="txtMstPK" styles="display:none; " /> 
<gw:textbox id="txt_allocate_cost_pk" styles="display:none; " />  
<gw:textbox id="txt_seqgrid" styles="display:none; " />  
<gw:textbox id="txtWipDetail_Pk" styles="display:none; " />
<gw:textbox id="txtGroupView" styles="display:none; " />
</body>
</html>