<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Entry Main Contract Detail</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
var PROJECT_PK = 0,
       TECPS_UNDERTAKECTRTBASC_PK  = 1,
       LEVEL = 2,
       CONTRACT_DETAIL_NO = 3,
       LEVEL_CODE = 4,
       DETAIL_SEQ_NO = 5,
       FIELD = 6,
       NAME = 7,
       STANDARD = 8,
       UNIT = 9,
       CURRENCY = 10,
       O_QTY = 11,
       O_MTRL_UP = 12,
       O_MTRL_AMT = 13,
       O_LABOR_UP = 14,
       O_LABOR_AMT = 15,
       O_EXPENSE_UP = 16,
       O_EXPENSE_AMT = 17,
       O_TOTAL_UP = 18,
       O_TOTAL_AMT = 19,
       LEVEL_PK = 20,
       INTERGRATED_YN = 21,
       VERSION = 22,
       PK = 23,
       C_QTY = 24,
       C_MTRL_UP = 25,
       C_MTRL_AMT = 26,
       C_LABOR_UP = 27,
       C_LABOR_AMT = 28,
       C_EXPENSE_UP = 29,
       C_EXPENSE_AMT = 30,
       C_TOTAL_UP = 31,
       C_TOTAL_AMT = 32,
       ID_QTY = 33,
       ID_AMT = 34,
       B_MTRL_UP = 35,
       B_MTRL_AMT = 36,
       B_LABOR_UP = 37,
       B_LABOR_AMT = 38,
       B_EXPENSE_UP = 39,
       B_EXPENSE_AMT = 40,
       B_TOTAL_UP = 41,
       B_TOTAL_AMT = 42
       ;
