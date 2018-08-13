<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser("acnt")%>
<head id="Head1" runat="server">
    <title>Item Balance</title>
</head>
<script>
//---------------
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;
 
 //|In Amt|Prod. Unit Cost|Prod. Cons. Amt|Ending Bal. Amt|Begining Bal. Amt|In Amt|Beginning + In|Unit Cost|Consumption Amt|Ending Bal. Amt|Begining Bal. Amt|In Convert Qty|In Amt|Prod Unit Cost|Consumption Amt|Ending Bal. Amt|Beginning Amt|Ratio|In Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|WIP Bal. Amt
 

 var v_Item_Code 	= 0 ,
	v_BB_WIP_Qty 	= 1 ,
	v_In_WIP_Qty	= 2 ,
	v_WIP_Out_Qty 	= 3 ,
	v_End_Bal_WIP_Qty	= 4 ,
	v_BB_WIP_Amt		= 5 ,
	v_WIP_In_Amt		= 6 ,
	v_Prod_Unit_Cost_WIP = 7 ,
	v_Prod_Cons_Amt_WIP  = 8 ,	
	v_End_Bal_WIP_Amt  = 9 ,	
	v_BB_WIP_Mat_Amt = 10 ,
	v_WIP_Mat_In_Amt  = 11 ,
	v_WIP_Mat_BB_In_Amt  = 12 ,
	v_WIP_Mat_Unit_Cost   = 13 ,
	v_Consum_Amt_WIP_Mat   = 14 ,	
	v_End_WIP_Mat_Amt = 15 ,	
	v_BB_WIP_Gener_Amt = 16 ,
	v_In_Convert_Qty	= 17 ,
	v_In_Amt_WIP_Gener  = 18 ,
	v_Prod_Unit_Cost_WIP_Gener = 19 ,
	v_Consum_Amt_WIP_Gener = 20 ,	
	v_End_WIP_Gener_Amt = 21 ,	
	v_BB_Packing_Amt = 22 ,
	v_Ratio_1		= 23 ,
	v_In_Convert_Qty_1	= 24 ,
	v_In_Packing_Cost  = 25 ,
	v_Total_Packing_Cost = 26 ,
	v_Out_Packing_Cost 	 = 27 ,	
	v_End_Packing_Amt = 28 ,	
	v_BB_Labor_Amt = 29 ,
	v_Ratio_2		= 30 ,
	v_In_Convert_Qty_2	= 31 ,
	v_In_Labor_Cost  = 32 ,
	v_Total_Labor_Cost = 33 ,
	v_Out_Labor_Cost 	 = 34 ,		
	v_End_Labor_Amt 	= 35 ,
	v_BB_Electricity_Amt = 36 ,
	v_Ratio_3		= 37 ,
	v_In_Convert_Qty_3	= 38 ,
	v_In_Electricity_Cost  = 39 ,
	v_Total_Electricity_Cost = 40 ,
	v_Out_Electricity_Cost 	 = 41 ,		
	v_End_Electricity_Amt 	= 42 ,				
	v_BB_Consumable_Amt = 43 ,
	v_Ratio_4		= 44 ,
	v_In_Convert_Qty_4	= 45 ,
	v_In_Consumable_Cost  = 46 ,
	v_Total_Consumable_Cost = 47 ,
	v_Out_Consumable_Cost 	 = 48 ,		
	v_End_Consumable_Amt = 49 ,	
	v_BB_Depreciation_Cost = 50 ,
	v_Ratio_5		= 51 ,
	v_In_Convert_Qty_5	= 52 ,
	v_In_Depreciation_Cost  = 53 ,
	v_Total_Depreciation_Cost = 54 ,
	v_Out_Depreciation_Cost 	 = 55 ,		
	v_End_Depreciation_Cost = 56 ,	
	v_BB_Welfare_Cost = 57 ,
	v_Ratio_6		= 58 ,
	v_In_Convert_Qty_6	= 59 ,
	v_In_Welfare_Cost  = 60 ,
	v_Total_Welfare_Cost = 61 ,
	v_Out_Welfare_Cost 	 = 62 ,			
	v_End_Welfare_Cost = 63 ,	
	v_BB_Others_Cost 	= 64 ,
	v_Ratio_7		= 65 ,
	v_In_Convert_Qty_7	= 66 ,
	v_In_Others_Cost  = 67 ,
	v_Total_Others_Cost = 68 ,
	v_Out_Others_Cost 	 = 69 ,			
	v_End_Others_Cost 	= 70 ;
	
	
//Item Code|Begining Bal. Qty|In Qty|Prod. Cons. Qty|Ending Bal. Qty|Begining Bal. Amt|In Amt|Prod. Unit Cost|Prod. Cons. Amt|Ending Bal. Amt|Begining Bal. Amt|In Amt|Beginning + In|Unit Cost|Consumption Amt|Ending Bal. Amt|Begining Bal. Amt|In Convert Qty|In Amt|Prod Unit Cost|Consumption Amt|Ending Bal. Amt|Beginning Amt|Ratio|In Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|WIP Bal. Amt
//----------------------------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("tLEFT");    
    var right = document.all("tRIGHT");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
 
//------------------------------------------------------------------------
	        
function BodyInit()
{  
	
   OnMergeHeader();	
   System.Translate(document);
   BindingData();       
   OnFormat();
}

//---------------------------------------------------------------------
function BindingData()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM COMM.TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);   
	idGrid.GetGridControl().FrozenCols = 1 ;	
}

