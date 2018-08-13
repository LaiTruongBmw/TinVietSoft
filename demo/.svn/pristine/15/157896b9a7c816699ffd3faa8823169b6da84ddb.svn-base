<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Link to Main Contract Detail</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
  System.Translate(document);

  
}
//-------------------------------------------
function OnSearch()
{
    
	
}
//-------------------------------------------
//function MerGrid()
//{
//    if (idGrid.rows < 2)
//		{
//			
//			idGrid.AddRow();
//		}
//	var fg=idGrid.GetGridControl();
//		fg.FixedRows = 2
//		fg.MergeCells = 5

//		fg.MergeCol(0) = true
//		fg.Cell(0, 0, 0, 1, 0) = "Budget Detail No"
//		
//        fg.MergeCol(1) = true
//		fg.Cell(0, 0, 1, 1, 1) = "Detail Devision No"
//	
//		fg.MergeCol(2) = true
//		fg.Cell(0, 0, 2, 1, 2) = "Detail Level Code"
//		
//		fg.MergeCol(3) = true
//		fg.Cell(0, 0, 3, 1, 3) = "Detal Level Seq"
//		
//		fg.MergeCol(4) = true
//		fg.Cell(0, 0, 4, 1, 4) = "Work Item Name"
//		
//		fg.MergeCol(5) = true
//		fg.Cell(0, 0, 5, 1, 5) = "Specification"
//		
//		fg.MergeCol(6) = true
//		fg.Cell(0, 0, 6, 1, 6) = "Main Contract Detail No"
//		
//		fg.MergeRow(0) = true
//		fg.Cell(0, 0, 7, 0, 9) = "Main Contract"  
//		fg.Cell(0, 1, 7, 1) 	= "UOM"
//		fg.Cell(0, 1, 8, 1 ) 	= "Currency"
//		fg.Cell(0, 1, 9, 1) 	= "Quantity"

//		
//		
//}
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
                <gw:imgbtn id="ibtnSave" img="save" alt="Save" />
            </td>
            <td style="width: 3%">
                <gw:imgbtn id="ibtnCancel" img="cancel" alt="Close" />
            </td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%" colspan="4">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Work Item</td>
                        <td style="width: 30%" align="center">
                            <gw:textbox id="txtWorkItem" styles='width:100%' />
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                        </td>
                        <td style="width: 30%; white-space: nowrap">
                            <gw:checkbox id="chkDisplay" value="F">Display updated Main Contract Detail Only</gw:checkbox>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="4">
                            <gw:grid id="idGrid" header="Main Contract Detail No|Detail Level Code|Work Item Name|Specification|UOM|Currency|Quantity|Unit Price|Amount"
                                format="0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0" defaults="||||||||" editcol="0|0|0|0|0|0|0|0|0"
                                widths="2200|1600|1600|1500|1000|1200|1200|1300|1200" styles="width:100%; height:100%"
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
