<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
<title>Upload Contract Detail</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>

function BodyInit()
{
	System.Translate(document);
    var vendor = document.all("updating_info"); 
      vendor.style.display = "none";
      imgup.src = "../../../system/images/down.gif";
    BindingDataList();
}
//-------------------------------------------------------------------------------------------------------------------------------------
function BindingDataList()
{
            /*
			<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 1,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB052' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; 
			data = "<%=ESysLib.SetGridColumnDataSQL("select a.UOM_CODE, decode(nvl(a.cnv_ratio,1),1,'',to_char(nvl(a.cnv_ratio,1),'9,990'))|| ' ' || a.UOM_NM  from tco_uom a where del_if=0" ) %> "; 
     		Grid_Detail.SetComboFormat(9,data);
			var ls_Version = "<%=ESysLib.SetListDataSQL("select pk, UNDERTAKECHANGESEQ from tecps_undertakectrtbasc where del_if = 0 and CONFIRMYN = 'Y'")%>";
			//lstVersion.SetDataText(ls_Version);
			<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 6,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>; 
			var ls_company = "<%=ESysLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if=0")%>";
			lstCOMPANY.SetDataText(ls_company);
			lstCOMPANY.value = "<%=session("company_pk") %>";
			var	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
		   var arr  = data.split("|");
		   txtbookccy.SetDataText(arr[1]);
		   var ls_ccy          = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
			txtccy.SetDataText(ls_ccy);
            ls_Category = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0018') FROM DUAL")%>|ALL|--Select All--";
	        lstField.SetDataText(ls_Category);
            lstField.value = 'ALL';
		*/
}
function OnGetRate()
{
		dso_get_trans_rate.Call();	
}
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Project':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
									dso_version.Call();
                            } 
                break;
                
                case 'Work_Division':
                            var fpath = System.RootURL + "/form/61/30/61030030Work_Breakdown.aspx?Project_Pk=" + txtProject_Pk.text;
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtWorkDivision_Pk.text = aValue[2];
                                    txtWorkDivision_Cd.text = aValue[0];
                                    txtWorkDivision_Nm.text = aValue[1];  
                            } 
                break;
        } 
}
function clearFileInputField(tagId) 
{
			document.getElementById(tagId).innerHTML = document.getElementById(tagId).innerHTML;
}