//---------------------------------------------------------------------------
function OnSearch()
{
	fmgf00250.Call("SELECT");
}
//-------------------------------------------------------------------------
function OnProcess()
{
	if(confirm('Are you sure you want to process WIP Evaluation?'))
	{
		dso_process_cost.Call();
	}	
}
//----------------------------------------------------------------------
function OnMergeHeader()
{
	
	if(idGrid.rows == 1)
		idGrid.AddRow();
	
	var fg = idGrid.GetGridControl();
	fg.FixedRows = 2; 
	fg.Cell(13, 1, 0, 1, fg.Cols - 1) = true ;    
	fg.MergeCells = 5;
	
	fg.MergeRow(0) = true;   
	
	fg.MergeCol(0) = true;
	fg.Cell(0, 0, 0, 1, 0) = 'Item Code';  
		
	fg.Cell(0, 0, v_BB_WIP_Qty, 0, v_End_Bal_WIP_Amt) = "WIP"; //WIP
	
	fg.Cell(0, 1, v_BB_WIP_Qty, 1, v_BB_WIP_Qty) = "Begining Bal. Qty"; 
	
	fg.Cell(0, 1, v_In_WIP_Qty, 1, v_In_WIP_Qty) = "In Qty"; 
	
	fg.Cell(0, 1, v_WIP_Out_Qty, 1, v_WIP_Out_Qty) = "Prod. Cons. Qty"; 
	
	fg.Cell(0, 1, v_End_Bal_WIP_Qty, 1, v_End_Bal_WIP_Qty) = "Ending Bal. Qty"; 
	
	fg.Cell(0, 1, v_BB_WIP_Amt, 1, v_BB_WIP_Amt) = "Begining Bal. Amt"; 
	
	fg.Cell(0, 1, v_WIP_In_Amt, 1, v_WIP_In_Amt) = "In Amt"; 
	
	fg.Cell(0, 1, v_Prod_Unit_Cost_WIP, 1, v_Prod_Unit_Cost_WIP) = "Prod. Unit Cost"; 
	
	fg.Cell(0, 1, v_Prod_Cons_Amt_WIP, 1, v_Prod_Cons_Amt_WIP) = "Prod. Cons. Amt"; 
	
	fg.Cell(0, 1, v_End_Bal_WIP_Amt, 1, v_End_Bal_WIP_Amt) = "Ending Bal. Amt"; 	
	
	fg.Cell(0, 0, v_BB_WIP_Mat_Amt, 0, v_End_WIP_Mat_Amt) = "WIP Material"; //WIP Material 
		
	fg.Cell(0, 1, v_BB_WIP_Mat_Amt, 1, v_BB_WIP_Mat_Amt) = "Begining Bal. Amt"; 
	
	fg.Cell(0, 1, v_WIP_Mat_In_Amt, 1, v_WIP_Mat_In_Amt) = "In Amt"; 
	
	fg.Cell(0, 1, v_WIP_Mat_BB_In_Amt, 1, v_WIP_Mat_BB_In_Amt) = "Beginning + In"; 
	
	fg.Cell(0, 1, v_WIP_Mat_Unit_Cost, 1, v_WIP_Mat_Unit_Cost) = "Unit Cost"; 
	
	fg.Cell(0, 1, v_Consum_Amt_WIP_Mat, 1, v_Consum_Amt_WIP_Mat) = "Consumption Amt"; 
	
	fg.Cell(0, 1, v_End_WIP_Mat_Amt, 1, v_End_WIP_Mat_Amt) = "Ending Bal. Amt"; 
	
	fg.Cell(0, 0, v_BB_WIP_Gener_Amt, 0, v_End_WIP_Gener_Amt) = "WIP General Cost"; //WIP
	
	fg.Cell(0, 1, v_BB_WIP_Gener_Amt, 1, v_BB_WIP_Gener_Amt) = "Begining Bal. Amt"; 
	
	fg.Cell(0, 1, v_In_Convert_Qty, 1, v_In_Convert_Qty) = "In Convert Qty"; 
	
	fg.Cell(0, 1, v_In_Amt_WIP_Gener, 1, v_In_Amt_WIP_Gener) = "In Amt"; 
	
	fg.Cell(0, 1, v_Prod_Unit_Cost_WIP_Gener, 1, v_Prod_Unit_Cost_WIP_Gener) = "Prod Unit Cost"; 
	
	fg.Cell(0, 1, v_Consum_Amt_WIP_Gener, 1, v_Consum_Amt_WIP_Gener) = "Consumption Amt"; 
	
	fg.Cell(0, 1, v_End_WIP_Gener_Amt, 1, v_End_WIP_Gener_Amt) = "Ending Bal. Amt"; 
	
	fg.Cell(0, 0, v_BB_Packing_Amt, 0, v_End_Packing_Amt) = "1. Packing Cost"; // Packing cost
	
	fg.Cell(0, 1, v_BB_Packing_Amt, 1, v_BB_Packing_Amt) = "Beginning Amt"; 
	
	fg.Cell(0, 1, v_Ratio_1, 1, v_Ratio_1) = "Ratio"; 
	
	fg.Cell(0, 1, v_In_Convert_Qty_1, 1, v_In_Convert_Qty_1) = "In_Convert_Qty"; 
	
	fg.Cell(0, 1, v_In_Packing_Cost, 1, v_In_Packing_Cost) = "In Amount"; 
	
	fg.Cell(0, 1, v_Total_Packing_Cost, 1, v_Total_Packing_Cost) = "Total Amt"; 
	
	fg.Cell(0, 1, v_Out_Packing_Cost, 1, v_Out_Packing_Cost) = "Prod. Cons. Amt"; 
	
	fg.Cell(0, 1, v_End_Packing_Amt, 1, v_End_Packing_Amt) = "WIP Bal. Amt";
	
	fg.Cell(0, 0, v_BB_Labor_Amt, 0, v_End_Labor_Amt) = "2. Labor Cost"; // Labor Cost
	
	fg.Cell(0, 1, v_BB_Labor_Amt, 1, v_BB_Labor_Amt) = "Beginning Amt"; 
	
	fg.Cell(0, 1, v_Ratio_2, 1, v_Ratio_2) = "Ratio"; 
	
	fg.Cell(0, 1, v_In_Convert_Qty_2, 1, v_In_Convert_Qty_2) = "In Convert Qty"; 
	
	fg.Cell(0, 1, v_In_Labor_Cost, 1, v_In_Labor_Cost) = "In Amt"; 
	
	fg.Cell(0, 1, v_Total_Labor_Cost, 1, v_Total_Labor_Cost) = "Total Amt"; 
	
	fg.Cell(0, 1, v_Out_Labor_Cost, 1, v_Out_Labor_Cost) = "Prod. Cons. Amt"; 
	
	fg.Cell(0, 1, v_End_Labor_Amt, 1, v_End_Labor_Amt) = "WIP Bal. Amt"; 
	
	fg.Cell(0, 0, v_BB_Electricity_Amt, 0, v_End_Electricity_Amt) = "3. Electricity Cost"; // Electricity Cost
	
	fg.Cell(0, 1, v_BB_Electricity_Amt, 1, v_BB_Electricity_Amt) = "Beginning Amt"; 
	
	fg.Cell(0, 1, v_Ratio_3, 1, v_Ratio_3) = "Ratio"; 
	
	fg.Cell(0, 1, v_In_Convert_Qty_3, 1, v_In_Convert_Qty_3) = "In Convert Qty"; 
	
	fg.Cell(0, 1, v_In_Electricity_Cost, 1, v_In_Electricity_Cost) = "In Amt"; 
	
	fg.Cell(0, 1, v_Total_Electricity_Cost, 1, v_Total_Electricity_Cost) = "Total Amt"; 
	
	fg.Cell(0, 1, v_Out_Electricity_Cost, 1, v_Out_Electricity_Cost) = "Prod. Cons. Amt"; 
	
	fg.Cell(0, 1, v_End_Electricity_Amt, 1, v_End_Electricity_Amt) = "WIP Bal. Amt"; 
	
	fg.Cell(0, 0, v_BB_Consumable_Amt, 0, v_End_Consumable_Amt) = "4. Consumable Cost"; // Consumable Cost
	
	fg.Cell(0, 1, v_BB_Consumable_Amt, 1, v_BB_Consumable_Amt) = "Beginning Amt"; 
	
	fg.Cell(0, 1, v_Ratio_4, 1, v_Ratio_4) = "Ratio"; 
	
	fg.Cell(0, 1, v_In_Convert_Qty_4, 1, v_In_Convert_Qty_4) = "In Convert Qty"; 
	
	fg.Cell(0, 1, v_In_Consumable_Cost, 1, v_In_Consumable_Cost) = "In Amt"; 
	
	fg.Cell(0, 1, v_Total_Consumable_Cost, 1, v_Total_Consumable_Cost) = "Total Amt"; 
	
	fg.Cell(0, 1, v_Out_Consumable_Cost, 1, v_Out_Consumable_Cost) = "Prod. Cons. Amt"; 
	
	fg.Cell(0, 1, v_End_Consumable_Amt, 1, v_End_Consumable_Amt) = "WIP Bal. Amt"; 

	fg.Cell(0, 0, v_BB_Depreciation_Cost, 0, v_End_Depreciation_Cost) = "5. Depreciation Cost"; // Depreciation Cost
	
	fg.Cell(0, 1, v_BB_Depreciation_Cost, 1, v_BB_Depreciation_Cost) = "Beginning Amt"; 
	
	fg.ColWidth(v_BB_Depreciation_Cost) = 2000;
	
	fg.Cell(0, 1, v_Ratio_5, 1, v_Ratio_5) = "Ratio"; 
	
	fg.Cell(0, 1, v_In_Convert_Qty_5, 1, v_In_Convert_Qty_5) = "In Convert Qty"; 
	
	fg.Cell(0, 1, v_In_Depreciation_Cost, 1, v_In_Depreciation_Cost) = "In Amt"; 
	
	fg.Cell(0, 1, v_Total_Depreciation_Cost, 1, v_Total_Depreciation_Cost) = "Total Amt"; 
	
	fg.ColWidth(v_Total_Depreciation_Cost) = "2000"; 
	
	fg.Cell(0, 1, v_Out_Depreciation_Cost, 1, v_Out_Depreciation_Cost) = "Prod. Cons. Amt"; 
	
	fg.Cell(0, 1, v_End_Depreciation_Cost, 1, v_End_Depreciation_Cost) = "WIP Bal. Amt"; 
			
	fg.Cell(0, 0, v_BB_Welfare_Cost, 0, v_End_Welfare_Cost) = "6. Welfare Cost"; // Welfare Cost
	
	fg.Cell(0, 1, v_BB_Welfare_Cost, 1, v_BB_Welfare_Cost) = "Beginning Amt"; 
	
	fg.ColWidth(v_BB_Welfare_Cost) = 2000;
	
	fg.Cell(0, 1, v_Ratio_6, 1, v_Ratio_6) = "Ratio"; 
	
	fg.Cell(0, 1, v_In_Convert_Qty_6, 1, v_In_Convert_Qty_6) = "In Convert Qty"; 
	
	fg.Cell(0, 1, v_In_Welfare_Cost, 1, v_In_Welfare_Cost) = "In Amt"; 
	
	fg.Cell(0, 1, v_Total_Welfare_Cost, 1, v_Total_Welfare_Cost) = "Total Amt"; 
	
	fg.Cell(0, 1, v_Out_Welfare_Cost, 1, v_Out_Welfare_Cost) = "Prod. Cons. Amt"; 
	
	fg.Cell(0, 1, v_End_Welfare_Cost, 1, v_End_Welfare_Cost) = "WIP Bal. Amt"; 
	
	fg.Cell(0, 0, v_BB_Others_Cost, 0, v_End_Others_Cost) = "7. Others Cost"; // Others Cost
	
	fg.Cell(0, 1, v_BB_Others_Cost, 1, v_BB_Others_Cost) = "Beginning Amt"; 
	
	fg.ColWidth(v_BB_Others_Cost) = "2000"; 
	
	fg.Cell(0, 1, v_Ratio_7, 1, v_Ratio_7) = "Ratio"; 
	
	fg.Cell(0, 1, v_In_Convert_Qty_7, 1, v_In_Convert_Qty_7) = "In Convert Qty"; 
	
	fg.Cell(0, 1, v_In_Others_Cost, 1, v_In_Others_Cost) = "In Amt"; 
	
	fg.Cell(0, 1, v_Total_Others_Cost, 1, v_Total_Others_Cost) = "Total Amt"; 
	
	fg.Cell(0, 1, v_Out_Others_Cost, 1, v_Out_Others_Cost) = "Prod. Cons. Amt"; 
	
	fg.Cell(0, 1, v_End_Others_Cost, 1, v_End_Others_Cost) = "WIP Bal. Amt"; 		
	
}
//----------------------------------------------------------------------
function OnFormat()
{
	
	var fg = idGrid.GetGridControl();
	fg.ColFormat(v_BB_WIP_Qty) = "#,###,###,###.####R";
	
	fg.ColFormat(v_In_WIP_Qty) = "#,###,###,###.####R";
	
	fg.ColFormat(v_WIP_Out_Qty) = "#,###,###,###.####R";
	
	fg.ColFormat(v_End_Bal_WIP_Qty) = "#,###,###,###.####R";
	
	fg.ColFormat(v_BB_WIP_Amt) = "#,###,###,###R"; 
	
	fg.ColFormat(v_WIP_In_Amt) = "#,###,###,###,###R"; 
	
	fg.ColFormat(v_Prod_Unit_Cost_WIP) = "#,###,###,###.#######R"; 
	
	fg.ColFormat(v_Prod_Cons_Amt_WIP) = "#,###,###,###R"; 
		
	fg.ColFormat(v_End_Bal_WIP_Amt) = "#,###,###,###,###R";
	
	fg.ColFormat(v_BB_WIP_Mat_Amt) = "#,###,###,###,###R";
		
	fg.ColFormat(v_WIP_Mat_In_Amt) = "#,###,###,###R";
	
	fg.ColFormat(v_WIP_Mat_BB_In_Amt) = "#,###,###,###R";
	
	fg.ColFormat(v_WIP_Mat_Unit_Cost) = "#,###,###.#######R";
		
	fg.ColFormat(v_Consum_Amt_WIP_Mat) = "#,###,###,###,###R";
	
	fg.ColFormat(v_End_WIP_Mat_Amt) = "#,###,###,###,###R";
	
	fg.ColFormat(v_BB_WIP_Gener_Amt) = "#,###,###,###,###R";
	
	fg.ColFormat(v_In_Convert_Qty) = "#,###,###,###.##R";
	
	fg.ColFormat(v_In_Amt_WIP_Gener) = "#,###,###,###,###R";
	
	fg.ColFormat(v_Prod_Unit_Cost_WIP_Gener) = "#,###,###,###.#######R";
		
	fg.ColFormat(v_Consum_Amt_WIP_Gener) = "#,###,###,###,###R";
	
	fg.ColFormat(v_End_WIP_Gener_Amt) = "#,###,###,###,###R";
	
	//Packing Cost
	fg.ColFormat(v_BB_Packing_Amt) = "#,###,###,###,###R";
	fg.ColFormat(v_Ratio_1) = "#,###,###,###.####R";
	fg.ColFormat(v_In_Convert_Qty_1) = "#,###,###,###.##R";
	fg.ColFormat(v_In_Packing_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Total_Packing_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Out_Packing_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_End_Packing_Amt) = "#,###,###,###,###R";

	// Labor Cost
	fg.ColFormat(v_BB_Labor_Amt) = "#,###,###,###,###R";
	fg.ColFormat(v_Ratio_2) = "#,###,###,###.####R";
	fg.ColFormat(v_In_Convert_Qty_2) = "#,###,###,###.##R";
	fg.ColFormat(v_In_Labor_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Total_Labor_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Out_Labor_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_End_Labor_Amt) = "#,###,###,###,###R";

	// Electricity Cost
	fg.ColFormat(v_BB_Electricity_Amt) = "#,###,###,###,###R";
	fg.ColFormat(v_Ratio_3) = "#,###,###,###.####R";
	fg.ColFormat(v_In_Convert_Qty_3) = "#,###,###,###.##R";
	fg.ColFormat(v_In_Electricity_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Total_Electricity_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Out_Electricity_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_End_Electricity_Amt) = "#,###,###,###,###R";

	// Consumable Cost
	fg.ColFormat(v_BB_Consumable_Amt) = "#,###,###,###,###R";
	fg.ColFormat(v_Ratio_4) = "#,###,###,###.####R";
	fg.ColFormat(v_In_Convert_Qty_4) = "#,###,###,###.##R";
	fg.ColFormat(v_In_Consumable_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Total_Consumable_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Out_Consumable_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_End_Consumable_Amt) = "#,###,###,###,###R";

	// Depreciation Cost
	fg.ColFormat(v_BB_Depreciation_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Ratio_5) = "#,###,###,###.####R";
	fg.ColFormat(v_In_Convert_Qty_5) = "#,###,###,###.##R";
	fg.ColFormat(v_In_Depreciation_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Total_Depreciation_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Out_Depreciation_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_End_Depreciation_Cost) = "#,###,###,###,###R";
	
	// Welfare Cost
	fg.ColFormat(v_BB_Welfare_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Ratio_6) = "#,###,###,###.####R";
	fg.ColFormat(v_In_Convert_Qty_6) = "#,###,###,###.##R";
	fg.ColFormat(v_In_Welfare_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Total_Welfare_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Out_Welfare_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_End_Welfare_Cost) = "#,###,###,###,###R";

	// Others Cost
	fg.ColFormat(v_BB_Others_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Ratio_7) = "#,###,###,###.####R";
	fg.ColFormat(v_In_Convert_Qty_7) = "#,###,###,###.##R";
	fg.ColFormat(v_In_Others_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Total_Others_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_Out_Others_Cost) = "#,###,###,###,###R";
	fg.ColFormat(v_End_Others_Cost) = "#,###,###,###,###R";
	
}
function OnSumTotal()
{
	var i;
	var l_BB_WIP_Qty = 0 , l_In_WIP_Qty = 0 , l_WIP_Out_Qty = 0 , l_End_Bal_WIP_Qty = 0 ;
	
	var l_BB_WIP_Amt = 0 , l_WIP_In_Amt = 0 , l_Prod_Cons_Amt_WIP = 0 ;
	
	var l_End_Bal_WIP_Amt  = 0 , l_BB_WIP_Mat_Amt = 0 , l_WIP_Mat_In_Amt = 0;
	
	var l_WIP_Mat_BB_In_Amt = 0 , l_Consum_Amt_WIP_Mat = 0 , l_End_WIP_Mat_Amt = 0 ;
	
	var l_BB_WIP_Gener_Amt = 0 , l_In_Convert_Qty = 0 , l_In_Amt_WIP_Gener = 0 ;
	
	var l_Consum_Amt_WIP_Gener = 0, l_End_WIP_Gener_Amt = 0 , l_BB_Packing_Amt = 0 ;
	
	var l_In_Convert_Qty_1 = 0 , l_In_Packing_Cost = 0 , l_Total_Packing_Cost = 0 ;
	
	var l_Out_Packing_Cost = 0 , l_End_Packing_Amt = 0 , l_BB_Labor_Amt = 0 ;
	
	var l_In_Convert_Qty_2 = 0 , l_In_Labor_Cost = 0 , l_Total_Labor_Cost = 0 ;
	
	var l_Out_Labor_Cost = 0 , l_End_Labor_Amt = 0 , l_BB_Electricity_Amt = 0 ;
	
	var l_In_Convert_Qty_3 = 0 , l_In_Electricity_Cost = 0 , l_Total_Electricity_Cost = 0 ;
	
	var l_Out_Electricity_Cost = 0 , l_End_Electricity_Amt = 0 , l_BB_Consumable_Amt = 0 ;
	
	var l_In_Convert_Qty_4 = 0 , l_In_Consumable_Cost = 0 , l_Total_Consumable_Cost = 0 ;
	
	var l_Out_Consumable_Cost = 0 , l_End_Consumable_Amt = 0 , l_BB_Depreciation_Cost = 0 ;
	
	var l_In_Convert_Qty_5 = 0, l_In_Depreciation_Cost = 0 , l_Total_Depreciation_Cost = 0 ;
	
	var l_Out_Depreciation_Cost = 0 , l_End_Depreciation_Cost = 0, l_BB_Welfare_Cost = 0 ;
	
	var l_In_Convert_Qty_6 = 0 , l_In_Welfare_Cost = 0 , l_Total_Welfare_Cost = 0 ;
	
	var l_Out_Welfare_Cost = 0 , l_End_Welfare_Cost = 0 , l_BB_Others_Cost = 0 ;
	
	var l_In_Convert_Qty_7 = 0 , l_In_Others_Cost = 0 , l_Total_Others_Cost =  0;
	
	var l_Out_Others_Cost = 0 , l_End_Others_Cost = 0 ;	
	
	for(i = 2; i < idGrid.rows; i++)
	{
		l_BB_WIP_Qty += Number(idGrid.GetGridData(i, v_BB_WIP_Qty)); 
		
		l_In_WIP_Qty += Number(idGrid.GetGridData(i, v_In_WIP_Qty)); 
				
		l_WIP_Out_Qty += Number(idGrid.GetGridData(i, v_WIP_Out_Qty)) ; 
		
		l_End_Bal_WIP_Qty += Number(idGrid.GetGridData(i, v_End_Bal_WIP_Qty)); 
		
		l_BB_WIP_Amt += Number(idGrid.GetGridData(i, v_BB_WIP_Amt));  
		
		l_WIP_In_Amt += Number(idGrid.GetGridData(i, v_WIP_In_Amt)); 
		
		l_Prod_Cons_Amt_WIP += Number(idGrid.GetGridData(i, v_Prod_Cons_Amt_WIP )); 		
		
		l_End_Bal_WIP_Amt += Number(idGrid.GetGridData(i, v_End_Bal_WIP_Amt)); 
		
		l_BB_WIP_Mat_Amt += Number(idGrid.GetGridData(i, v_BB_WIP_Mat_Amt)); 
		
		l_WIP_Mat_In_Amt += Number(idGrid.GetGridData(i, v_WIP_Mat_In_Amt)); 
		
		l_WIP_Mat_BB_In_Amt += Number(idGrid.GetGridData(i, v_WIP_Mat_BB_In_Amt)); 
						
		l_Consum_Amt_WIP_Mat += Number(idGrid.GetGridData(i, v_Consum_Amt_WIP_Mat)); 
		
		l_End_WIP_Mat_Amt += Number(idGrid.GetGridData(i, v_End_WIP_Mat_Amt )); 
		
		l_BB_WIP_Gener_Amt += Number(idGrid.GetGridData(i, v_BB_WIP_Gener_Amt)); 
		
		l_In_Convert_Qty += Number(idGrid.GetGridData(i, v_In_Convert_Qty)); 
		
		l_In_Amt_WIP_Gener += Number(idGrid.GetGridData(i, v_In_Amt_WIP_Gener )); 
		
		l_Consum_Amt_WIP_Gener += Number(idGrid.GetGridData(i, v_Consum_Amt_WIP_Gener)); 
		
		l_End_WIP_Gener_Amt += Number(idGrid.GetGridData(i, v_End_WIP_Gener_Amt )); 		
		
		l_BB_Packing_Amt += Number(idGrid.GetGridData(i, v_BB_Packing_Amt)); 
		
		l_In_Convert_Qty_1 += Number(idGrid.GetGridData(i, v_In_Convert_Qty_1 )); 
		
		l_In_Packing_Cost += Number(idGrid.GetGridData(i, v_In_Packing_Cost )); 
		
		l_Total_Packing_Cost += Number(idGrid.GetGridData(i, v_Total_Packing_Cost )); 
		
		l_Out_Packing_Cost += Number(idGrid.GetGridData(i, v_Out_Packing_Cost )); 
		
		l_End_Packing_Amt += Number(idGrid.GetGridData(i, v_End_Packing_Amt )); 
		
		l_BB_Labor_Amt += Number(idGrid.GetGridData(i, v_BB_Labor_Amt )); 
		
		l_In_Convert_Qty_2 += Number(idGrid.GetGridData(i, v_In_Convert_Qty_2 )); 
		
		l_In_Labor_Cost += Number(idGrid.GetGridData(i, v_In_Labor_Cost )); 
		
		l_Total_Labor_Cost += Number(idGrid.GetGridData(i, v_Total_Labor_Cost )); 
		
		l_Out_Labor_Cost += Number(idGrid.GetGridData(i, v_Out_Labor_Cost )); 
		
		l_End_Labor_Amt += Number(idGrid.GetGridData(i, v_End_Labor_Amt )); 
		
		l_BB_Electricity_Amt += Number(idGrid.GetGridData(i, v_BB_Electricity_Amt )); 
		
		l_In_Convert_Qty_3 += Number(idGrid.GetGridData(i, v_In_Convert_Qty_3 )); 
		
		l_In_Electricity_Cost += Number(idGrid.GetGridData(i, v_In_Electricity_Cost )); 
		
		l_Total_Electricity_Cost += Number(idGrid.GetGridData(i, v_Total_Electricity_Cost )); 
		
		l_Out_Electricity_Cost += Number(idGrid.GetGridData(i, v_Out_Electricity_Cost )); 
		
		l_End_Electricity_Amt += Number(idGrid.GetGridData(i, v_End_Electricity_Amt )); 
		
		l_BB_Consumable_Amt += Number(idGrid.GetGridData(i, v_BB_Consumable_Amt )); 
		
		l_In_Convert_Qty_4 += Number(idGrid.GetGridData(i, v_In_Convert_Qty_4 )); 
		
		l_In_Consumable_Cost += Number(idGrid.GetGridData(i, v_In_Consumable_Cost )); 
		
		l_Total_Consumable_Cost += Number(idGrid.GetGridData(i, v_Total_Consumable_Cost )); 
		
		l_Out_Consumable_Cost += Number(idGrid.GetGridData(i, v_Out_Consumable_Cost )); 
		
		l_End_Consumable_Amt += Number(idGrid.GetGridData(i, v_End_Consumable_Amt )); 
		
		l_BB_Depreciation_Cost += Number(idGrid.GetGridData(i, v_BB_Depreciation_Cost )); 
		
		l_In_Convert_Qty_5 += Number(idGrid.GetGridData(i, v_In_Convert_Qty_5 )); 
		
		l_In_Depreciation_Cost += Number(idGrid.GetGridData(i, v_In_Depreciation_Cost )); 
		
		l_Total_Depreciation_Cost += Number(idGrid.GetGridData(i, v_Total_Depreciation_Cost )); 
		
		l_Out_Depreciation_Cost += Number(idGrid.GetGridData(i, v_Out_Depreciation_Cost )); 
		
		l_End_Depreciation_Cost += Number(idGrid.GetGridData(i, v_End_Depreciation_Cost )); 
		
		l_BB_Welfare_Cost += Number(idGrid.GetGridData(i, v_BB_Welfare_Cost )); 
		
		l_In_Convert_Qty_6 += Number(idGrid.GetGridData(i, v_In_Convert_Qty_6 )); 
		
		l_In_Welfare_Cost += Number(idGrid.GetGridData(i, v_In_Welfare_Cost )); 
		
		l_Total_Welfare_Cost += Number(idGrid.GetGridData(i, v_Total_Welfare_Cost )); 
		
		l_Out_Welfare_Cost += Number(idGrid.GetGridData(i, v_Out_Welfare_Cost )); 
		
		l_End_Welfare_Cost += Number(idGrid.GetGridData(i, v_End_Welfare_Cost )); 
		
		l_BB_Others_Cost += Number(idGrid.GetGridData(i, v_BB_Others_Cost )); 
		
		l_In_Convert_Qty_7 += Number(idGrid.GetGridData(i, v_In_Convert_Qty_7 )); 
		
		l_In_Others_Cost += Number(idGrid.GetGridData(i, v_In_Others_Cost )); 
		
		l_Total_Others_Cost += Number(idGrid.GetGridData(i, v_Total_Others_Cost )); 
		
		l_Out_Others_Cost += Number(idGrid.GetGridData(i, v_Out_Others_Cost )); 
		
		l_End_Others_Cost += Number(idGrid.GetGridData(i, v_End_Others_Cost )); 
	}  
	
	idGrid.AddRow();
	
	idGrid.SetGridText(idGrid.rows - 1, v_BB_WIP_Qty , l_BB_WIP_Qty);
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_WIP_Qty, l_In_WIP_Qty);
	
	idGrid.SetGridText(idGrid.rows - 1, v_WIP_Out_Qty, l_WIP_Out_Qty);
	
	idGrid.SetGridText(idGrid.rows - 1, v_End_Bal_WIP_Qty, l_End_Bal_WIP_Qty);
	
	idGrid.SetGridText(idGrid.rows - 1, v_BB_WIP_Amt, l_BB_WIP_Amt );
	
	idGrid.SetGridText(idGrid.rows - 1, v_WIP_In_Amt, l_WIP_In_Amt);
	
	idGrid.SetGridText(idGrid.rows - 1, v_Prod_Cons_Amt_WIP, l_Prod_Cons_Amt_WIP);
	
	idGrid.SetGridText(idGrid.rows - 1, v_End_Bal_WIP_Amt, l_End_Bal_WIP_Amt);
	
	idGrid.SetGridText(idGrid.rows - 1, v_BB_WIP_Mat_Amt, l_BB_WIP_Mat_Amt);
	
	idGrid.SetGridText(idGrid.rows - 1, v_WIP_Mat_In_Amt, l_WIP_Mat_In_Amt);
	
	idGrid.SetGridText(idGrid.rows - 1, v_WIP_Mat_BB_In_Amt , l_WIP_Mat_BB_In_Amt);
	
	idGrid.SetGridText(idGrid.rows - 1, v_Consum_Amt_WIP_Mat, l_Consum_Amt_WIP_Mat);
	
	idGrid.SetGridText(idGrid.rows - 1, v_End_WIP_Mat_Amt, l_End_WIP_Mat_Amt);
	
	idGrid.SetGridText(idGrid.rows - 1, v_BB_WIP_Gener_Amt, l_BB_WIP_Gener_Amt);
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Convert_Qty, l_In_Convert_Qty);
		
	idGrid.SetGridText(idGrid.rows - 1, v_In_Amt_WIP_Gener, l_In_Amt_WIP_Gener);  
	
	idGrid.SetGridText(idGrid.rows - 1, v_Consum_Amt_WIP_Gener, l_Consum_Amt_WIP_Gener);
	
	idGrid.SetGridText(idGrid.rows - 1, v_End_WIP_Gener_Amt, l_End_WIP_Gener_Amt);    
	
	idGrid.SetGridText(idGrid.rows - 1, v_BB_Packing_Amt, l_BB_Packing_Amt);
		
	idGrid.SetGridText(idGrid.rows - 1, v_In_Convert_Qty_1, l_In_Convert_Qty_1);    
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Packing_Cost, l_In_Packing_Cost);    
	
	idGrid.SetGridText(idGrid.rows - 1, v_Total_Packing_Cost, l_Total_Packing_Cost);    
	
	idGrid.SetGridText(idGrid.rows - 1, v_Out_Packing_Cost, l_Out_Packing_Cost);    
	
	idGrid.SetGridText(idGrid.rows - 1, v_End_Packing_Amt, l_End_Packing_Amt);    
	
	idGrid.SetGridText(idGrid.rows - 1, v_BB_Labor_Amt, l_BB_Labor_Amt);    
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Convert_Qty_2, l_In_Convert_Qty_2 );    
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Labor_Cost, l_In_Labor_Cost );    
	
	idGrid.SetGridText(idGrid.rows - 1, v_Total_Labor_Cost, l_Total_Labor_Cost );    
	
	idGrid.SetGridText(idGrid.rows - 1, v_Out_Labor_Cost, l_Out_Labor_Cost );    
	
	idGrid.SetGridText(idGrid.rows - 1, v_End_Labor_Amt, l_End_Labor_Amt );    
	
	idGrid.SetGridText(idGrid.rows - 1, v_BB_Electricity_Amt, l_BB_Electricity_Amt );    
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Convert_Qty_3, l_In_Convert_Qty_3 );   

	idGrid.SetGridText(idGrid.rows - 1, v_In_Electricity_Cost, l_In_Electricity_Cost );   
		
	idGrid.SetGridText(idGrid.rows - 1, v_Total_Electricity_Cost, l_Total_Electricity_Cost );    
	
	idGrid.SetGridText(idGrid.rows - 1, v_Out_Electricity_Cost, l_Out_Electricity_Cost );    
	
	idGrid.SetGridText(idGrid.rows - 1, v_End_Electricity_Amt, l_End_Electricity_Amt );    
	
	idGrid.SetGridText(idGrid.rows - 1, v_BB_Consumable_Amt, l_BB_Consumable_Amt );    
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Convert_Qty_4, l_In_Convert_Qty_4 );    
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Consumable_Cost, l_In_Consumable_Cost);
	
	idGrid.SetGridText(idGrid.rows - 1, v_Total_Consumable_Cost, l_Total_Consumable_Cost);
	
	idGrid.SetGridText(idGrid.rows - 1, v_Out_Consumable_Cost, l_Out_Consumable_Cost);
	
	idGrid.SetGridText(idGrid.rows - 1, v_End_Consumable_Amt, l_End_Consumable_Amt);
	
	idGrid.SetGridText(idGrid.rows - 1, v_BB_Depreciation_Cost, l_BB_Depreciation_Cost);
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Convert_Qty_5, l_In_Convert_Qty_5);
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Depreciation_Cost, l_In_Depreciation_Cost);
	
	idGrid.SetGridText(idGrid.rows - 1, v_Total_Depreciation_Cost, l_Total_Depreciation_Cost);
	
	idGrid.SetGridText(idGrid.rows - 1, v_Out_Depreciation_Cost, l_Out_Depreciation_Cost);
	
	idGrid.SetGridText(idGrid.rows - 1, v_End_Depreciation_Cost, l_End_Depreciation_Cost);
	
	idGrid.SetGridText(idGrid.rows - 1, v_BB_Welfare_Cost, l_BB_Welfare_Cost );
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Convert_Qty_6, l_In_Convert_Qty_6 );
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Welfare_Cost, l_In_Welfare_Cost );
	
	idGrid.SetGridText(idGrid.rows - 1, v_Total_Welfare_Cost, l_Total_Welfare_Cost );
	
	idGrid.SetGridText(idGrid.rows - 1, v_Out_Welfare_Cost, l_Out_Welfare_Cost );
	
	idGrid.SetGridText(idGrid.rows - 1, v_End_Welfare_Cost, l_End_Welfare_Cost );
	
	idGrid.SetGridText(idGrid.rows - 1, v_BB_Others_Cost, l_BB_Others_Cost );
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Convert_Qty_7, l_In_Convert_Qty_7 );
	
	idGrid.SetGridText(idGrid.rows - 1, v_In_Others_Cost, l_In_Others_Cost );
	
	idGrid.SetGridText(idGrid.rows - 1, v_Total_Others_Cost, l_Total_Others_Cost );
	
	idGrid.SetGridText(idGrid.rows - 1, v_Out_Others_Cost, l_Out_Others_Cost );
	
	idGrid.SetGridText(idGrid.rows - 1, v_End_Others_Cost, l_End_Others_Cost );
	
	idGrid.SetGridText(i, 0, "TOTAL");
	
	idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1,idGrid.cols-1,0xA9EBD7);		
	
}
//-------------------------------------------------------------------------
function OnDelete()
{
	if(confirm("Are you sure you want to remove data?"))
	{
		dso_remove_data.Call();
	}
}
function OnPrint()
{	
		 //var url = '/standard/standard/reports/fm/gf/rpt_fmgf00250.aspx?p_comp_pk='+ lstCompany.value+'&p_std_ym='+dbMonthly.value;
		 var url = '/standard/standard/reports/fm/gf/rpt_fmgf00250_WIP_Monthly_Evaluation.aspx?p_comp_pk='+ lstCompany.value+'&p_std_ym='+dbMonthly.value;
	     System.OpenTargetPage( System.RootURL+url , "newform" );		
}

