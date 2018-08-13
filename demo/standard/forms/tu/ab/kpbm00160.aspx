<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Inquiry Budget Detail</title>
</head>
<%  ESysLib.SetUser("acnt")%>

<script>
var flag = true;
function BodyInit()
{
      System.Translate(document);
      MergeHeader();  
      
}
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
		
		fg.Cell(0, 0, 4, 0, 7)  = "Adjusted Main Contract"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 4, 1, 4) = "UOM"
	    fg.Cell(0, 1, 5, 1, 5) = "Quantity" 
		fg.Cell(0, 1, 6, 1, 6) = "Unit Price"
	    fg.Cell(0, 1, 7, 1, 7) = "Amount"
	    
		fg.Cell(0, 0, 8, 0, 14)  = "Adjusted Working Budget"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 8, 1, 8) = "UOM"
	    fg.Cell(0, 1, 9, 1, 9) = "Quantity" 
		fg.Cell(0, 1, 10, 1, 10) = "Material Unit Price"
	    fg.Cell(0, 1, 11, 1, 11) = "Labor Unit Price"
		fg.Cell(0, 1, 12, 1, 12) = "Expense Unit Price" 
		fg.Cell(0, 1, 13, 1, 13) = "Unit Price"
	    fg.Cell(0, 1, 14, 1, 14) = "Amount"
		
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Level"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Budget Detail No"	
	    fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Work Name"	
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Specification"	
		fg.MergeCol(15) = true
		fg.Cell(0, 0, 15, 1, 15) = "Direct Y/N"	
		fg.MergeCol(16) = true
		fg.Cell(0, 0, 16, 1, 16) = "Outside Order Work Code"	
		fg.MergeCol(17) = true
		fg.Cell(0, 0, 17, 1, 17) = "Budget Code"	
		fg.MergeCol(18) = true
		fg.Cell(0, 0, 18, 1, 18) = "Execution Description"	
		fg.MergeCol(19) = true
		fg.Cell(0, 0, 19, 1, 19) = "Standard Code"	
		fg.MergeCol(20) = true
		fg.Cell(0, 0, 20, 1, 20) = "Not included in the Basis of Legally allowed expenses"	
		fg.MergeCol(21) = true
		fg.Cell(0, 0, 21, 1, 21) = "Not Included in the basis of safety management"	
		fg.MergeCol(22) = true
		fg.Cell(0, 0, 22, 1, 22) = "Basis of Amount"	
} 
</script>

<body>
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
        <tr style="height: 5%">
            <td width="100%">
                <fieldset style="padding: 0">
                    <table cellpadding="1" cellspacing="1" width="100%">
                        <tr>
                            <td align="right" width="13%">
                                <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                    Project</a></td>
                            <td width="40%">
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
                            <td align="right" width="15%">
                                Contract Y/N</td>
                            <td width="32%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="100%">
                                            <gw:list id="lstContract_YN" styles='width:100%' />
                                        </td>
                                        
                                        <td>
                                            <gw:imgbtn id="ibtnUpdte" img="create" alt="Entry Detail Level Code" onclick="" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibtnUpdte" img="search" alt="Search" onclick="" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibUrpde" img="new" alt="New" onclick="" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibUrpde" img="save" alt="Save" onclick="" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibUrpde" img="delete" alt="Delete" onclick="" />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="ibUrpde" img="excel" alt="Print" onclick="" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="">
                                <a title="Click here to show Outside Order Work" href="#" style="text-decoration: none"
                                    onclick="OnPopUp('SubcontractWorkScope')">Outside Order Work</a></td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="40%">
                                            <gw:textbox id="txtOutside_Cd" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="60%">
                                            <gw:textbox id="txtOutside_Nm" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="">
                                            <gw:textbox id="txtOutside_Pk" styles='width:100%;display:none' />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="btrtve2" img="reset" alt="Reset" onclick="txtOutside_Cd.text='';txtOutside_Nm.text='';txtOutside_Pk.text='';" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" width="">
                                Budget Item</td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="50%">
                                            <gw:list id="lstBudget_Item" styles='width:100%' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="">
                                <a title="Click here to show Work" href="#" style="text-decoration: none"
                                    onclick="">Work</a></td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="40%">
                                            <gw:textbox id="txtWork_Cd" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="60%">
                                            <gw:textbox id="txtWork_Nm" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="">
                                            <gw:textbox id="txtWork_Pk" styles='width:100%;display:none' />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="bteve2" img="reset" alt="Reset" onclick="txtWork_Cd.text='';txtWork_Nm.text='';txtWork_Pk.text='';" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right">
                                <gw:checkbox id="chk" value="Y" defaultvalue="Y|N" />
                            </td>
                            <td>Excluding detail of which quantity is "0"</td>
                        </tr>
                        
                       
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 95%">
            <td colspan="4">
                <!--header="0.Level|1.Budget Detail No|2.Work Name|3.Specification|4.UOM|5.Quantity|6.Unit Price|7.Amount|8.UOM|9.Quantity|10.Material Unit Price|11.Labor Unit Price|12.Expense Unit Price|13.Unit Price|14.Amount|15.Direct Y/N|16.Outside Order Work Code|17.Budget Code|18.Execution Description|19.Standard Code|20.Not included in the Basis of Legally allowed expenses|21.Not Included in the basis of safety management|22.Basis of Amount"-->
                <gw:grid id="Grid_Mst" 
                	header="Level|Budget Detail No|Work Name|Specification|UOM|Quantity|Unit Price|Amount|UOM|Quantity|Material Unit Price|Labor Unit Price|Expense Unit Price|Unit Price|Amount|Direct Y/N|Outside Order Work Code|Budget Code|Execution Description|Standard Code|Not included in the Basis of Legally allowed expenses|Not Included in the basis of safety management|Basis of Amount"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    aligns="1|1|0|0|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="||||||||||||||||||||||" 
                    editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                    widths="1000|1500|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|1000|2500|1500|2500|1500|4600|4600|2000"
                    styles="width:100%; height:100%" sorting="T" />
            </td>
        </tr>
    </table>
</body>
</html>