function BodyInit()
{
    var vendor = document.all("updating_info"); 
      vendor.style.display = "none";
      imgup.src = "../../../system/images/down.gif";
	var ls_company = "<%=ESysLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if=0")%>";
	lstCOMPANY.SetDataText(ls_company);
	lstCOMPANY.value = "<%=session("company_pk") %>";
    BindingDataList();
	System.Translate(document);
	MergeHeader();
	FormatGrid();
	Grid_Detail.GetGridControl().FrozenCols = 9;

}
//-------------------------------------------------------------------------------------------------------------------------------------
function BindingDataList()
{
            
	//Level
	<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 2,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB052' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; 
	//Ccy
	<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 10,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>; 
	//Remark YN
	//<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 8,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'TPS0022' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; 
	//Category
	<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 6,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'TPS0018' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; 
	var ls_Level = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACAB052') FROM DUAL")%>|ALL|All Level"; 
	lstLevel.SetDataText(ls_Level); 
	lstLevel.value = "ALL"; 
	//UOM
	data = "<%=ESysLib.SetGridColumnDataSQL("select a.UOM_CODE, decode(nvl(a.cnv_ratio,1),1,'',to_char(nvl(a.cnv_ratio,1),'9,990'))|| ' ' || a.UOM_NM  from tco_uom a where del_if=0" ) %> "; 
	Grid_Detail.SetComboFormat(9,data);
	var ls_Version = "<%=ESysLib.SetListDataSQL("select pk, UNDERTAKECHANGESEQ from tecps_undertakectrtbasc where del_if = 0 and CONFIRMYN = 'Y'")%>";
	//lstVersion.SetDataText(ls_Version);
	ls_Category = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0018') FROM DUAL")%>|ALL|--Select All--";
	lstField.SetDataText(ls_Category);
	lstField.value = 'ALL';
	var ls_Filter = "DATA|F|Filter";
	lstSearch.SetDataText(ls_Filter);
   var	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
   var arr  = data.split("|");
   txtbookccy.SetDataText(arr[1]);
//   var ls_ccy          = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
//	txtccy.SetDataText(ls_ccy);
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Work_Breakdown':
                            var path = System.RootURL + '/form/kp/bp/kpbp00050Work_Breakdown.aspx?Project_Pk=' + txtProject_Pk.text;
		                    var obj = System.OpenModal( path ,600 , 600 , 'resizable:yes;status:yes');
		                    if ( obj != null )
		                    {
									lstWork_Breakdown.SetDataText(obj[2]);
									txtWork_Breakdown_Nm.text = obj[1];
                            }
                break;
                case 'Project':
                            var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
									
									dso_version.Call();
                            } 
                break;
                case 'Filter':
                
                break;
                case 'Version':
                                        var fpath = System.RootURL + "/form/kp/bp/kpbp00020_popup_Version.aspx?Project_Pk=" + txtProject_Pk.text;
                                        var aValue = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                                        if(aValue != null)
                                        {
                                                lstVersion.value = aValue[0];
                                        } 
                break;
				case 'Category':
							var path = System.RootURL + '/form/gf/os/gfos00070_popup_1.aspx?code=TPS0018';
							var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
							 if (object != null )
							 {
								 lstCategory.SetDataText(object[1]);
							 }
				break;
        }
}  
//-------------------------------------------------------------------------------------------------------------------------------------
function OnEntryLevelCode()
{
    var path = System.RootURL + '/form/kp/bp/kpbp00050_popup_level.aspx';
	var aValue = System.OpenModal( path ,1024 , 500 , 'resizable:yes;status:yes');
}   
//-------------------------------------------------------------------------------------------------------------------------------------
function OnNew()
{
            if(txtProject_Pk.text == '' )
            {
                    alert('Please select Project !!');
            } 
            else
            {
              
                var _ccy= '';
                  if(Grid_Top.rows==2)
                  {
                       _ccy =  Grid_Top.GetGridData(Grid_Top.rows-1,0);
                  }
                  else if(Grid_Top.rows==1)
                  {
                    _ccy='USD';
                  }
                  else if(Grid_Top.rows>2)
                  {
                    _ccy='USD';//_ccy =  Grid_Top.GetGridData(Grid_Top.row,0);
                  }
					 var path = System.RootURL + '/form/kp/bp/kpbp00050Work_Breakdown_1.aspx?Project_Pk=' + txtProject_Pk.text;
					 var aValue = System.OpenModal( path ,900 , 500 , 'resizable:yes;status:yes');
					 if(aValue != null)
					 {
						 	var tmp = new Array();
							tmp = aValue[0]; 
		                    txtLevel_pk.text = tmp[2]; 
		                    if(!CheckDuplicateLevel())
		                    {                                       
		                        return;
		                    } 
		                    else
		                    {
											for(var i=0; i<aValue.length; i++)
											{ 
													
														tmp = aValue[i];
														Grid_Detail.AddRow();
														SetBackColor();
														Grid_Detail.SetGridText(Grid_Detail.rows - 1, 2, tmp[3]);  //level
														Grid_Detail.SetGridText(Grid_Detail.rows - 1, 4, tmp[0]); //code
														Grid_Detail.SetGridText(Grid_Detail.rows - 1, 7, tmp[1]); //name
														Grid_Detail.SetGridText(Grid_Detail.rows - 1, 20, tmp[2]); //pk 
														Grid_Detail.SetGridText(Grid_Detail.rows - 1, 0, txtProject_Pk.text); //pk  
														Grid_Detail.SetGridText(Grid_Detail.rows - 1, 1, lstVersion.value); //version pk  
														Grid_Detail.SetGridText(Grid_Detail.rows - 1, 3, i ); 
														Grid_Detail.SetGridText(Grid_Detail.rows - 1, 22, lstVersion.GetText()); //version pk  
                                                        Grid_Detail.SetGridText(Grid_Detail.rows - 1, 10, _ccy); //version pk  
											}
										
											if(lstField.value != 'ALL')
											{
														Grid_Detail.SetGridText(Grid_Detail.rows - 1, 6, lstField.value); //version pk  
											}
											else
											{return;}
						    }  
					}
                    
           } 
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnEditLevel()
{
	
	if(event.col=='4' || event.col=='7')
	{
		var path = System.RootURL + '/form/kp/bp/kpbp00050Work_Breakdown.aspx?Project_Pk=' + txtProject_Pk.text;
					 var aValue = System.OpenModal( path ,900 , 500 , 'resizable:yes;status:yes');
					 if(aValue != null)
					 {
		                    txtLevel_pk.text = aValue[2]; 
		                    if(!CheckDuplicateLevel())
		                    {                                       
		                        return;
		                    } 
		                    else
		                    {
											Grid_Detail.SetGridText(Grid_Detail.row, 2, aValue[3]);  //level
											Grid_Detail.SetGridText(Grid_Detail.row, 4, aValue[0]); //code
											Grid_Detail.SetGridText(Grid_Detail.row, 7, aValue[1]); //name
											Grid_Detail.SetGridText(Grid_Detail.row, 20, aValue[2]); //pk 
											Grid_Detail.SetGridText(Grid_Detail.row, 0, txtProject_Pk.text); //pk  
											Grid_Detail.SetGridText(Grid_Detail.row, 1, lstVersion.value); //version pk  
											if(lstField.value != 'ALL')
											{
												Grid_Detail.SetGridText(Grid_Detail.row, 6, lstField.value); //version pk  
											}
											else
											{return;}
						    }  
					 }
	}
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function CheckDuplicateLevel()
{
    for(var i = 1; i < Grid_Detail.rows; i++)
    {
        if(Grid_Detail.GetGridData(i, 20) == txtLevel_pk.text)
        {
             alert("Duplicated Level Code!! ");
             return false ;
        }
    }
    return true;
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
		if(txtProject_Pk.text != '')
		{
			
        	dso_Update.Call("SELECT");
		}
		else
		{
				alert('Please select a project to search !!');	
		}
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function MergeHeader()
{
        var fg=Grid_Detail.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Detail.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 11, 0, 19)  = "Contract (Original)"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 11, 1, 11) = "Quantity"
	    fg.Cell(0, 1, 12, 1, 12) = "Raw Mtrl. Cost U/P" 
		fg.Cell(0, 1, 13, 1, 13) = "Raw Mtrl. Amt" 
		fg.Cell(0, 1, 14, 1, 14) = "Labor Cost U/P" 
		fg.Cell(0, 1, 15, 1, 15) = "Labor Amt" 
		fg.Cell(0, 1, 16, 1, 16) = "Expense U/P" 
		fg.Cell(0, 1, 17, 1, 17) = "Expense Amt" 
		fg.Cell(0, 1, 18, 1, 18) = "Unit Price" 
		fg.Cell(0, 1, 19, 1, 19) = "Amount" 
		
		fg.Cell(0, 0, 24, 0, 32)  = "Contract (Changed)"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 24, 1, 24) = "Quantity"
	    fg.Cell(0, 1, 25, 1, 25) = "Raw Mtrl. Cost U/P" 
		fg.Cell(0, 1, 26, 1, 26) = "Raw Mtrl. Amt" 
		fg.Cell(0, 1, 27, 1, 27) = "Labor Cost U/P" 
		fg.Cell(0, 1, 28, 1, 28) = "Labor Amt" 
		fg.Cell(0, 1, 29, 1, 29) = "Expense U/P" 
		fg.Cell(0, 1, 30, 1, 30) = "Expense Amt" 
		fg.Cell(0, 1, 31, 1, 31) = "Unit Price" 
		fg.Cell(0, 1, 32, 1, 32) = "Amount" 
	   
	   fg.Cell(0, 0, 33, 0, 34)  = "Increase/Decrease" 
	   fg.Cell(0, 1, 33, 1, 33) = "Quantity"
	    fg.Cell(0, 1, 34, 1, 34) = "Amount" 
	   
	    fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Level"	
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Contract Detail No."	
	    fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "Level Code"	
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "Detail Seq No."	
		fg.MergeCol(6) = true
		fg.Cell(0, 0, 6, 1, 6) = "Field"	
		fg.MergeCol(7) = true
		fg.Cell(0, 0, 7, 1, 7) = "Name"
		fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 1, 8) = "Standard"
		fg.MergeCol(9) = true
		fg.Cell(0, 0, 9, 1, 9) = "Unit"
		fg.MergeCol(10) = true
		fg.Cell(0, 0, 10, 1, 10) = "Currency"
}
/**/
function OnCheckSum()
{
    var i=0;
    var j = 0;
    var _total_book_amt = 0;
    var _total_grid_bk = 0;
    var _total_grid_tr = 0;
    //=======================================================================
    /*
    if(Grid_Detail.rows>2)
    {
        for(i=2;i<Grid_Detail.rows;i++)
        {
            _total_grid_tr += Number(Grid_Detail.GetGridData(i,32));
            _total_grid_bk += Number(Grid_Detail.GetGridData(i,42));
        }
    }
    //=======================================================================

    //=======================================================================
    if(Grid_Top.rows==2)
    {
        if(_total_grid_tr> Number(Grid_Top.GetGridData(Grid_Top.rows-1,5)))
        {
            alert('Contract Amount can not be large than Trans. Amount !!');
            return true;
        }
        return false;
    }
    else if(Grid_Top.rows>2)
    {
        for(j=1;j<Grid_Top.rows;j++)
        {
            _total_book_amt += Number(Grid_Top.GetGridData(j,5));
        }
        if(_total_grid_bk > _total_book_amt )
        {
            alert('Contract amount can not be large than Book Amount !!');
            return true;
        }
        return false;
    }
    /**/
    if(Number(txtBalance.text)<0)
    {
        alert('Contract Amount can not be large than Trans. Amount !!');
        return true;
    }
    return false;
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSave()
{
		Grid_Detail.SetRowStatus(1, 'Search');
		    dso_Update.Call();
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDelete()
{
		if(confirm('Are you sure you want to delete ?'))
        Grid_Detail.DeleteRow();
		OnSave();
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnUnDelete()
{
        Grid_Detail.UnDeleteRow();

}
function CalcBalane()
{
    var i=0;
    var _Sum_ContAmt = 0;
    var _Trans_Amt = 0;
    var _Balance = 0;
    var _Sum_BookAmt_Top = 0;
    var j=0;                
    
    
    if(Grid_Detail.rows>2)
    {
        for(i=2;i<Grid_Detail.rows;i++)
        {
            _Sum_ContAmt += Math.round(Number(Grid_Detail.GetGridData(i,32)));
        }
    }
    txtContAmt_Total.text = _Sum_ContAmt;
    if(Grid_Top.rows==2)
    {
        _Trans_Amt = Number(Grid_Top.GetGridData(Grid_Top.rows-1, 2));
        _Balance = Math.round(_Trans_Amt - _Sum_ContAmt);
    }
    else if(Grid_Top.rows>2)
    {
        for(j=1;j<Grid_Top.rows;j++)
        {
            _Sum_BookAmt_Top += Math.round(Number(Grid_Top.GetGridData(j,5)));
        }
        _Balance = Math.round(_Sum_BookAmt_Top - _Sum_ContAmt);
    }
    txtBalance.text = _Balance;
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
         switch(obj.id)
         {
                case "dso_Update":
						MergeHeader();
						FormatGrid();
                        CalcBalane();
                       dso_Intergrated_YN.Call(); 
                break;
				case "dso_copy":
							dso_Update.Call("SELECT");
							alert(txtReturnValue.text);
				break;
             	case "dso_version":
						dso_top.Call("SELECT");
				break;
                case 'dso_top':
                    var vendor = document.all("updating_info"); 
                    if(Grid_Top.rows>1)
                    {
                        vendor.style.display = "";
                        imgup.src = "../../../system/images/up.gif";
                    }
                    else
                    {
                        vendor.style.display = "none";
                        imgup.src = "../../../system/images/down.gif";
                    }
                    dso_Intergrated_YN.Call();
                break;
				case "dso_Intergrated_YN":
                
						 var fg=Grid_Detail.GetGridControl(); 	
                         	if(txtIntergrated_YN.text == 'Y')
							{
									fg.ColHidden(11) = true; //Labor Unit Cost
									fg.ColHidden(12) = true; //Labor Amt
									fg.ColHidden(13) = true; //Cost Unit Cost
									fg.ColHidden(14) = true; //Cost Amt
									fg.ColHidden(15) = true; //Material Unit Cost
									fg.ColHidden(16) = true; //Material Amt
									fg.ColHidden(17) = true; //Material Unit Cost
									fg.ColHidden(18) = true; //Material Amt
									fg.ColHidden(19) = true; //Material Amt
									//fg.ColHidden(24) = true; //Cost Amt
									fg.ColHidden(25) = true; //Material Unit Cost
									fg.ColHidden(26) = true; //Material Amt
									fg.ColHidden(27) = true; //Material Unit Cost
									fg.ColHidden(28) = true; //Material Amt
									fg.ColHidden(29) = true; //Material Amt
									fg.ColHidden(30) = true; //Material Amt
							}
							else
							{
									fg.ColHidden(10) = false; //Labor Unit Cost
									fg.ColHidden(11) = false; //Labor Unit Cost
									fg.ColHidden(12) = false; //Labor Amt
									fg.ColHidden(13) = false; //Cost Unit Cost
									fg.ColHidden(14) = false; //Cost Amt
									fg.ColHidden(15) = false; //Material Unit Cost
									fg.ColHidden(16) = false; //Material Amt
									fg.ColHidden(17) = false; //Material Unit Cost
									fg.ColHidden(18) = false; //Material Amt
									fg.ColHidden(19) = false; //Material Amt
									//fg.ColHidden(24) = false; //Cost Amt
									fg.ColHidden(25) = false; //Material Unit Cost
									fg.ColHidden(26) = false; //Material Amt
									fg.ColHidden(27) = false; //Material Unit Cost
									fg.ColHidden(28) = false; //Material Amt
									fg.ColHidden(29) = false; //Material Amt
									fg.ColHidden(30) = false; //Material Amt
							}
							SetBackColor();
							dso_get_book_rate.Call();
				break;
				case "dso_Delete":
						dso_Update.Call("SELECT");
						alert(txtReturnValue.text);
				break;
         }
}


//-------------------------------------------------------------------------------------------------------------------------------------
function SetBackColor()
{
		var fg=Grid_Detail.GetGridControl(); 	
		for (i = 2; i < fg.Rows; i++)
		{
					Grid_Detail.SetCellBgColor(i,11,i, 19, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,26,i, 26, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,28,i, 28, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,30,i, 30, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,32,i, 32, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,33,i, 34, 0xEDEDED);
		}
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
 function OnShowHide(obj)
 {
	 		var fg=Grid_Detail.GetGridControl(); 	
	 		switch(obj)
			{
				case 1:
						if(cbLevelCode.value == 'N')
						{
								fg.ColHidden(4) = true; //Level Code
						}
						else
						{
								fg.ColHidden(4) = false; //Level Code
						}
				break;
				case 2:
						if(cbStd.value == 'N')
						{
								fg.ColHidden(8) = true; //Standard
						}
						else
						{
								fg.ColHidden(8) = false; //Standard
						}
				break;
				case 3:
						if(cbUnit.value == 'N')
						{
								fg.ColHidden(9) = true; //Unit
						}
						else
						{
								fg.ColHidden(9) = false; //Unit
						}
				break;
				case 4:
						if(cbRaw.value == 'N')
						{
								fg.ColHidden(13) = true;
								fg.ColHidden(15) = true;
								fg.ColHidden(17) = true;
								fg.ColHidden(26) = true;
								fg.ColHidden(28) = true;
								fg.ColHidden(30) = true;
						}
						else
						{
								fg.ColHidden(13) = false;
								fg.ColHidden(15) = false;
								fg.ColHidden(17) = false;
								fg.ColHidden(26) = false;
								fg.ColHidden(28) = false;
								fg.ColHidden(30) = false;
						}
				break;
				case 5:
						if(cbCompared.value == 'N')
						{
								
								fg.ColHidden(11) = true;
								fg.ColHidden(12) = true;
								fg.ColHidden(13) = true;
								fg.ColHidden(14) = true;
								fg.ColHidden(15) = true;
								fg.ColHidden(16) = true;
								fg.ColHidden(17) = true;
								fg.ColHidden(18) = true;
								fg.ColHidden(19) = true;
								fg.ColHidden(33) = true;
								fg.ColHidden(34) = true;
						}
						else
						{
								
								fg.ColHidden(11) = false;
								fg.ColHidden(12) = false;
								fg.ColHidden(13) = false;
								fg.ColHidden(14) = false;
								fg.ColHidden(15) = false;
								fg.ColHidden(16) = false;
								fg.ColHidden(17) = false;
								fg.ColHidden(18) = false;
								fg.ColHidden(19) = false;
								fg.ColHidden(33) = false;
								fg.ColHidden(34) = false;
						}
				break;
			}
 }
//-------------------------------------------------------------------------------------------------------------------------------------
function OnCalculator()
{
	   
		var c_qty = Number(Grid_Detail.GetGridData(Grid_Detail.row, C_QTY));
        var c_MUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, C_MTRL_UP));
        var c_LUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, C_LABOR_UP));
        var c_EUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, C_EXPENSE_UP));
		