//----------------------------------------------------
function OnDataReceive(iObj)
{
	if(iObj.id == "fmgf00250")
	{
		OnMergeHeader();
		System.Translate(document);
		OnButtonStatus();
		OnSumTotal();
		dso_get_seq_slip.Call();
	}
	else if(iObj.id == "dso_process_cost")
	{
		fmgf00250.Call("SELECT");
	}
	else if(iObj.id == "dso_make_slip" )
	{
		dso_get_seq_slip.Call();	
	}
	else if(iObj.id == "dso_cancel_slip" )
	{
		dso_get_seq_slip.Call();	
	}
}

function OnMakeSlip()
{
	if(confirm('Are you sure you want to make slip?'))
	{
		dso_make_slip.Call();
		idBtnMake.SetEnable(false);
	}
}
///////////////////////////////////////////////
function OnCancelSlip()
{
	if(confirm('Are you sure you want to cancel slip?'))
	{
		dso_cancel_slip.Call();
		idBtnCancel.SetEnable(true);
	}
}
function OnButtonStatus()
{
	if(txtSeq.GetData() != "")
	{
		idBtnMake.SetEnable(false);
		idBtnCancel.SetEnable(true);
		idBtnProcess.SetEnable(false);
		idBtnDel.SetEnable(false);
	}
	else
	{
		if(idGrid.rows > 2)
		{
			idBtnDel.SetEnable(true);
			idBtnProcess.SetEnable(false);
			idBtnMake.SetEnable(true);
			idBtnCancel.SetEnable(true);
		}
		else
		{
			idBtnProcess.SetEnable(true);
			idBtnDel.SetEnable(false);
			idBtnMake.SetEnable(false);
			idBtnCancel.SetEnable(false);
		}
	}
}
//---------------------------------------------------
</script>