//-------------------------------------------------------------------------------------------------------------------------------------
function OnUpload()
{
		
		if(txtProject_Pk.text == '' || lstVersion.value == '')
		{
				alert('Please select Version  & Project !!');
		}
		else
		{
	           var fl = document.getElementById("idtext").value; 
                var excel = new ActiveXObject("Excel.Application");
                var excel_file  = excel.Workbooks.Open(fl);
                
                var excel_sheet = excel.Worksheets("Sheet1");
                var maxRow    = excel.Worksheets("Sheet1").UsedRange.Rows.Count
                var lrow, lcol, data
                for(lrow = 2; lrow <= maxRow ; lrow++) 
                {
                    Grid_Detail.AddRow();
                    for ( lcol = 1; lcol < Grid_Detail.cols; lcol++ )
                    {
                        data = excel_sheet.Cells( lrow, lcol ).Value; 
                        Grid_Detail.SetGridText(Grid_Detail.rows-1, lcol -1, data);
                    }    
                    Grid_Detail.SetGridText(Grid_Detail.rows-1, 20, lstVersion.value);
					Grid_Detail.SetGridText(Grid_Detail.rows-1, 22, txtProject_Pk.text); 
                    if(lstField.value=='ALL')
                    {
                        Grid_Detail.SetGridText(Grid_Detail.rows-1, 31, 'C');
                    }
                    else
                    {
                        Grid_Detail.SetGridText(Grid_Detail.rows-1, 31, lstField.value);
                    }
                }
		}
		clearFileInputField('uploadFile_div');
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnDownload()
{
        var url =System.RootURL + "/form/61/03/61030020_download.aspx?Project_Pk=" + txtProject_Pk.text;
	    System.OpenTargetPage( url , 'newform' );
} 
//-------------------------------------------------------------------------------------------------------------------------------------
function OnCalculator()
{
        var Quantity = Number(Grid_Detail.GetGridData(Grid_Detail.row, 10));
        var MaterialUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, 11));
        var LaborUP =  Number(Grid_Detail.GetGridData(Grid_Detail.row, 13));
        var ExpUP =  Number(Grid_Detail.GetGridData(Grid_Detail.row, 15));

		var B_MaterialUP = 0;
        var B_LaborUP =  0;
        var B_ExpUP =  0;
       
     /*  while(_ContractQuantity.indexOf(",") != -1)
       {
            _ContractQuantity =  _ContractQuantity.replace(",", ""); 
       } 
       while(_MaterialUnitPrice.indexOf(",") != -1)
       {
            _MaterialUnitPrice =  _MaterialUnitPrice.replace(",", ""); 
       }
       while(_LaborUnitPrice.indexOf(",") != -1)
       {
            _LaborUnitPrice =  _LaborUnitPrice.replace(",", ""); 
       }  
       while(_ExpensesUnitPrice.indexOf(",") != -1)
       {
            _ExpensesUnitPrice =  _ExpensesUnitPrice.replace(",", ""); 
       }  */
        var Material_Cost = 0;
        var Labor_Cost = 0; 
        var Expense_Cost = 0; 
        var TotalCost = 0 
		var Sum_UP = 0

		var B_Material_Cost = 0;
        var B_Labor_Cost = 0; 
        var B_Expense_Cost = 0; 
        var B_TotalCost = 0 
		var B_Sum_UP = 0

        Material_Cost = Quantity * MaterialUP;
        Labor_Cost = Quantity * LaborUP; 
        Expense_Cost = Quantity * ExpUP; 
		Sum_UP = MaterialUP + LaborUP + ExpUP;
        TotalCost = Material_Cost + Labor_Cost + Expense_Cost; 

		var ccy = Grid_Detail.GetGridData(Grid_Detail.row, 6);		
		var _book_rate = Number(txtBookRate.text);
		txtccy.value = ccy;
		var tr_rate = Number(txtTR_RATE.text);
	
		Grid_Detail.SetGridText(Grid_Detail.row, 12, Material_Cost);     
        Grid_Detail.SetGridText(Grid_Detail.row, 14, Labor_Cost);  
        Grid_Detail.SetGridText(Grid_Detail.row, 16, Expense_Cost);    
        Grid_Detail.SetGridText(Grid_Detail.row, 17, Sum_UP);     
        Grid_Detail.SetGridText(Grid_Detail.row, 18, TotalCost);      

		Grid_Detail.SetGridText(Grid_Detail.row, 23, B_MaterialUP);    
		Grid_Detail.SetGridText(Grid_Detail.row, 24, B_Material_Cost);  
		Grid_Detail.SetGridText(Grid_Detail.row, 25, B_LaborUP);  
        Grid_Detail.SetGridText(Grid_Detail.row, 26, B_Labor_Cost);  
		Grid_Detail.SetGridText(Grid_Detail.row, 27, B_ExpUP);   
        Grid_Detail.SetGridText(Grid_Detail.row, 28, B_Expense_Cost);    
        Grid_Detail.SetGridText(Grid_Detail.row, 29, B_Sum_UP);     
        Grid_Detail.SetGridText(Grid_Detail.row, 30, B_TotalCost);      
        CalcBalane();
}

