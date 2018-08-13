<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
<title>Main Contract Other Expenses</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var COL_Work_Name               = 0,
    COL_Field                   = 1,
    COL_Standard                = 2,
    COL_UOM                     = 3,
    COL_Currency                = 4,
    COL_Quantity                = 5,
    COL_Material_Unit           = 6,
    COL_Material_Amt            = 7,
    COL_Labor_Unit              = 8,
    COL_Labor_Amt               = 9,
    COL_Equipment_Unit          = 10,
    COL_Equipment_Amt           = 11,
    COL_Unit                    = 12,
    COL_Sum                     = 13,
    COL_Sum_Main                = 14,
    COL_unit_cost_mgmyn         = 15,
    
    COL2_Key_Material_Amt       = 16,
    COL2_Key_Labor_Amt          = 17,
    COL2_Key_Equipment_Amt      = 18,
    COL2_Key_Exp_Amt            = 19,
    COL2_Key_Amt                = 20,
    COL2_Corp_Material_Amt      = 21,
    COL2_Corp_Labor_Amt         = 22,
    COL2_Corp_Equipment_Amt     = 23,
    COL2_Corp_Exp_Amt           = 24,
    COL2_Corp_Amt               = 25,
    
    COL_Sort_Col                = 26,
    
    COL3_Orig_Qty               = 27,
    COL3_Orig_Price             = 28,
    COL3_Orig_Amt               = 29,
    COL3_Chg_Qty                = 30,
    COL3_Chg_Price              = 31,
    COL3_Chg_Amt                = 32,
    COL3_InDe_Qty               = 33,
    COL3_InDe_Price             = 34,
    COL3_InDe_Amt               = 35,
    
    COL4_Orig_Key               = 36,
    COL4_Chg_Key                = 37,
    COL4_InDe_Key               = 38,
    COL4_Orig_Corp              = 39,
    COL4_Chg_Corp               = 40,
    COL4_InDe_Corp              = 41
    ;
    