//		var _Bk_MUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, 35));
//        var _Bk_LUP =  Number(Grid_Detail.GetGridData(Grid_Detail.row, 37));
//        var _Bk_EUP =  Number(Grid_Detail.GetGridData(Grid_Detail.row, 39));
		var c_UP = Number(Grid_Detail.GetGridData(Grid_Detail.row, C_TOTAL_UP));
		var c_Material_Amt = 0;
		var _Bk_Material_UP = 0;
		var _Bk_Material_Amt = 0;
		
		var c_Labor_Amt = 0;
		var _Bk_Labor_UP= 0;
		var _Bk_Labor_Amt = 0;
		
		var c_Equipment_Amt = 0;
		var _Bk_Equipment_UP = 0;
		var _Bk_Equipment_Amt = 0;
		
		var c_Sum_UnitPrice = 0;
		var c_Amount = 0;
		var _Amount1 = 0;
		var _Amount_bk = 0;
		var _Amount_bk1 = 0;
		var _Bk_Sum_UnitPrice = 0;
		var _Bk_Sum_UnitPrice1 = 0;
        var _UP=0;
		if (c_qty == '') c_qty = 0;
		if (_Bk_Equipment_UP == '') _Bk_Equipment_UP = 0;			
		
		    c_Material_Amt = Number(c_qty) * Number(c_MUP);
			c_Labor_Amt = Number(c_qty * c_LUP); 
			c_Equipment_Amt = Number(c_qty * c_EUP);
			c_Sum_UnitPrice = Number(c_MUP) + Number(c_LUP) + Number(c_EUP);
			c_Amount = Number( c_Material_Amt + c_Labor_Amt + c_Equipment_Amt);
			_Amount1 = Number(c_qty * c_UP);
	//==========tinh tien book===========================
		var _book_rate = Number(txtBookRate.text);
		var tr_rate = Number(txtTR_RATE.text);
		lstCcy.text = Grid_Detail.GetGridData(event.row, 10);
		if(txtbookccy.text == 'VND' && _book_rate > 0)
		{
				if(Grid_Detail.GetGridData(event.row, 10) == 'USD')
				{
						OnGetRate();
						 _Bk_Material_UP = Math.round(c_MUP * tr_rate);
						_Bk_Material_Amt = Math.round(c_Material_Amt * tr_rate);
						_Bk_Labor_UP = Math.round(c_LUP * tr_rate);
						_Bk_Labor_Amt = Math.round(c_Labor_Amt * tr_rate);
						_Bk_Equipment_UP = Math.round(c_EUP * tr_rate);
						_Bk_Equipment_Amt = Math.round(c_Equipment_Amt * tr_rate);
						_Bk_Sum_UnitPrice = Math.round(c_Sum_UnitPrice * tr_rate);
						_Amount_bk1 = Math.round(_Amount1 * tr_rate);
						_Amount_bk = Math.round(c_Amount * tr_rate);
						_UP = Math.round(c_UP * tr_rate);
				}
				else if(lstCcy.text == 'VND')
				{
						_Bk_Material_UP = c_MUP ;
						_Bk_Material_Amt = c_Material_Amt;
						_Bk_Labor_UP = c_LUP ;
						_Bk_Labor_Amt = c_Labor_Amt ;
						_Bk_Equipment_UP = c_EUP ;
						_Bk_Equipment_Amt = c_Equipment_Amt;
						_Bk_Sum_UnitPrice = c_Sum_UnitPrice ;
						_Amount_bk1 = _Amount1 ;
						_Amount_bk = c_Amount;
						_UP = c_UP ;
				}
                else
                {
                        OnGetRate();
                        _Bk_Material_UP = Math.round(c_MUP * tr_rate);
						_Bk_Material_Amt = Math.round(c_Material_Amt * tr_rate);
						_Bk_Labor_UP = Math.round(c_LUP * tr_rate);
						_Bk_Labor_Amt = Math.round(c_Labor_Amt * tr_rate);
						_Bk_Equipment_UP = Math.round(c_EUP * tr_rate);
						_Bk_Equipment_Amt = Math.round(c_Equipment_Amt * tr_rate);
						_Bk_Sum_UnitPrice = Math.round(c_Sum_UnitPrice * tr_rate);
						_Amount_bk1 = Math.round(_Amount1 * tr_rate);
						_Amount_bk = Math.round(c_Amount * tr_rate);
						_UP = Math.round(c_UP * tr_rate);
                }
		}  
		else if(txtbookccy.text == 'USD' && _book_rate > 0)
		{
				if(lstCcy.text == 'USD')
				{
							_Bk_Material_UP = c_MUP ;
						_Bk_Material_Amt = c_Material_Amt;
						_Bk_Labor_UP = c_LUP ;
						_Bk_Labor_Amt = c_Labor_Amt ;
						_Bk_Equipment_UP = c_EUP ;
						_Bk_Equipment_Amt = c_Equipment_Amt;
						_Bk_Sum_UnitPrice = c_Sum_UnitPrice ;
						_Amount_bk1 = _Amount1 ;
						_Amount_bk = c_Amount;
						_UP = c_UP ;
				}
				else if(lstCcy.text == 'VND')
				{
				       
						_Bk_Material_UP = c_MUP / _book_rate ;
						_Bk_Material_Amt = c_Material_Amt / _book_rate ;
						_Bk_Labor_UP = c_LUP  / _book_rate ;
						_Bk_Labor_Amt = c_Labor_Amt  / _book_rate;
						_Bk_Equipment_UP = c_EUP / _book_rate ;
						_Bk_Equipment_Amt = c_Equipment_Amt / _book_rate;
						_Bk_Sum_UnitPrice = c_Sum_UnitPrice / _book_rate;
						_Amount_bk1 = _Amount1 / _book_rate ;
						_Amount_bk = c_Amount / _book_rate ;
						_UP = c_UP  / _book_rate ;
				}
                else
                {
                    OnGetRate();
					_Bk_Material_UP =  c_MUP *  tr_rate / _book_rate ;
						_Bk_Material_Amt = c_Material_Amt  *  tr_rate / _book_rate ;
						_Bk_Labor_UP = c_LUP  *  tr_rate  / _book_rate ;
						_Bk_Labor_Amt = c_Labor_Amt   *  tr_rate / _book_rate ;
						_Bk_Equipment_UP = c_EUP   *  tr_rate / _book_rate;
						_Bk_Equipment_Amt = c_Equipment_Amt  *  tr_rate  / _book_rate ;
						_Bk_Sum_UnitPrice = c_Sum_UnitPrice  *  tr_rate  / _book_rate ;
						_Amount_bk1 = _Amount1  *  tr_rate  / _book_rate;
						_Amount_bk =  c_Amount   *  tr_rate / _book_rate ;
						_UP = c_UP   *  tr_rate  / _book_rate ;
                }
		}

		if(txtIntergrated_YN.text == 'N')
		{
				Grid_Detail.SetGridText(Grid_Detail.row, C_MTRL_AMT, c_Material_Amt);  
				Grid_Detail.SetGridText(Grid_Detail.row, C_LABOR_AMT, c_Labor_Amt); 
				Grid_Detail.SetGridText(Grid_Detail.row, C_EXPENSE_AMT, c_Equipment_Amt); 
				Grid_Detail.SetGridText(Grid_Detail.row, C_TOTAL_UP, c_Sum_UnitPrice);     
				Grid_Detail.SetGridText(Grid_Detail.row, C_TOTAL_AMT, c_Amount); 
				Grid_Detail.SetGridText(Grid_Detail.row, ID_QTY, c_qty); 
				Grid_Detail.SetGridText(Grid_Detail.row, ID_AMT, c_Amount); 
				
				Grid_Detail.SetGridText(Grid_Detail.row, B_MTRL_UP, _Bk_Material_UP);    
				Grid_Detail.SetGridText(Grid_Detail.row, B_MTRL_AMT, _Bk_Material_Amt);    
				Grid_Detail.SetGridText(Grid_Detail.row, B_LABOR_UP, _Bk_Labor_UP);    
				Grid_Detail.SetGridText(Grid_Detail.row, B_LABOR_AMT, _Bk_Labor_Amt);    
				Grid_Detail.SetGridText(Grid_Detail.row, B_EXPENSE_UP, _Bk_Equipment_UP);    
				Grid_Detail.SetGridText(Grid_Detail.row, B_EXPENSE_AMT, _Bk_Equipment_Amt);
				Grid_Detail.SetGridText(Grid_Detail.row, B_TOTAL_UP, _Bk_Sum_UnitPrice);    
				Grid_Detail.SetGridText(Grid_Detail.row, B_TOTAL_AMT, _Amount_bk);    	
		}
	 	else
		{
				Grid_Detail.SetGridText(Grid_Detail.row, C_TOTAL_AMT, _Amount1); 
				Grid_Detail.SetGridText(Grid_Detail.row, ID_QTY, c_qty); 
				Grid_Detail.SetGridText(Grid_Detail.row, ID_AMT, c_Amount); 
				Grid_Detail.SetGridText(Grid_Detail.row, B_TOTAL_UP, _UP);
				Grid_Detail.SetGridText(Grid_Detail.row, B_TOTAL_AMT, _Amount_bk1);    
		}
        CalcBalane();
}
//-------------------------------------------------------------------------------------------------------------------------------
function FormatGrid()
{ 
	var ctrl = Grid_Detail.GetGridControl();
	
	ctrl.ColFormat(11) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(12) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(13) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(14) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(15) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(16) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(17) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(18) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(19) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(20) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(21) = "#,###,###,###,###,###,###,###,###.##R";
	
	
	ctrl.ColFormat(22) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(23) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(24) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(25) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(26) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(27) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(28) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(29) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(30) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(31) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(32) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(33) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(34) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(35) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(36) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(37) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(38) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(39) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(40) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(41) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(42) = "#,###,###,###,###,###,###,###,###.##R";
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnPrint()
{
		if(txtProject_Pk.text != '')
		{
			var url = System.RootURL + "/reports/kp/bp/kpbp00050.aspx?Project_pk=" +txtProject_Pk.text + "&Work=" + lstWork_Breakdown.text + "&Field=" + lstField.value +  "&Version=" + lstVersion.value + "&Intergrated_YN=" + txtIntergrated_YN.text;
			 System.OpenTargetPage(url);       
		}
		else
		{
				alert('Please select Project !!');	
		}
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnCopy()
{
			dso_copy.Call();
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnGetRate()
{
		dso_get_trans_rate.Call();	
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDeleteAll()
{
		if(confirm("Are you sure you want to delete all data!!"))
		{
				dso_Delete.Call();
		} 
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnOriginal()
{
				if(lstVersion.GetText() == 0)
				{
						Grid_Detail.SetGridText(Grid_Detail.row, 11, Grid_Detail.GetGridData(Grid_Detail.row, 24));
						Grid_Detail.SetGridText(Grid_Detail.row, 12, Grid_Detail.GetGridData(Grid_Detail.row, 25));
						Grid_Detail.SetGridText(Grid_Detail.row, 13, Grid_Detail.GetGridData(Grid_Detail.row, 26));
						Grid_Detail.SetGridText(Grid_Detail.row, 14, Grid_Detail.GetGridData(Grid_Detail.row, 27));
						Grid_Detail.SetGridText(Grid_Detail.row, 15, Grid_Detail.GetGridData(Grid_Detail.row, 28));
						Grid_Detail.SetGridText(Grid_Detail.row, 16, Grid_Detail.GetGridData(Grid_Detail.row, 29));
						Grid_Detail.SetGridText(Grid_Detail.row, 17, Grid_Detail.GetGridData(Grid_Detail.row, 30));
						Grid_Detail.SetGridText(Grid_Detail.row, 18, Grid_Detail.GetGridData(Grid_Detail.row, 31));
						Grid_Detail.SetGridText(Grid_Detail.row, 19, Grid_Detail.GetGridData(Grid_Detail.row, 32));
				}
}

function OnShow() 
{
    var vendor = document.all("updating_info"); 
 
    if ( vendor.style.display == "none" )
    {
        vendor.style.display = "";
        imgup.src = "../../../system/images/up.gif";
    }
    else
    {
        vendor.style.display = "none";
        imgup.src = "../../../system/images/down.gif";
    }
}
</script>
<body>
    <gw:data id="dso_Update" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42" function="sp_sel_kpbp00050" procedure="sp_upd_kpbp00050">
                <input bind="Grid_Detail">
                    <input bind="txtProject_Pk"/>
                    <input bind="lstWork_Breakdown"/>
                    <input bind="lstField"/>
                    <input bind="lstVersion"/> 
                    <input bind="txtSearch"/>
                </input> 
                <output bind="Grid_Detail"/>
            </dso>
        </xml>
    </gw:data>
   
    <gw:data id="dso_get_book_rate" onreceive="">
        <xml> 
            <dso type="process" procedure="sp_pro_kpbp00050_getrate"> 
                <input> 
                	 <input bind="txtProject_Pk" />
                </input>
                <output>
                     <output bind="txtBookRate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_version" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="SP_PRO_SEL_kpbp00050" > 
            <input> 
                <input bind="txtProject_Pk" />
            </input>
	       <output>
	            <output bind="lstVersion" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dso_Intergrated_YN" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="process" procedure="SP_PRO_SEL_kpbp00050_2" > 
            <input> 
                <input bind="txtProject_Pk" />
                <input bind="lstVersion" />
            </input>
	       <output>
	            <output bind="txtIntergrated_YN" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dso_copy" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="process"   procedure="sp_Pro_kpbp00050_copy"  > 
                <input> 
                    <input bind="lstVersion" /> 
                    <input bind="txtProject_Pk" />
                 </input>
                 <output>
                    <output bind="txtReturnValue"/>
                 </output>
            </dso> 
        </xml> 
    </gw:data>
    
<gw:data id="dso_get_trans_rate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="sp_pro_kpbp00050_get_transrate" > 
                <input> 
                     <input bind="txtProject_Pk"/>
                     <input bind="lstCcy"/>
                </input>
                <output>
                     <output bind="txtTR_RATE"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>    
    
<gw:data id="dso_Delete" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="sp_Pro_kpbp00050_Delete" >
                <input> 
					<input bind="txtProject_Pk" />
                    <input bind="lstVersion" />             				 
                </input>  
                <output>
                     <output bind="txtReturnValue" />
				</output> 
            </dso> 
        </xml> 
    </gw:data>
    
<gw:data id="dso_top" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"  function="sp_sel_kpbp122"    > 
				<input bind="Grid_Top">                    
					<input bind="txtProject_Pk" /> 
				</input> 
				<output bind="Grid_Top" /> 
			</dso> 
		</xml> 
	</gw:data>
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
        <tr style="height: 6%">
            <td width="100%">
                <fieldset style="padding: 0">
                    <table cellpadding="1" cellspacing="1" width="100%">
                        <tr>
                            <td align="right" width="12%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">Project</a></td>
                            <td width="35%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="40%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                                        <td width="60%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                                        <td width=""><gw:textbox id="txtProject_Pk" styles='width:100%;display:none' /></td>
                                        <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" width="18%" style="display:">Version</td>
                            <td width="35%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="100%"><gw:list id="lstVersion" readonly="true" onchange="OnSearch()" styles="width:100%;" /></td> 
                                        
                                        
                                        <td><gw:imgbtn id="ibtnUpdte" img="search" alt="Search" onclick="OnSearch()" /></td>
                                        <td><gw:imgbtn id="ibnUpdte" img="copy" alt="Copy Version" onclick="OnCopy()" /></td>
                                        <td><gw:imgbtn id="ibnUpdte" img="create" alt="Entry Level Code" onclick="OnEntryLevelCode()" /></td>
                                        <td ><gw:imgbtn id="ibtUpdte" img="new" alt="New" onclick="OnNew()" /></td>
                                        <td><gw:imgbtn id="ibtnUpdate" img="save" alt="save" onclick="OnSave()" /></td>
                                        <td><gw:imgbtn id="ibUpdte" img="udelete" alt="UnDelete" onclick="OnUnDelete()" /></td>
                                        <td><gw:imgbtn id="ibUpde" img="delete" alt="Delete" onclick="OnDelete()" /></td>
                                        <td><gw:imgbtn id="ibUpde" img="deselectall" alt="Delete All" onclick="OnDeleteAll()" /></td>
                                        <td><gw:imgbtn id="ibUpde" img="excel" alt="Print" onclick="OnPrint()" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="display: ">
                            <td align="right"><a title="Click here to show Filter" href="#" style="text-decoration: none" onClick="OnPopUp('Category')">Field</a></td>
                            <td width=""><gw:list id="lstField" styles="width:100%;" /></td>
                            <td align="right" ><a title="Click here to show Work Division" href="#" style="text-decoration: none" onClick="OnPopUp('Work_Breakdown')">Work Division</a></td>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="100%"><gw:textbox id="txtWork_Breakdown_Nm" styles="width:100%;display:" /></td>
                                        <td width=""><gw:textbox id="lstWork_Breakdown" styles="width:100%;display:none" /></td>
                                        <td><gw:imgbtn id="ibtnUpdte" img="reset" alt="Reset" onclick="txtWork_Breakdown_Nm.text='';lstWork_Breakdown.text='';" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                        	<td align="right"><a title="Column Selection"  style="text-decoration: none; color:#333" >Col. Sel.</a></td>
                            <td  colspan="3">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        	<td width="13%"><gw:checkbox id="cbLevelCode" defaultvalue="Y|N" value="Y" onclick="OnShowHide(1)"  /> Level Code</td>
                                            <td width="8%"><gw:checkbox id="cbStd" defaultvalue="Y|N" value="Y"  onclick="OnShowHide(2)" /><a title="Standard" style="color:#333">Std.</a></td>
                                            <td width="8%"><gw:checkbox id="cbUnit" defaultvalue="Y|N" value="Y"  onclick="OnShowHide(3)" /> Unit</td>
                                            <td width="20%"><gw:checkbox id="cbRaw" defaultvalue="Y|N" value="Y"  onclick="OnShowHide(4)" /><a title="Raw Material/Labor/Equipment" style="color:#333">Raw Mtrl/Labor/E</a></td>
                                            <td width="20%"><gw:checkbox id="cbCompared" defaultvalue="Y|N" value="Y"  onclick="OnShowHide(5)" /><a title="Compared with Original" style="color:#333">Compared w/ Ori</a></td>
                                            <td width="14%"><gw:list id="lstSearch"  onchange="" styles="width:100%;" /></td> 
                                            <td width="1%"></td>
                                            <td width="16%"><gw:textbox id="txtSearch"  onenterkey="OnSearch()"  styles="width:100%;" /></td> 
                                            <td  ><gw:imgbtn id="ibtnUpdte" img="search" alt="Search" onclick="OnSearch()" /></td>
                                    </tr>
                                </table>           
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr height="2%">
    <td width="100%" align="left"><img status="expand" id="imgup" src="../../../system/images/up.gif" style="cursor: hand;"  onclick="OnShow()" /></td>
</tr>
<tr height="20%" id="updating_info">
    <td width="100%">
        <gw:grid   
        id="Grid_Top"  
        header="Trans Ccy|Ex.Rate|Trans Amt|Book Ccy|Book Ex.Rate|Book Amt"   
        format  ="0|1|1|0|1|1"  
            aligns ="1|3|3|1|3|3"  
        defaults="|||||"  
        editcol ="0|0|0|0|0|0"  
        widths  ="1000|1500|3000|1000|1500|2000"  
        styles="width:100%; height:100%"   
        sorting="T" 
        onafteredit=""  
        oncellclick="" 
        /> 
    </td>        
</tr>
        <tr style="height: 72%" id="top">
            <td colspan="" style="background-color:">
                <!-- header="0._Project_pk|1._TECPS_UNDERTAKECTRTBASC_PK|2.Level|3.Field|4.Name|5.Standard|6.Unit|7.Currency|8.Quantity|9.Raw Mtrl. Cost U/P|10.Raw Mtrl.|11.Labor Cost U/P|12.Labor Amt|13.Expense U/P|14.Expense|15.Unit Price|16.Amount|17._Level_pk|18._Intergrated_YN|19._Version|20._ccy|21._pk|22.Book_Raw Mtrl. Cost U/P|23.Book_Raw Mtrl. Amt|24.Book_Labor Cost U/P|25.Book_Labor Amt|26.Book_Expense U/P|27.Book_Expense Amt|28.Book_Unit Price|29.Book_Amount-->
                <!--header="0._Project_pk|1._TECPS_UNDERTAKECTRTBASC_PK|2.Level|3.Contract Detail No|4.Level Code|5.Detail Seq No.|6.Field|7.Name|8.Standard|9.Unit|10.Quantity|11.Raw Mtrl. Cost U/P|12.Raw Mtrl. Amt|13.Labor Cost U/P|14.Labor Amt|15.Expense U/P|16.Expense Amt|17.Unit Price|18.Amount|19._Level_pk|20._Intergrated_YN|21._Version|22._pk|23.Quantity|24.Raw Mtrl. Cost U/P|25.Raw Mtrl. Amt|26.Labor Cost U/P|27.Labor Amt|28.Expense U/P|29.Expense Amt|30.Unit Price|31.Amount|32.Quantity|33.Amount|34._Book_Raw Mtrl. Cost U/P|35._Book_Raw Mtrl. Amt|36._Book_Labor Cost U/P|37._Book_Labor Amt|38._Book_Expense U/P|39._Book_Expense Amt|40._Book_Unit Price|41._Book_Amount"-->
                <gw:grid id="Grid_Detail" 
                header="_0.Project_pk|_1.TECPS_UNDERTAKECTRTBASC_PK|2.Level|3.Contract Detail No|4.Level Code|5.Detail Seq No.|6.Field|7.Name|8.Standard|9.Currency|10.Unit|11.Quantity|12.Raw Mtrl. Cost U/P|13.Raw Mtrl. Amt|14.Labor Cost U/P|15.Labor Amt|16.Expense U/P|17.Expense Amt|18.Unit Price|19.Amount|_20.Level_pk|_21.Intergrated_YN|_22.Version|_23.pk|24.Quantity|25.Raw Mtrl. Cost U/P|26.Raw Mtrl. Amt|27.Labor Cost U/P|28.Labor Amt|29.Expense U/P|30.Expense Amt|31.Unit Price|32.Amount|33.Quantity|34.Amount|_35.Book_Raw Mtrl. Cost U/P|_36.Book_Raw Mtrl. Amt|_37.Book_Labor Cost U/P|_38.Book_Labor Amt|_39.Book_Expense U/P|_40.Book_Expense Amt|_41.Book_Unit Price|_42.Book_Amount|_43.book_exrate"
                   format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    aligns="0|0|0|0|0|2|0|0|0|0|1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|0"
                    defaults="||||||C|||||||||||||||||||||||||||||||||||||"
                   editcol="0|0|0|0|0|1|1|0|1|1|1|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|0|1|0|1|0|1|1|0|0|1|1|1|1|1|1|1|1|0"
                    widths="0|0|1000|2000|1500|1500|1500|2500|1500|1500|900|2000|2000|2000|2000|2000|2000|2000|2000|2000|0|0|0|0|0|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|0|0|0|0|0|0|0|0"
                    styles="width:100%; height:100%" sorting="T" 
                    onafteredit="OnCalculator()" 
                    oncelldblclick="OnEditLevel()" />
            </td>
        </tr>
        <tr style="height:2%">
        <td>
                <table width="100%" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse" border="1">
                    <tr style="background:#C5EFF1">
                        <td align="right" width="50%">Contract Amount Total&nbsp;</td>
                        <td width="20%"><gw:textbox id="txtContAmt_Total" readonly="true" styles='width:100%' type="number" format="###,###.##R" /></td>
                        <td align="right" width="10%">Balance&nbsp;</td>
                        <td width="20%"><gw:textbox id="txtBalance" readonly="true" styles='width:100%' type="number" format="###,###.##R" /></td>
                    </tr>
                </table>
        </td>
  </tr>
        <tr style="height: 1%; display:none ">
            <td>
                <fieldset style="padding: 0">
                    <table style="width: 100%" cellpadding="0" cellspacing="0">
                        <tr style="background-color: White">
                            <td width="50%">
                            </td>
                            <td>
                                <img status="expand" id="imgArrow" src="../../../system/images/down.gif" style="cursor: hand;"
                                    onclick="OnToggle()" /></td>
                            <td align="right" width="40%">
                                Level&nbsp;</td>
                            <td width="10%">
                                <gw:list id="lstLevel" onchange="OnSearch()" styles="width:100%;" />
                            </td>
                            <td style="display: none">
                                <gw:datebox id="txtUSE_DATE" lang="1" styles='width:100%;display:none' />
                            </td>
                            <td style="display: none">
                                <gw:textbox id="txt_row" styles='display:none' />
                            </td>
                            <td style="display:none ">
                                 
                                
          <gw:textbox id="txtBK_RATE"  styles='width:100%;display:none' />
          <gw:list id="txtccy" onchange="OnGetRate()" styles='width:100%;display:none' />
                            </td>
                            <td style="display: none">
                                <gw:list id="lstCOMPANY" styles='width:100%;display:none' />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
       
    </table>
    <gw:textbox id="txtLevel_pk" styles='width:100%;display:none' />
    <gw:textbox id="txtbookccy" styles='width:100%;display:none' />
      <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
      <gw:textbox id="txtIntergrated_YN" styles='width:100%;display:none' />
          <gw:textbox id="txtBookRate" styles='width:100%;display:none' />
          <gw:textbox id="txtTR_RATE" styles="width:100%;display:none" />
         <gw:textbox id="lstCcy" styles="width:100%;display:none" /> 
          
</body>
</html>
