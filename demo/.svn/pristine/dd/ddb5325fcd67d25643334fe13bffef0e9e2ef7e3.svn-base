<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Project</title>
</head>
<%  ESysLib.SetUser("EC111")%>
<script>
function BodyInit()
{
        System.Translate(document);
	    MergeHeader();
		Grid_Mst.GetGridControl().FrozenCols = 3;
}  
//============================================================================================
function MergeHeader()
{
        var fg=Grid_Mst.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Mst.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 5, 0, 8)  = "Working(Orginal)(A)"   
	    fg.Cell(0, 1, 5, 1, 5) = "Unit"
	    fg.Cell(0, 1, 6, 1, 6) = "Qty" 
		fg.Cell(0, 1, 7, 1, 7) = "Price" 
	    fg.Cell(0, 1, 8, 1, 8) = "Amt"
		
		fg.Cell(0, 0, 10, 0, 13)  = "Working(Orginal)(B)"   
	    fg.Cell(0, 1, 10, 1, 10) = "Unit"
	    fg.Cell(0, 1, 11, 1, 11) = "Qty" 
		fg.Cell(0, 1, 12, 1, 12) = "Price" 
	    fg.Cell(0, 1, 13, 1, 13) = "Amt"
	    
		fg.Cell(0, 0, 16, 0, 19)  = "Working(Orginal)(D)"   
	    fg.Cell(0, 1, 16, 1, 16) = "Unit"
	    fg.Cell(0, 1, 17, 1, 17) = "Qty" 
		fg.Cell(0, 1, 18, 1, 18) = "Price" 
	    fg.Cell(0, 1, 19, 1, 19) = "Amt"
		
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "pk"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Budget Item Code"	
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Budget Item Name"	
	    fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Expense Name"	
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "Currency"
		fg.MergeCol(9) = true
		fg.Cell(0, 0, 9, 1, 9) = "A.Result Amt(B)"
		fg.MergeCol(14) = true
		fg.Cell(0, 0, 14, 1, 14) = "A.Result Amt(B)"
		fg.MergeCol(15) = true
		fg.Cell(0, 0, 15, 1, 15) = "Working Balance(C=A-B)"
		fg.MergeCol(20) = true
		fg.Cell(0, 0, 20, 1, 20) = "Increase/Decrease(E=D-A)"
		fg.MergeCol(21) = true
		fg.Cell(0, 0, 21, 1, 21) = "Execution(Y/N)"
		fg.MergeCol(22) = true
		fg.Cell(0, 0, 22, 1, 22) = "Calculation Basis"
		
} 
//============================================================================================
function OnPopUp(obj)
{
        switch(obj)
        {
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
		}
}
</script>
<body>
 
    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height:2%;width:100%">
                        <td>
                            <fieldset style="width:100%;padding:0">
                                <table  style="width: 100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                        <td align="right" width="10%">
                                                            <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                                                Project&nbsp;</a></td>
                                                        <td width="50%">
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="40%">
                                                                        <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                                                    </td>
                                                                    <td width="60%">
                                                                        <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                                                    </td>
                                                                    <td width="">
                                                                        <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
                                                                    </td>
                                                                    <td>
                                                                        <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="40%"></td>
                                                        <td ><gw:imgbtn id="btSve2" img="copy" alt="Copy Standard Expenses"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="Search"  onclick="OnSearch()" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="new" alt="New"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="save" alt="Save"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="delete" alt="Delete"  onclick="" /></td>
                                            </tr>           
                                </table>
                            </fieldset>
                        </td>
                    </tr>
					<tr style="height: 2%">
						<td>
							<table  cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="9%" align="right">Total&nbsp;</td>
									<td width="43%"><gw:list id="lstTotal" styles='width:100%' /></td>
									<td width="18%" align="right">Budget Statement No&nbsp;</td>
									<td width="30%"><gw:list id="lstStatementNo" styles='width:100%' /></td>
								</tr>
							</table>
						</td>
					</tr>
                    <tr style="height: 96%">
                       <td width="100%">
                       					<!--header="0.Budget Item Code|1.Budget Item Name|2.Expense Name|3.UOM|4.Quantity|5.Unit Price|6.Amount|7.Head Office/Site|8.Formula"   -->  
								                    <gw:grid 
													            id="Grid_Mst"  
													            header="_pk|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22"   
													            format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
													            aligns   ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
													            defaults="|||||||||||||||||||||"  
													            editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
													            widths  ="2000|2500|2500|2000|1500|1500|1500|1500|1500|2000|1500|1500|1500|1500|2000|2400|1500|1500|1500|1500|2600|1500|1600"  
													            styles="width:100%; height:100%"   
													            sorting="T"   
													            oncelldblclick= "DblClick()" /> 
										        </td>
                    </tr>
                </table>
</body>
</html>
