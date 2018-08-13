<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Divide Main Contract Detail</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
  System.Translate(document);
  MerGrid()
  
}
//-------------------------------------------
function OnSearch()
{
    
	
}
//-------------------------------------------
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
		fg.Cell(0, 0, 0, 1, 0) = "Budget Detail No"
		
        fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Detail Devision No"
	
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Detail Level Code"
		
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Detal Level Seq"
		
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "Work Item Name"
		
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "Specification"
		
		fg.MergeCol(6) = true
		fg.Cell(0, 0, 6, 1, 6) = "Main Contract Detail No"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 7, 0, 9) = "Main Contract"  
		fg.Cell(0, 1, 7, 1) 	= "UOM"
		fg.Cell(0, 1, 8, 1 ) 	= "Currency"
		fg.Cell(0, 1, 9, 1) 	= "Quantity"

		
		
}
//-------------------------------------------
function OnSelect()
{
    

    
}

</script>

<body>
    <!------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 5%">
            <td style="width: 85%">
            </td>
            <td style="width: 3%">
                <gw:imgbtn id="ibtnAdd" img="new" alt="New" />
            </td>
            <td style="width: 3%">
                <gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" />
            </td>
            <td style="width: 3%">
                <gw:imgbtn id="ibtnSearch" img="search" alt="Search" />
            </td>
            <td style="width: 3%">
                <gw:imgbtn id="ibtnSave" img="save" alt="Save" />
            </td>
            <td style="width: 3%">
                <gw:imgbtn id="ibtnCancel" img="cancel" alt="Close" />
            </td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%" colspan="6">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Main Contract Detail No</td>
                        <td style="width: 20%" align="center">
                            <gw:textbox id="txtMainContDetailNo" styles='width:100%' />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Work Item</td>
                        <td style="width: 20%" align="center">
                            <gw:textbox id="txtWorkItem" styles='width:100%' />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Specification</td>
                        <td style="width: 20%" align="center">
                            <gw:textbox id="txtSpec" styles='width:100%' />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Uom</td>
                        <td style="width: 20%" align="center">
                            <gw:textbox id="txtUom" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Main Contract Qty</td>
                        <td style="width: 20%" align="center">
                            <gw:textbox id="txtMainContQty" styles='width:100%' />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Material Unit Price
                        </td>
                        <td style="width: 20%" align="center">
                            <gw:textbox id="txtMaterialUPrice" styles='width:100%' />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Expense Unit Price</td>
                        <td style="width: 20%" align="center">
                            <gw:textbox id="txtExpensesUPrice" styles='width:100%' />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Main Contract Amount</td>
                        <td style="width: 20%" align="center">
                            <gw:textbox id="txtMainContAmt" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="8">
                            <gw:grid id="idGrid" header="Budget Detail No|Detail Division No|Detail Level Code|Detail Level Seq|Work Item Name|Specification|Main Contract Detail No|UOM|Currency|Quantity" 
                                format="0|0|0|0|0|0|0|0|0|0"
                                aligns="0|0|0|0|0|0|0|0|0|0" defaults="|||||||||" editcol="0|0|0|0|0|0|0|0|0|0" widths="1500|1600|1600|1500|1500|1500|2200|1200|1200|1000" styles="width:100%; height:100%"
                                sorting="T" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="iduser_pk" styles="display:none; " />
</body>
</html>
