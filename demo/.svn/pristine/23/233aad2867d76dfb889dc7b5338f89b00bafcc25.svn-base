<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Receive Subcontract Data</title>
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
            <td style="width: 87%">
            </td>
            
            <td style="width: 5%">
                <gw:icon id="btnLoadData" text="Load Data" />
            </td>
            <td style="width: 4%">
                <gw:imgbtn id="ibtnSearch" img="search" alt="Search" />
            </td>
            <td style="width: 4%">
                <gw:imgbtn id="ibtnCancel" img="cancel" alt="Close" />
            </td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%" colspan="4">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Outside Order Work Item</td>
                        <td style="width: 30%" align="center">
                            <gw:textbox id="txtWorkItemCode" styles='width:30%' />
                            <gw:textbox id="txtWorkItemName" styles='width:70%' />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Inquiry Type
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="ldtDisplay" styles='width:100%' />
                        </td>
                        <td style="width:10%">
                            <gw:checkbox id="chkAll" value='F'>Select All</gw:checkbox>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="5">
                            <gw:grid id="idGrid" header="Select|Outside Order Work Code|Outside Order Work Name|Contract Date|Budget Amount|Subcontract Amount|Received Y/N"
                                format="0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0" defaults="||||||" editcol="0|0|0|0|0|0|0"
                                widths="1000|2500|2500|1600|1600|1900|1000" styles="width:100%; height:100%"
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
