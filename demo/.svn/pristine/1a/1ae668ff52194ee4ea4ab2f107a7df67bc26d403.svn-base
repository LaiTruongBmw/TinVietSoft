<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Work Division Entry</title>
</head>
<%  ESysLib.SetUser("ec111")%>

<script language="javascript">
function BodyInit()
{
	System.Translate(document);
	MerGrid();
}
//============================================================================================
function OnNew()
{
	Grid_WorkDivision.AddRow();
}

//============================================================================================
function MerGrid()
{
        if (idGrid.rows < 2)
		{
			
			idGrid.AddRow();
		}
	var fg=idGrid.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5

		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Description"
		
        fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Level Work Type"
	
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Outside Order Work Type"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 3, 0, 7) = "Main Contract"  
		fg.Cell(0, 1, 3, 1) 	= "Currency"
		fg.Cell(0, 1, 4, 1 ) 	= "Material Cost"
		fg.Cell(0, 1, 5, 1) 	= "Labor Cost"
		fg.Cell(0, 1, 6, 1) 	= "Expenses"
		fg.Cell(0, 1, 7, 1) 	= "Amount"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 8, 0, 12) = "Budget"  
		fg.Cell(0, 1, 8, 1) 	= "Currency"
		fg.Cell(0, 1, 9, 1 ) 	= "Material Cost"
		fg.Cell(0, 1, 10, 1) 	= "Labor Cost"
		fg.Cell(0, 1, 11, 1) 	= "Expenses"
		fg.Cell(0, 1, 12, 1) 	= "Amount"

		
		
}
//============================================================================================
function OnDelete()
{
	Grid_WorkDivision.DeleteRow();	
}
//============================================================================================
function OnSearch()
{
	MerGrid();
}
//============================================================================================
function OnSave()
{
	dso_WorkDivision.Call();
}
//============================================================================================

</script>

<body>
    <table style="width: 100%; height: 100%">
        <tr style="height: 4%">
            <td align="right" width="10%">
                Project</td>
            <td width="15%">
                <gw:textbox id="txtProjectCode" styles='width:100%' />
            </td>
            <td width="40%">
                <gw:textbox id="txtProjectName" styles='width:100%' />
            </td>
            <td style="white-space: nowrap; width: 5%">
                Budget No
            </td>
            <td style="width: 30%">
                <gw:list id="lstBudget" styles='width:100%' />
            </td>
            <td>
                <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 4%">
            <td align="right" width="10%" style="white-space:nowrap">
                Inquiry Type</td>
            <td width="10%" colspan="2">
                <gw:list id="lstInquiryType" styles='width:70%' />
            </td>
        </tr>
        <tr style="height: 96%">
            <td width="100%" colspan="6">
                <gw:grid id="idGrid" header="Description|Level Work Type|Outside Order Work Type|Currency|Material Cost|Labor Cost|Expenses|Amount|Currency|Material Cost|Labor Cost|Expenses|Amount"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="||||||||||||" editcol="0|1|1|1|1|1|1|1|1|1|1|1|1" widths="1700|1700|1800|1800|2400|2300|1000|1000|1000|1000|1000|1000|1000"
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnDblClick()" />
            </td>
        </tr>
    </table>
</body>
</html>