function BodyInit()
{
      System.Translate(document);
            
        var lstDataType = "DATA|0|Cont. Dtal.|1|Cont. Sum-up Table|2|Cont. All Table|3|Org / Chg Cont. Dtal.|4|Org / Chg Cont. Sum-up Table|5|Org / Chg Cont. All Table";
        lstData_Type.SetDataText(lstDataType);
        
        var lstInDe_Type = "DATA|ALL|ALL|CHG|Chg Portion";
        lstInDe.SetDataText(lstInDe_Type);
      
      document.getElementById("lbOrig").innerHTML = "";
      document.getElementById("lbInDe").innerHTML = "";
      
      lstOrig.GetControl().style.display = "none";
      lstInDe.GetControl().style.display = "none";
      
	  MergeHeader();
	  FormatGrid();  
}
//-------------------------------------------------------------------------------------------------------------------------------------
function MergeHeader()
{
        var fg=Grid_Search.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Search.AddRow();     
		}    
        fg.FixedRows    = 2;
        fg.MergeCells   = 5;
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, COL_Material_Unit,    0, COL_Material_Amt)    = "Material";
	    fg.Cell(0, 1, COL_Material_Unit,    1, COL_Material_Unit)   = "Unit Price";
	    fg.Cell(0, 1, COL_Material_Amt,     1, COL_Material_Amt)    = "Amount";
	    
	    fg.Cell(0, 0, COL_Labor_Unit,       0, COL_Labor_Amt)       = "Labor";
	    fg.Cell(0, 1, COL_Labor_Unit,       1, COL_Labor_Unit)      = "Unit Price";
	    fg.Cell(0, 1, COL_Labor_Amt,        1, COL_Labor_Amt)       = "Amount";
	   
	    fg.Cell(0, 0, COL_Equipment_Unit,   0, COL_Equipment_Amt)   = "Equipment";
	    fg.Cell(0, 1, COL_Equipment_Unit,   1, COL_Equipment_Unit)  = "Unit Price";
	    fg.Cell(0, 1, COL_Equipment_Amt,    1, COL_Equipment_Amt)   = "Amount";
	    
	    fg.MergeCol(COL_Work_Name)      = true;
		fg.Cell(0, 0, COL_Work_Name,        1, COL_Work_Name)       = "Work Name";	
		fg.MergeCol(COL_Field)          = true;
		fg.Cell(0, 0, COL_Field,            1, COL_Field)           = "Field";
	    fg.MergeCol(COL_Standard)       = true;
	    fg.Cell(0, 0, COL_Standard,         1, COL_Standard)        = "Standard";
		fg.MergeCol(COL_UOM)            = true;
		fg.Cell(0, 0, COL_UOM,              1, COL_UOM)             = "UOM";
		fg.MergeCol(COL_Currency)       = true;
		fg.Cell(0, 0, COL_Currency,         1, COL_Currency)        = "Currency";
		fg.MergeCol(COL_Quantity)       = true;
		fg.Cell(0, 0, COL_Quantity,         1, COL_Quantity)        = "Quantity";
		fg.MergeCol(COL_Unit)           = true;
		fg.Cell(0, 0, COL_Unit,             1, COL_Unit)            = "Unit Price";
		fg.MergeCol(COL_Sum)            = true;
		fg.Cell(0, 0, COL_Sum,              1, COL_Sum)             = "Sum";
		fg.MergeCol(COL_Sum_Main)       = true;
		fg.Cell(0, 0, COL_Sum_Main,         1, COL_Sum_Main)        = "Sum/Main Contract Amount (%)";
		fg.MergeCol(COL_unit_cost_mgmyn)= true;
		fg.Cell(0, 0, COL_unit_cost_mgmyn,  1, COL_unit_cost_mgmyn) = "Unit Cost YN";
		fg.MergeCol(COL_Sort_Col)= true;
		fg.Cell(0, 0, COL_Sort_Col,  1, COL_Sort_Col)               = "Sort Col";
		//---------------------------------------------------------------------------------------------
		fg.MergeRow(0) = true;
		fg.Cell(0, 0, COL2_Key_Material_Amt,    0, COL2_Key_Amt)            = "Key Curr.";
	    fg.Cell(0, 1, COL2_Key_Material_Amt,    1, COL2_Key_Material_Amt)   = "Raw Mtrl. Cost Amt";
	    fg.Cell(0, 1, COL2_Key_Labor_Amt,       1, COL2_Key_Labor_Amt)      = "Labor Cost Amt";
	    fg.Cell(0, 1, COL2_Key_Equipment_Amt,   1, COL2_Key_Equipment_Amt)  = "Equipment Cost Amt";
	    fg.Cell(0, 1, COL2_Key_Exp_Amt,         1, COL2_Key_Exp_Amt)        = "Exp. Amt";
	    fg.Cell(0, 1, COL2_Key_Amt,             1, COL2_Key_Amt)            = "Amount";
	    
	    fg.Cell(0, 0, COL2_Corp_Material_Amt,   0, COL2_Corp_Amt)           = "Corp Currny Convr.";
	    fg.Cell(0, 1, COL2_Corp_Material_Amt,   1, COL2_Corp_Material_Amt)  = "Raw Mtrl. Cost Amt";
	    fg.Cell(0, 1, COL2_Corp_Labor_Amt,      1, COL2_Corp_Labor_Amt)     = "Labor Cost Amt";
	    fg.Cell(0, 1, COL2_Corp_Equipment_Amt,  1, COL2_Corp_Equipment_Amt) = "Equipment Cost Amt";
	    fg.Cell(0, 1, COL2_Corp_Exp_Amt,        1, COL2_Corp_Exp_Amt)       = "Exp. Amt";
	    fg.Cell(0, 1, COL2_Corp_Amt,            1, COL2_Corp_Amt)           = "Amount";
	    //---------------------------------------------------------------------------------------------
		fg.Cell(0, 0, COL3_Orig_Qty,            0, COL3_Orig_Amt)           = "Orig.";
	    fg.Cell(0, 1, COL3_Orig_Qty,            1, COL3_Orig_Qty)           = "Q'ty";
	    fg.Cell(0, 1, COL3_Orig_Price,          1, COL3_Orig_Price)         = "U/P";
	    fg.Cell(0, 1, COL3_Orig_Amt,            1, COL3_Orig_Amt)           = "Amt";
	    
	    fg.Cell(0, 0, COL3_Chg_Qty,             0, COL3_Chg_Amt)            = "Chg.";
	    fg.Cell(0, 1, COL3_Chg_Qty,             1, COL3_Chg_Qty)            = "Q'ty";
	    fg.Cell(0, 1, COL3_Chg_Price,           1, COL3_Chg_Price)          = "U/P";
	    fg.Cell(0, 1, COL3_Chg_Amt,             1, COL3_Chg_Amt)            = "Amt";
	    
	    fg.Cell(0, 0, COL3_InDe_Qty,            0, COL3_InDe_Amt)           = "Incr./Decr.";
	    fg.Cell(0, 1, COL3_InDe_Qty,            1, COL3_InDe_Qty)           = "Q'ty";
	    fg.Cell(0, 1, COL3_InDe_Price,          1, COL3_InDe_Price)         = "U/P";
	    fg.Cell(0, 1, COL3_InDe_Amt,            1, COL3_InDe_Amt)           = "Amt";
	    //---------------------------------------------------------------------------------------------
	    fg.Cell(0, 0, COL4_Orig_Key,            0, COL4_InDe_Key)           = "Key Curr. Cont. Amt";
	    fg.Cell(0, 1, COL4_Orig_Key,            1, COL4_Orig_Key)           = "Orig.";
	    fg.Cell(0, 1, COL4_Chg_Key,             1, COL4_Chg_Key)            = "Chg";
	    fg.Cell(0, 1, COL4_InDe_Key,            1, COL4_InDe_Key)           = "InCr./Decr.";
	    
        fg.Cell(0, 0, COL4_Orig_Corp,           0, COL4_InDe_Corp)          = "Corp. Currny Convr Cont. Amt";
	    fg.Cell(0, 1, COL4_Orig_Corp,           1, COL4_Orig_Corp)          = "Orig.";
	    fg.Cell(0, 1, COL4_Chg_Corp,            1, COL4_Chg_Corp)           = "Chg";
	    fg.Cell(0, 1, COL4_InDe_Corp,           1, COL4_InDe_Corp)          = "InCr./Decr.";
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Work_Breakdown':
                            var path = System.RootURL + '/form/61/03/61030030Work_Breakdown.aspx?Project_Pk=' + txtProject_Pk.text;
		                    var obj = System.OpenModal( path ,600 , 600 , 'resizable:yes;status:yes');
		                    if ( obj != null )
		                    {
                                        if (obj[0] != 0)
                                        {
                                            lstWork_Breakdown.SetDataText(obj[2]);
                                            
                                            OnSearch();
                                        }   
                            }
                break;
                case 'Project':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
                                    
                                    dso_Chg.Call('SELECT');
                            } 
                break;
        }
} 
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
         switch(obj.id)
         {
                case "dso_Search":
                    MergeHeader();
                    FormatGrid();
					//OnShowGrid2();
					
					OnShow();
                break;
                case "dso_Chg":
                        dso_Orig.Call('SELECT');
                break;
                case "dso_Orig":
                        if(lstChg.GetControl().length == 1 && lstData_Type.value > 2) lstData_Type.value = 0;
                        
                        var idx = lstData_Type.value;
                        switch(lstChg.GetControl().length){
                             case 0: lstData_Type.ClearData();break;
                             case 1: lstData_Type.SetDataText("DATA|0|Cont. Dtal.|1|Cont. Sum-up Table|2|Cont. All Table");
                                     lstData_Type.value = idx;
                                     break;
                             default:
                             case 2: lstData_Type.SetDataText("DATA|0|Cont. Dtal.|1|Cont. Sum-up Table|2|Cont. All Table|3|Org / Chg Cont. Dtal.|4|Org / Chg Cont. Sum-up Table|5|Org / Chg Cont. All Table");
                                     lstData_Type.value = (idx == '')?0:idx;
                                     break;
                        }
                        dso_Search.Call('SELECT');
                break;
		 }
		 
}
function OnSearch()
{
    if(txtProject_Pk.text == ""){alert("Please select project!");return false;}
    if(lstChg.GetControl().length == ""){alert("This project haven't version!"); return false;}
    if(lstData_Type.value != "3") lstInDe.value = 'ALL';
    
    switch(lstData_Type.value){
        case "3":
        case "4":
        case "5":
            if(lstChg.value == lstOrig.value){
                alert("Chg. version same Orig. version"); return false;
            }
            break;
    }
    dso_Search.Call('SELECT');
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function FormatGrid()
{ 
	var ctrl = Grid_Search.GetGridControl();
	ctrl.ColFormat(COL_Quantity)            = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL_Material_Unit)       = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL_Material_Amt)        = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL_Labor_Unit)          = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL_Labor_Amt)           = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL_Equipment_Unit)      = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL_Equipment_Amt)       = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL_Unit)                = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL_Sum)                 = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL_Sum_Main)            = "#,###,###,###,###,###,###,###,###.##R";
	
	ctrl.ColFormat(COL2_Key_Material_Amt)   = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL2_Key_Labor_Amt)      = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL2_Key_Equipment_Amt)  = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL2_Key_Exp_Amt)        = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL2_Key_Amt)            = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL2_Corp_Material_Amt)  = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL2_Corp_Labor_Amt)     = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL2_Corp_Equipment_Amt) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL2_Corp_Exp_Amt)       = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL2_Corp_Amt)           = "#,###,###,###,###,###,###,###,###.##R";
	
	ctrl.ColFormat(COL3_Orig_Qty)           = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL3_Orig_Price)         = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL3_Orig_Amt)           = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL3_Chg_Qty)            = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL3_Chg_Price)          = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL3_Chg_Amt)            = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL3_InDe_Qty)           = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL3_InDe_Price)         = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL3_InDe_Amt)           = "#,###,###,###,###,###,###,###,###.##R";
	
	ctrl.ColFormat(COL4_Orig_Key)           = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL4_Chg_Key)            = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL4_InDe_Key)           = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL4_Orig_Corp)          = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL4_Chg_Corp)           = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(COL4_InDe_Corp)          = "#,###,###,###,###,###,###,###,###.##R";
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnShow(){
    var objcl;
    objcl = document.getElementById("slCol");
    
    cbOther.value = 'Y'; cbUnit.value = 'Y'; cbStd.value = 'Y'; cbLevelCode.value = 'Y';
    switch(lstData_Type.value){
        case "0":
            document.getElementById("lbChg").innerHTML = "*S/No.";
            document.getElementById("lbOrig").innerHTML = "";
            document.getElementById("lbInDe").innerHTML = "";
            lstOrig.GetControl().style.display = "none";
            lstInDe.GetControl().style.display = "none";
            objcl.style.display = "block";
            break;
        case "1":
            document.getElementById("lbChg").innerHTML = "*S/No.";
            document.getElementById("lbOrig").innerHTML = "";
            document.getElementById("lbInDe").innerHTML = "";
            lstOrig.GetControl().style.display = "none";
            lstInDe.GetControl().style.display = "none";
            objcl.style.display = "none";
            break;
        case "2":
            document.getElementById("lbChg").innerHTML = "*S/No.";
            document.getElementById("lbOrig").innerHTML = "";
            document.getElementById("lbInDe").innerHTML = "";
            lstOrig.GetControl().style.display = "none";
            lstInDe.GetControl().style.display = "none";
            objcl.style.display = "none";
            break;
        case "3":
            document.getElementById("lbChg").innerHTML = "*Chg.";
            document.getElementById("lbOrig").innerHTML = "*Orig.";
            document.getElementById("lbInDe").innerHTML = "*Incr./Decr.";
            lstOrig.GetControl().style.display = "block";
            lstInDe.GetControl().style.display = "block";
            objcl.style.display = "none";
            break;
        case "4":
        case "5":
            document.getElementById("lbChg").innerHTML = "*Chg.";
            document.getElementById("lbOrig").innerHTML = "*Orig.";
            document.getElementById("lbInDe").innerHTML = "";
            lstOrig.GetControl().style.display = "block";
            lstInDe.GetControl().style.display = "none";
            objcl.style.display = "none";
            break;
    }
    
    OnShowGrid2();
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnShowGrid(ctr){
    var fg = Grid_Search.GetGridControl(); 
    switch(ctr.id){
        case "cbLevelCode": fg.ColHidden(COL_Work_Name)         = (ctr.value == 'N');    break;
        case "cbStd":       fg.ColHidden(COL_Standard)          = (ctr.value == 'N');    break;
        case "cbUnit":      fg.ColHidden(COL_UOM)               = (ctr.value == 'N');    break;
        case "cbOther":
                    if(txtVersionUnitType.text == 'N'){
                            fg.ColHidden(COL_Material_Unit)     = (ctr.value == 'N');
                            fg.ColHidden(COL_Material_Amt)      = (ctr.value == 'N');
                            fg.ColHidden(COL_Labor_Unit)        = (ctr.value == 'N');
                            fg.ColHidden(COL_Labor_Amt)         = (ctr.value == 'N');
                            fg.ColHidden(COL_Equipment_Unit)    = (ctr.value == 'N');
                            fg.ColHidden(COL_Equipment_Amt)     = (ctr.value == 'N');    
                    } else {
                            fg.ColHidden(COL_Unit)              = (ctr.value == 'N'); 
                    }break;
    }
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnShowGrid2(){
        txtVersionUnitType.text = 'Y';
        if(Grid_Search.rows > 2)
        for(var idx = 2; idx < Grid_Search.rows; idx ++)
            if(Grid_Search.GetGridData(idx, COL_unit_cost_mgmyn) != ''){
                txtVersionUnitType.text = Grid_Search.GetGridData(idx, COL_unit_cost_mgmyn); idx = Grid_Search.rows;
            }
        
        
        var fg = Grid_Search.GetGridControl();
        fg.ColHidden(COL_Material_Unit)     = (txtVersionUnitType.text == 'Y' || lstData_Type.value == '1' || lstData_Type.value == '2' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL_Material_Amt)      = (txtVersionUnitType.text == 'Y' || lstData_Type.value == '1' || lstData_Type.value == '2' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL_Labor_Unit)        = (txtVersionUnitType.text == 'Y' || lstData_Type.value == '1' || lstData_Type.value == '2' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL_Labor_Amt)         = (txtVersionUnitType.text == 'Y' || lstData_Type.value == '1' || lstData_Type.value == '2' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL_Equipment_Unit)    = (txtVersionUnitType.text == 'Y' || lstData_Type.value == '1' || lstData_Type.value == '2' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL_Equipment_Amt)     = (txtVersionUnitType.text == 'Y' || lstData_Type.value == '1' || lstData_Type.value == '2' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL_Unit)              = (txtVersionUnitType.text == 'N' || lstData_Type.value == '1' || lstData_Type.value == '2' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        
        if(lstData_Type.value != '0') 
            fg.ColHidden(COL_Work_Name)     = (lstData_Type.value == '0');
        
        fg.ColHidden(COL_Field)             = (lstData_Type.value != '0');
        fg.ColHidden(COL_Standard)          = (lstData_Type.value != '0' && lstData_Type.value != '3');
        fg.ColHidden(COL_UOM)               = (lstData_Type.value != '0' && lstData_Type.value != '3');
        fg.ColHidden(COL_Quantity)          = (lstData_Type.value != '0');
        fg.ColHidden(COL_Sum)               = (lstData_Type.value != '0');
        fg.ColHidden(COL_Sum_Main)          = (lstData_Type.value != '0');
        
        fg.ColHidden(COL2_Key_Material_Amt) = (txtVersionUnitType.text == 'Y' || lstData_Type.value == '0' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL2_Key_Labor_Amt)    = (txtVersionUnitType.text == 'Y' || lstData_Type.value == '0' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL2_Key_Equipment_Amt)= (txtVersionUnitType.text == 'Y' || lstData_Type.value == '0' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL2_Key_Exp_Amt)      = (txtVersionUnitType.text == 'Y' || lstData_Type.value == '0' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL2_Key_Amt)          = (lstData_Type.value != '1' && lstData_Type.value != '2');
        fg.ColHidden(COL2_Corp_Material_Amt)= (txtVersionUnitType.text == 'Y' || lstData_Type.value == '0' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL2_Corp_Labor_Amt)   = (txtVersionUnitType.text == 'Y' || lstData_Type.value == '0' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL2_Corp_Equipment_Amt)=(txtVersionUnitType.text == 'Y' || lstData_Type.value == '0' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL2_Corp_Exp_Amt)     = (txtVersionUnitType.text == 'Y' || lstData_Type.value == '0' || lstData_Type.value == '3' || lstData_Type.value == '4' || lstData_Type.value == '5');
        fg.ColHidden(COL2_Corp_Amt)         = (lstData_Type.value != '1' && lstData_Type.value != '2');
        
        fg.ColHidden(COL3_Orig_Qty)         = (lstData_Type.value != '3');
        fg.ColHidden(COL3_Orig_Price)       = (lstData_Type.value != '3');
        fg.ColHidden(COL3_Orig_Amt)         = (lstData_Type.value != '3');
        fg.ColHidden(COL3_Chg_Qty)          = (lstData_Type.value != '3');
        fg.ColHidden(COL3_Chg_Price)        = (lstData_Type.value != '3');
        fg.ColHidden(COL3_Chg_Amt)          = (lstData_Type.value != '3');
        fg.ColHidden(COL3_InDe_Qty)         = (lstData_Type.value != '3');
        fg.ColHidden(COL3_InDe_Price)       = (lstData_Type.value != '3');
        fg.ColHidden(COL3_InDe_Amt)         = (lstData_Type.value != '3');
        
        fg.ColHidden(COL4_Orig_Key)         = (lstData_Type.value != '4' && lstData_Type.value != '5');
        fg.ColHidden(COL4_Chg_Key)          = (lstData_Type.value != '4' && lstData_Type.value != '5');
        fg.ColHidden(COL4_InDe_Key)         = (lstData_Type.value != '4' && lstData_Type.value != '5');
        fg.ColHidden(COL4_Orig_Corp)        = (lstData_Type.value != '4' && lstData_Type.value != '5');
        fg.ColHidden(COL4_Chg_Corp)         = (lstData_Type.value != '4' && lstData_Type.value != '5');
        fg.ColHidden(COL4_InDe_Corp)        = (lstData_Type.value != '4' && lstData_Type.value != '5');
        
        var obj = document.getElementById("lbUnitPrice");
        obj.innerHTML = (txtVersionUnitType.text == 'Y') ? "Unit Price":"Raw Mtrl/Labor/E";
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnExcel(){
    if(txtProject_Pk.value == ""){alert("Please select project!"); return false;}
    if(txtVersionUnitType.value == ""){alert("Please select project!"); return false;}
    if(lstChg.GetControl().length == ""){alert("This project haven't version!"); return false;}
    var url = System.RootURL;
    switch(lstData_Type.value){ 
        case "0":
				 if(cbOther.value='Y' && lstWork_Breakdown.text !="")
				 {
					var url = '/reports/kp/bp/rpt_kpbp00100_contract_detail_2.aspx?p_project_pk='+txtProject_Pk.text+'&p_version='+lstChg.value+'&p_work='+lstWork_Breakdown.text+'&p_type='+lstData_Type.value+'&p_inde='+lstInDe.value+'&p_version2='+lstOrig.value;
					System.OpenTargetPage( System.RootURL+url , "newform" ); 
				 }
				 else
				 {
					var url = '/reports/kp/bp/rpt_kpbp00100_contract_detail.aspx?p_project_pk='+txtProject_Pk.text+'&p_version='+lstChg.value+'&p_work='+lstWork_Breakdown.text+'&p_type='+lstData_Type.value+'&p_inde='+lstInDe.value+'&p_version2='+lstOrig.value;
					System.OpenTargetPage( System.RootURL+url , "newform" ); 
				 }				                              
            /*url += "/system/ReportEngine.aspx?export_pdf=Y&file=kp/bp/kpbp00100_cont" + lstData_Type.value + txtVersionUnitType.text + ".rpt&procedure=ec111.sp_rpt_kpbp00100&parameter=" + txtProject_Pk.text+","+ lstChg.value+",ALL,"+lstData_Type.value+","+lstInDe.value+","+lstOrig.value;
		    System.OpenTargetPage(url);*/
            break;
        case "1":
				/*var url = '/reports/kp/bp/rpt_kpbp00100_contract_sum_up.aspx?p_project_pk='+ txtProject_Pk.text + '&p_version=' + lstChg.value + '&p_work=' + lstWork_Breakdown.text+ '&p_type=' + lstData_Type.value +'&p_inde=' + lstInDe.value+'&p_version2=' + lstOrig.value;
					System.OpenTargetPage( System.RootURL+url , "newform" );*/
						var url = '/reports/kp/bp/rpt_kpbp00100_contract_detail_3.aspx?p_project_pk='+ txtProject_Pk.text + '&p_version=' + lstChg.value + '&p_work=' + lstWork_Breakdown.text+ '&p_type=' + lstData_Type.value +'&p_inde=' + lstInDe.value+'&p_version2=' + lstOrig.value;
					System.OpenTargetPage( System.RootURL+url , "newform" );    
		 break;			
        case "2":
            url += "/system/ReportEngine.aspx?export_pdf=Y&file=kp/bp/kpbp00100_cont1" + txtVersionUnitType.text + ".rpt&procedure=ec111.sp_rpt_kpbp00100&parameter=" + txtProject_Pk.text+","+ lstChg.value+",ALL,"+lstData_Type.value+","+lstInDe.value+","+lstOrig.value;
		    System.OpenTargetPage(url);
         break;
        case "3":
            /*if(lstChg.value == lstOrig.value){alert("Chg. version same Orig. version"); return false;}
			url += "/system/ReportEngine.aspx?export_pdf=Y&file=kp/bp/kpbp00100_org_cont.rpt&procedure=ec111.sp_rpt_kpbp00100&parameter=" + txtProject_Pk.text+","+ lstChg.value+",ALL,"+lstData_Type.value+","+lstInDe.value+","+lstOrig.value;
		    System.OpenTargetPage(url);*/
			var url = '/reports/kp/bp/rpt_kpbp00100_org_chg_detail.aspx?p_project_pk='+ txtProject_Pk.text + '&p_version=' + lstChg.value + '&p_work=' + lstWork_Breakdown.text+ '&p_type=' + lstData_Type.value +'&p_inde=' + lstInDe.value+'&p_version2=' + lstOrig.value;
					System.OpenTargetPage( System.RootURL+url , "newform" );   
            break;
        case "4":
			var url = '/reports/kp/bp/rpt_kpbp00100_org_chg_sum_up_detai.aspx?p_project_pk='+ txtProject_Pk.text + '&p_version=' + lstChg.value + '&p_work=' + lstWork_Breakdown.text+ '&p_type=' + lstData_Type.value +'&p_inde=' + lstInDe.value+'&p_version2=' + lstOrig.value;
					System.OpenTargetPage( System.RootURL+url , "newform" );   
		break;
        case "5":
            if(lstChg.value == lstOrig.value){alert("Chg. version same Orig. version"); return false;}
            url += "/system/ReportEngine.aspx?export_pdf=Y&file=kp/bp/kpbp00100_org_summ.rpt&procedure=ec111.sp_rpt_kpbp00100&parameter=" + txtProject_Pk.text+","+ lstChg.value+",ALL,"+lstData_Type.value+","+lstInDe.value+","+lstOrig.value;
		    System.OpenTargetPage(url);
		break;
    }
}
</script>
<body>
<gw:data id="dso_Search" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="grid"  function="pm_sel_61030050" >
      <input bind="Grid_Search">
        <input bind="txtProject_Pk"/> 
        <input bind="lstChg"/>
        <input bind="lstWork_Breakdown"/>
        <input bind="lstData_Type"/>
        <input bind="lstInDe"/>
        <input bind="lstOrig"/>
      </input>
      <output bind="Grid_Search"/>
    </dso>
  </xml>
</gw:data>

<gw:data id="dso_Chg" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="2" type="list" procedure="pm_pro_61030050"> 
            <input> 
                <input bind="txtProject_Pk" />
            </input>
	       <output>
	            <output bind="lstChg" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dso_Orig" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="2" type="list" procedure="pm_pro_61030050"> 
            <input> 
                <input bind="txtProject_Pk" />
            </input>
	       <output>
	            <output bind="lstOrig" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>

<table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
  <tr style="height:4%">
    <td>
    <fieldset>
        <table style="width:100%" border="0">
          <tr>
            <td align="right" width="9%"><a title="Click here to show Project" href="#" style="text-decoration : none" onClick="OnPopUp('Project')">*PJT</a></td>
            <td width="17%">
                <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
                <gw:textbox id="txtVersionUnitType" styles='width:100%;display:none' />
            </td>
            <td width="33%" style="padding-left:5px">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                      <td width="90%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                      <td style="padding-left:5px"><gw:imgbtn id="btve2" img="reset" alt="Reset"  onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                    </tr>
                </table>
            </td>
            <td align="right" width="5%"><a title="Click here to show Work" href="#" style="text-decoration : none" onClick="OnPopUp('Work_Breakdown')">*W.Div</a></td>
            <td width="15%" align="left"><gw:textbox id="lstWork_Breakdown" styles="width:100%;" onchange="OnSearch()" /></td>
            <td width="5%" align="right" style="padding-left:5px" id="lbChg"><a title="Serial No" style="color:#333">*S/No.</a></td>
            <td width="15%" align="left"><gw:list id="lstChg"  styles="width:100%;" onchange="OnSearch()" /></td>
            <td width="15%" align="left">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                      <td style="padding-left:5px" ><gw:imgBtn id="ibtnUpdte" img="search" alt="Search" 	onclick="OnSearch()" 	 /></td>
                      <td style="padding-left:5px" ><gw:imgBtn id="ibUpde" img="excel" alt="Print" 	onclick="OnExcel()" 	 /></td>
                    </tr>
                </table>
            </td>
          </tr>
          <tr>
            <td align="right">*Description</td>
            <td align="left"><gw:list id="lstData_Type" onchange="lstInDe.value='ALL'; dso_Search.Call('SELECT');"  styles="width:100%;" /></td>
            <td colspan = "1" align="left">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td id="slCol">
                            <gw:checkbox id="cbLevelCode" defaultvalue="Y|N" value="Y" onclick="OnShowGrid(this);"  /> Level Code
                            <gw:checkbox id="cbStd" defaultvalue="Y|N" value="Y"  onclick="OnShowGrid(this);" /><a title="Standard" style="color:#333"> Std.</a>
                            <gw:checkbox id="cbUnit" defaultvalue="Y|N" value="Y"  onclick="OnShowGrid(this);" /> Unit
                            <gw:checkbox id="cbOther" defaultvalue="Y|N" value="Y" onclick="OnShowGrid(this);" />
                            <span id="lbUnitPrice"><a title="Raw Material/Labor/Equipment" style="color:#333">Raw Mtrl/Labor/E</a></span>
                        </td>
                    </tr>
                </table>                
            </td>
            <td align="right" style="padding-left:5px" id="lbInDe"><a title="Increase/Decrease" style="color:#333">*Incr./Decr.</a></td>
            <td><gw:list id="lstInDe"  styles="width:100%;" onchange="OnSearch()" /></td>
            <td align="right" style="padding-left:5px" id="lbOrig"><a title="Original" style="color:#333">*Orig.</a></td>
            <td><gw:list id="lstOrig"  styles="width:100%;" onchange="OnSearch()" /></td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </fieldset>
      </td>
  </tr>
  <tr style="height:96%">
    <td colspan="8" style="padding-top:5px">
  
     <gw:grid   
        id      ="Grid_Search"  
        header  ="Work Name|Field|Standard|UOM|Currency|Quantity|Material_Unit|Material_Amt|Labor_Unit|Labor_Amt|Equipment_Unit|Equipment_Amt|_Unit_Price|Sum|Sum/Main Contract Amount (%)|_unitcost_mgmyn
                |_COL2_Key_Material_Amt|_COL2_Key_Labor_Amt|_COL2_Key_Equipment_Amt|_COL2_Key_Exp_Amt|_COL2_Key_Amt|_COL2_Corp_Material_Amt|_COL2_Corp_Labor_Amt|_COL2_Corp_Equipment_Amt|_COL2_Corp_Exp_Amt|_COL2_Corp_Amt|_Sort_Col
                |_COL3_Orig_Qty|_COL3_Orig_Price|_COL3_Orig_Amt|_COL3_Chg_Qty|_COL3_Chg_Price|_COL3_Chg_Amt|_COL3_InDe_Qty|_COL3_InDe_Price|_COL3_InDe_Amt
                |_COL4_Orig_Key|_COL4_Chg_Key|_COL4_InDe_Key|_COL4_Orig_Corp|_COL4_Chg_Corp|_COL4_InDe_Corp"
        format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
        aligns  ="0|1|0|1|1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"  
        defaults="|||||||||||||||||||||||||||||||||||||||||"  
        editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
        widths  ="3000|1200|1500|1000|1000|1000|2000|2000|2000|2000|2000|2000|2000|2000|2250|1000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|0|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000"  
        styles  ="width:100%; height:100%;"   
        sorting ="T" 
     />
     </td>
  </tr>
</table>
</body>
</html>