function OnCheckSum()
{
    var i=0;
    var j = 0;
    var _total_book_amt = 0;
    var _total_grid_bk = 0;
    var _total_grid_tr = 0;
   
    if(Number(txtBalance.text)<0)
    {
        alert('Contract Amount can not be large than Trans. Amount !!');
        return true;
    }
    return false;
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnSave()
{	
	if(!OnCheckSum())
	{
		dso_Update.Call();
	}
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnDelete()
{
	if(confirm('Are you sure you want to delete !!'))
    Grid_Detail.DeleteRow();
    dso_Update.Call();
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
		if(txtProject_Pk.text != '')
		{
        		dso_Update.Call("SELECT");
		}
		else
		{
				alert('Please select Project !!');	
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
		fg.Cell(0, 0, 10, 0, 13)  = "Unit Price "   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 10, 1, 10) = "Material"
	    fg.Cell(0, 1, 11, 1, 11) = "Labor" 
		fg.Cell(0, 1, 12, 1, 12) = "Equipment" 
		fg.Cell(0, 1, 13, 1, 13) = "Sum" 
	   
	    fg.Cell(0, 0, 14, 0, 16)  = "Amount"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 14, 1, 14) = "Material Cost"
	    fg.Cell(0, 1, 15, 1, 15) = "Labor Cost"  
		fg.Cell(0, 1, 16, 1, 16) = "Equipment Unit Amount"  
	    
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Seq"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Level"	
	    fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Level Code"	
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Work Code"	
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "Work Seq"	
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "Leaf Y/N"
		fg.MergeCol(6) = true
		fg.Cell(0, 0, 6, 1, 6) = "Work Name"	
		fg.MergeCol(7) = true
		fg.Cell(0, 0, 7, 1, 7) = "Specification"	
		fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 1, 8) = "UOM"	
		fg.MergeCol(9) = true
		fg.Cell(0, 0, 9, 1, 9) = "Main Contract Quantity"	
		fg.MergeCol(17) = true
		fg.Cell(0, 0, 17, 1, 17) = "Sum"	
}
//-------------------------------------------------------------------------------
function format_number(dec, fix) 
{
	fixValue = parseFloat(Math.pow(10,fix));
	rtn_value = parseInt(Math.round(dec * fixValue)) / fixValue;	
	return rtn_value ;
}
//---------------------------------------------------------------------------------
function CalcBalane()
{
    var i=0;
    var _Sum_ContAmt = 0;
    var _Trans_Amt = 0;
    var _Balance = 0;
    var _Sum_BookAmt_Top = 0;                
    
    if(Grid_Detail.rows>1)
    {
        for(i=1;i<Grid_Detail.rows;i++)
        {
            _Sum_ContAmt +=Number(Grid_Detail.GetGridData(i,18));
        }
    }
    txtContAmt_Total.text = _Sum_ContAmt;
    if(Grid_Top.rows==2)
    {
        _Trans_Amt = Number(Grid_Top.GetGridData(Grid_Top.rows-1, 2));
        _Balance = _Trans_Amt - _Sum_ContAmt;
    }
    else if(Grid_Top.rows>2)
    {
        for(j=1;j<Grid_Top.rows;j++)
        {
            _Sum_BookAmt_Top += Number(Grid_Top.GetGridData(j,5));
        }
        _Balance = _Sum_BookAmt_Top - _Sum_ContAmt;
    }
    txtBalance.text = _Balance;
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
         switch(obj.id)
         {
                case "dso_version":
                    dso_top.Call('SELECT');
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
                    dso_get_book_rate.Call();
                break;
				case "dso_Update":
					clearFileInputField('uploadFile_div');
                    CalcBalane();
                break;
		 }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------
function FormatGrid()
{ 
	var ctrl = Grid_Detail.GetGridControl();
	
	ctrl.ColFormat(9) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(10) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(11) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(12) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(13) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(14) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(15) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(16) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(17) = "#,###,###,###,###,###,###,###,###.##R";
	
                           
                                    //ctrl.ColFormat(5) = "#,###,###,###,###,###,###,###,###.##R";
//                                    ctrl.ColFormat(7) = "#,###,###,###,###,###,###,###,###.##R";
//                                    ctrl.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R";
//                                    ctrl.ColFormat(9) = "#,###,###,###,###,###,###,###,###.##R";
                           
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnEntryLevelCode()
{
    return false;
    var path = System.RootURL + '/form/kp/bp/kpbp00050_popup_level.aspx';
	var aValue = System.OpenModal( path ,1024 , 500 , 'resizable:yes;status:yes');
}   
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnVerify()
{
	var i;
		for( i = 1; i<  Grid_Detail.rows; i++)
		{
				if(Trim(Grid_Detail.GetGridData(i, 1)) == '')
				{
						alert('Please input Level !!' + '\n' + 'At row ' + i );
						return  false;	
				}	
				else if(Trim(Grid_Detail.GetGridData(i, 2)) == '')
				{
						alert('Please input Level Code !!' + '\n' + 'At row ' + i );
						return  false;	
				}	
				else if(Trim(Grid_Detail.GetGridData(i, 3)) == '')
				{
						alert('Please input Detail Seq No. !!' + '\n' + 'At row ' + i );
						return  false;	
				}	
				else if(Trim(Grid_Detail.GetGridData(i, 4)) == '')
				{
						alert('Please input Contract Detail No. !!' + '\n' + 'At row ' + i );
						return  false;	
				}	
				else if(Trim(Grid_Detail.GetGridData(i, 6)) == '')
				{
						alert('Please input Currency !!' + '\n' + 'At row ' + i );
						return  false;	
				}	
				else if(Trim(Grid_Detail.GetGridData(i, 7)) == '')
				{
						alert('Please input Level Name !!' + '\n' + 'At row ' + i );
						return  false;	
				}	
		}
		alert('No error found !!');
		return true ;
}

function OnPrint()
{
	if(txtProject_Pk.text != '')
	{
	    var url = System.RootURL + "/reports/kp/bp/kpbp122.aspx?Level_Pk=" + txtWorkDivision_Pk.text + '&Project_Pk=' + txtProject_Pk.text + '&Field=' + lstField.value + '&Version=' + lstVersion.value + '&Confirm_YN=' + chkConfirm.value;
			System.OpenTargetPage(url);       
	}
	else
	{
			alert('Please select Project to print report !!');	
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
    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40" function="pm_sel_61030020" procedure="pm_upd_61030020">
      <input bind="Grid_Detail">
      <input bind="txtProject_Pk"/>
      <input bind="lstField"/>
      <input bind="txtWorkDivision_Pk"/>
      <input bind="lstVersion"/>
      <input bind="chkConfirm"/>
      </input>
      <output bind="Grid_Detail"/>
    </dso>
  </xml>
</gw:data>

 <gw:data id="dso_version" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="pm_pro_61030020" > 
            <input> 
                <input bind="txtProject_Pk" />
            </input>
	       <output>
	            <output bind="lstVersion" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>
   <gw:data id="dso_get_book_rate" onreceive="">
        <xml> 
            <dso type="process" procedure="pm_pro_61030020_getrate"> 
                <input> 
                	 <input bind="txtProject_Pk" />
                </input>
                <output>
                     <output bind="txtBookRate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<gw:data id="dso_get_trans_rate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_pro_61030020_get_transrate" > 
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

<gw:data id="dso_top" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"  function="pm_sel_61030020_122"> 
				<input bind="Grid_Top">                    
					<input bind="txtProject_Pk" /> 
				</input> 
				<output bind="Grid_Top" /> 
			</dso> 
		</xml> 
	</gw:data>

<table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
<tr style="height:4%">
    <td width="100%">
    <fieldset style="padding:0">
    <table cellpadding="1" cellspacing="1" width="100%">
        <tr>
        <td align="right" width="10%"><a title="Click here to show Project" href="#" style="text-decoration : none" onClick="OnPopUp('Project')">Project</a></td>
        <td width="30%"><table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="40%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                <td width="60%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                <td width=""><gw:textbox id="txtProject_Pk" styles='width:;display:none' /></td>
                <td ><gw:imgbtn id="btve2" img="reset" alt="Reset"  onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
            </tr>
            </table></td>
        <td width="10%" align="right">Upload</td>
        <td width="50%" >
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="100%">
                <div id="uploadFile_div">
					<input type="file" class="fieldMoz" id="idtext" onKeyDown="return false;" onChange="OnUpload()" style="width:100%;" name="uploadFile"/>
				</div>
                </td>
                <td ><gw:imgBtn id="ibtnUpdte" img="search" alt="Search" 	onclick="OnSearch()" 	 /></td>
                <td><gw:imgbtn id="ibnUpdte" img="create" alt="Create Level Code" onclick="OnEntryLevelCode()" style="display:none" /></td>
                <td ><gw:imgBtn id="ibtgnUpdate" img="verify" alt="Verify Data" 	onclick="OnVerify()" 	 /></td>
                <td ><gw:imgBtn id="ibtnUpdate" img="save" alt="save" 	onclick="OnSave()" 	 /></td>
                <td ><gw:imgBtn id="ibUpdte" img="udelete" alt="UnDelete" 	onclick="OnUnDelete()" 	 /></td>
                <td ><gw:imgBtn id="ibUpde" img="delete" alt="Delete" 	onclick="OnDelete()" 	 /></td>
                <td ><gw:imgBtn id="ibUprde" img="download" alt="Download Format" 	onclick="OnDownload()" 	 /></td>
                <td ><gw:imgBtn id="ibUprde" img="excel" alt="Print Report" 	onclick="OnPrint()" 	 /></td>
            </tr>
            </table></td>
        </tr>
        <tr>
        <td align="right"><a title="Click here to show Field" href="#" style="text-decoration: none" onClick="OnPopUp('Category')">Field</a></td>
        <td width=""><table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="45%"><gw:list id="lstField" styles="width:100%;" /></td>
                <td align="right" width="20%"><a title="Click here to show Version" href="#" style="text-decoration : none" onClick="OnPopUp('Version')">Version&nbsp;</a></td>
                <td width="35%"><gw:list id="lstVersion"  styles='width:100%' /></td>
                  
            </tr>
            </table>
        </td>
            
        <td align="right" width="16%"><a title="Click here to show Work" href="#" style="text-decoration : none" onClick="OnPopUp('Work_Division')">Work</a></td>    
        <td width="">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                      
                    <td width="25%"><gw:textbox id="txtWorkDivision_Cd" readonly="true" styles='width:100%' /></td>
                    <td width="47%"><gw:textbox id="txtWorkDivision_Nm" readonly="true" styles='width:100%' /></td>
                    <td width=""><gw:textbox id="txtWorkDivision_Pk" styles='width:100%;display:none' /></td>
                    <td ><gw:imgbtn id="btvge2" img="reset" alt="Reset"  onclick="txtWorkDivision_Cd.text='';txtWorkDivision_Nm.text='';txtWorkDivision_Pk.text='';" /></td>
                    <td align="right" width="28%">Confirm Y/N</td>
                    <td><gw:checkbox id="chkConfirm" value="Y" defaultvalue="Y|N"/></td>
                </tr>
            </table>
        </td>
        </tr>
    </table>
    </fieldset></td>
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
        editcol ="1|1|1|1|1|1"  
        widths  ="1000|1500|3000|1000|1500|2000"  
        styles="width:100%; height:100%"   
        sorting="T" 
        onafteredit="" 
        oncellclick="" 
        /> 
    </td>        
</tr>
  <tr style="height:72%" id="top">
    <td colspan="">
   <!-- header="0.Seq. No.|1.Level|2.Level Code|3.Dtals Seq. No.|4.Cont. Dtals No.|5.Dtals Description|6.Currency|7.Name|8.Standard|9.Unit|10.Contract Qty.|11.Raw Mtrl. Cost U/P|12.Raw Mtrl. Cost Amt|13.Labor Cost U/P|14.Labor Cost Amt|15.Exp. U/P|16.Exp. Amt|17.U/P|18.Cont. Amt|19._pk|20._version_pk|21._work_pk|22._project_pk|23._Boo_Raw Mtrl. Cost U/P|24._Book_Raw Mtrl. Cost Amt|25._Book_Labor Cost U/P|26._Book_Labor Cost Amt|27._Book_Exp. U/P|28._Book_Exp. Amt|29._Book_U/P|30._Book_Cont. Amt|31._Field"   -->
      <gw:grid   
                                                    id="Grid_Detail"  
                                                    header="Seq. No.|Level|Level Code|Dtals Seq. No.|Cont. Dtals No.|Dtals Description|Currency|Name|Standard|Unit|Contract Qty.|Raw Mtrl. Cost U/P|Raw Mtrl. Cost Amt|Labor Cost U/P|Labor Cost Amt|Exp. U/P|Exp. Amt|U/P|Cont. Amt|_pk|_version_pk|_work_pk|_project_pk|_Boo_Raw Mtrl. Cost U/P|_Book_Raw Mtrl. Cost Amt|_Book_Labor Cost U/P|_Book_Labor Cost Amt|_Book_Exp. U/P|_Book_Exp. Amt|_Book_U/P|_Book_Cont. Amt|_Field|_32.Qty|_33.Material Unit|_34.Material Amt|_35.Labor Unit|_36.Labor Amt|_37.Exp Unit|_38.Exp Amt|_39.Total Unit|_40.Total Amt"   
                                                    format  ="0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|0|0|0|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0"  
                                                     aligns ="1|1|0|0|0|0|1|0|0|1|3|3|3|3|3|3|3|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                                    defaults="|||||||||||||||||||||||||||||||||||||||"  
                                                    editcol ="1|1|1|1|1|1|1|1|1|1|1|1|0|1|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                                    widths  ="0|1500|2000|2000|2000|2000|1000|3000|2000|1500|2000|2000|2000|2200|2000|2000|2000|2000|2000|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                                    styles="width:100%; height:100%"   
                                                    sorting="T" 
                                                    onafteredit="OnCalculator()"   
                                                     /></td>
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
  <tr style="display:none">
		<td>
				<gw:datebox id="txtUSE_DATE" lang="1" styles='width:100%;display:none' />
				<gw:textbox id="txtBookRate" styles='width:100%;display:none' />
 <gw:textbox id="txtTR_RATE" styles="width:100%;display:none" />
 <gw:list id="lstCOMPANY" styles='width:100%;display:none' />
 <gw:list id="txtccy" onchange="OnGetRate()" styles='width:100%;display:none' />
 
 <gw:textbox id="txtBK_RATE"  styles='width:100%;display:none' />
 <gw:textbox id="txtbookccy" styles='width:100%;display:none' />
 <gw:textbox id="txt_row" styles='display:none' />
<gw:textbox id="lstCcy" styles="width:100%;display:none" />  
		</td>
  </tr>
</table>
 
</body>
</html>