<body>    
    <!-------------------------------------------------------------------->
    <gw:data id="dso_process_cost" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="acnt.sp_pro_fmgf00250">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dbMonthly" />					 
                </input>  
                <output>  
                     <output bind="txtReturn"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
	<!-------------------------------------------------------------------->

  <gw:data id="fmgf00250" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="acnt.SP_SEL_FMGF00250" > 
                <input bind="idGrid" >        
                     <input bind="lstCompany"/>		
					 <input bind="dbMonthly"/>				
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>      

    <gw:data id="dso_remove_data" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="acnt.sp_pro_fmgf00250_3">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dbMonthly" />					 
                </input>  
                <output>  
                     <output bind="txtReturn"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
	
    <gw:data id="dso_get_seq_slip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="acnt.sp_pro_fmgf00250_6">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dbMonthly" />					 
                </input>  
                <output>  
                     <output bind="txtSeq"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
	
    <gw:data id="dso_make_slip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="acnt.sp_pro_fmgf00250_4">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dbMonthly" />					 
                </input>  
                <output>  
                     <output bind="txtReturn"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
    <gw:data id="dso_cancel_slip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="acnt.sp_pro_fmgf00250_5">
                <input>                      
                     <input bind="lstCompany" />
					 <input bind="dbMonthly" />	
					 <input bind="txtSeq" />						 
                </input>  
                <output>  
                     <output bind="txtSeq"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	

