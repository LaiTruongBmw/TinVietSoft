<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Apply Standard Code</title>
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
    if (idGrid.rows < 2)
	    {
			
		    idGrid.AddRow();
	    }
	    
	var fg=idGrid.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5

		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Standard Code"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 3) = "Standard"  
		fg.Cell(0, 1, 1, 1) 	= "Name"
		fg.Cell(0, 1, 2, 1 ) 	= "Specification"
		fg.Cell(0, 1, 3, 1) 	= "UOM"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 4, 0, 6) = "Synonym"  
		fg.Cell(0, 1, 4, 1) 	= "Name"
		fg.Cell(0, 1, 5, 1 ) 	= "Specification"
		fg.Cell(0, 1, 6, 1) 	= "UOM"
		
		fg.MergeCol(7) = true
		fg.Cell(0, 0, 7, 1, 7) = "Can't find out"

		
		
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
                <gw:imgbtn id="ibtnSelect" img="select" alt="Select" />
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
                            Category</td>
                        <td style="width: 30%" align="center" colspan="3">
                            <gw:radio id="radTab" value="1" styles="width:100%"> 
                                <span value="1" id="Span1">All</span> 
                                <span value="2" id="Span2">Work Type</span>
                                <span value="3" id="Span3">Material</span>
                                <span value="4" id="Span4">Equipment</span>
                                <span value="5" id="Span5">Labor</span>
                                <span value="6" id="Span6">Expense</span>
                            </gw:radio>
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Work Type
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstWorkType" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Code</td>
                        <td style="width: 20%" align="center">
                            <gw:textbox id="txtCode" styles='width:100%' />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Name
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtName" styles='width:100%' />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Specification
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtSpecifi" styles='width:100%' />
                        </td>
                        <td style="width: 1%">
                            <gw:checkbox id="chkAll" value='F'></gw:checkbox>
                        </td>
                        <td style="width: 1%; white-space: nowrap" align="right">
                            UOM
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtUOM" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id="idGrid" header="Standard Code|Name|Specification|UOM|Name|Specification|UOM|Cant  find out"
                                format="0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0" defaults="|||||||" editcol="0|0|0|0|0|0|0|0"
                                widths="1400|1700|1700|1700|1700|1700|1700|1000" styles="width:100%; height:100%"
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
