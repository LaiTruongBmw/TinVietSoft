<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Data Checklist</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
  System.Translate(document);
  MerGrid();
  
}
//-------------------------------------------
function OnSearch()
{
    
	
}
//-------------------------------------------
function MerGrid()
{

        idGrid.AddRow();
        idGrid.AddRow();
        
	    var fg=idGrid.GetGridControl();
		fg.FixedRows = 3
		fg.MergeCells = 5

		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 2, 0) = "Error Type"
		
        fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 2, 1) = "Main Contract Detail No"
	
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 2, 2) = "Budget Detail No"
		
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 2, 3) = "Detail Division No"
		
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 2, 4) = "Detail Level Code"
		
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 2, 5) = "Detail Level Seq"
		
		fg.MergeCol(6) = true
		fg.Cell(0, 0, 6, 2, 6) = "Work Item Name"
		
		fg.MergeCol(7) = true
		fg.Cell(0, 0, 7, 2, 7) = "Specification"
		
		fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 2, 8) = "UOM"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 9, 0, 14) = "Main Contract"  
		
		fg.MergeCol(9) = true
		fg.Cell(0, 1, 9, 2, 9) 	= "Qty"
		
		fg.MergeRow(1) = true
		fg.Cell(0, 1, 10, 1, 12) = "Unit Price"  
		fg.Cell(0, 2, 10, 2 ) 	= "Material"
		fg.Cell(0, 2, 11, 2) 	= "Labor"
		fg.Cell(0, 2, 12, 2) 	= "Equipment"
		
		fg.MergeCol(13) = true
		fg.Cell(0, 1, 13, 2, 13) 	= "Unit Price"
		
		fg.MergeCol(14) = true
		fg.Cell(0, 1, 14, 2, 14) 	= "Amount"

		
		
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
            <td style="width: 91%">
            </td>
            <td style="width: 3%">
                <gw:imgbtn id="ibtnSearch" img="search" alt="Search" />
            </td>
            <td style="width: 3%">
                <gw:imgbtn id="ibtnCancel" img="cancel" alt="Close" />
            </td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%" colspan="3">
                <gw:grid id="idGrid" header="Error Type|Main Contract Detail No|Budget Detail No|Detail Division No|Detail Level Code|Detail Level Seq|Work Item Name|Specification|UOM|Qty|Material|Labor|Equipment|Unit Price|Amount"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" defaults="||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="1500|2200|1600|1700|1700|1600|1700|1300|1200|1300|1300|1400|1300|1300|" styles="width:100%; height:100%"
                    sorting="T" />
            </td>
        </tr>
    </table>
    <gw:textbox id="iduser_pk" styles="display:none; " />
</body>
</html>