<!------------------------------------------------------------>
    <table width="100%" style="height: 100%" border="1">
		<tr>
		
		</tr>
        <tr style="height:10%;">
            <td colspan="2">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="height:100%" >
                    <tr>
                        <td style="width:10%"></td>
                        <td style="width:10%"></td>
                        <td style="width:10%"></td>
                        <td style="width:10%"></td>
                        <td style="width:5%"></td>
						<td style="width:5%"></td>
                        <td style="width:10%"></td>
                        <td style="width:10%"></td>
                        <td style="width:10%"></td>
                        <td style="width:10%"></td>
                        <td style="width:10%"></td>
                    </tr>
                    <tr>
                        <td align="right">Company</td>
                        <td align="left">
                            <gw:list id="lstCompany" styles="width:100%; "  />
                        </td>
                        <td align="right">Monthly</td>
                        <td align="left">
                            <gw:datebox id="dbMonthly" type="month" lang="1" />
                        </td>
                        <td align = "right">
                            <gw:imgbtn align="right" id="idBtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="idBtnDel" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />                                 
                        </td>
                        <td align="right">
                            <gw:icon id="idBtnProcess" img="in" alt="Process" text="Process" onclick="OnProcess()" />                                 
                        </td>
                        <td align="right">
                            <gw:icon id="idBtnMake" img="in" alt="Make Slip" text="Make Slip" onclick="OnMakeSlip()" />
                        </td>	
                        <td align="right">
                            <gw:icon id="idBtnCancel" img="in" alt="Cancel Slip" text="Cancel Slip" onclick="OnCancelSlip()" />
                        </td>												
						<td><gw:textbox id="txtSeq" styles="width:100%;"  /></td>
						 <td style="width: 3%" align="right">
                        <gw:imgbtn img="excel" alt="Print" id="btnExcel" onclick="OnPrint()" />
                    </td>
                    </tr>
                 </table>
            </td>
        </tr>                                
        <tr style="height:90%" >
            <td id="tRIGHT" style="width: 75%;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="height:100%" >
                    <tr style="height:90%">
                        <td colspan="6" style="width: 100%;">
                            <gw:grid id="idGrid" 
								header="Item Code|Begining Bal. Qty|In Qty|Prod. Cons. Qty|Ending Bal. Qty|Begining Bal. Amt|In Amt|Prod. Unit Cost|Prod. Cons. Amt|Ending Bal. Amt|Begining Bal. Amt|In Amt|Beginning + In|Unit Cost|Consumption Amt|Ending Bal. Amt|Begining Bal. Amt|In Convert Qty|In Amt|Prod Unit Cost|Consumption Amt|Ending Bal. Amt|Beginning Amt|Ratio|In Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|Beginning Amt|Ratio|Convert Qty|In Amount|Total Amt|Prod. Cons. Amt|WIP Bal. Amt|WIP Bal. Amt"
								format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								aligns="1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
								defaults="||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" 
								editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								widths="1800|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|1200|2000|2000|2000|2000|2000|2000|1200|2000|2000|2000|2000|2000|2000|1200|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|1200|2000|2000|2000|20000|2000|2000|1200|2000|2000|2000|2000|2000|2000|1200|2000|2000|2000|2000|2000|2000"
                                styles="width:100%; height:100% " 
                                sorting="T"                                 
                                acceptnulldate="T" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtTco_company_pk" text="" styles='display:none;' />
    <gw:textbox id="txtTAC_ABACCTCODE_PK" text="" styles='display:none;' />
    <gw:textbox id="txttac_abplcenter_pk" text="" styles='display:none;' />
    <gw:textbox id="txttco_item_pk" text="" styles='display:none;' />
    <gw:textbox id="txtUOM" text="" styles='display:none;' />
    <gw:textbox id="txttin_warehouse_pk" text="" styles='display:none; ' />
    <gw:textbox id="txtTAC_ABACCTCODE_PK_2" text="" styles='display:none; ' />
    <gw:textbox id="txttac_abplcenter_pk_2" text="" styles='display:none; ' />
    <gw:textbox id="txtdateto_Balance" text="" styles='display:none; ' />
    <gw:textbox id="txtAccountCode_2" text="" styles='display:none; ' />    
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />    
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtPage" styles='display:none' />    
    <gw:textbox id="txtRecords" styles='display:none' />    
	<gw:textbox id="txtReturn" styles='display:none' />    
	
</body>
</html>