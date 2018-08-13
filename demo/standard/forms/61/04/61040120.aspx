<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Work Division Entry</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script language="javascript">
function BodyInit()
{
	System.Translate(document);
	MerGrid();
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
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 3) = "Contract Amount"  
		fg.Cell(0, 1, 1, 1) 	= "Before Change"
		fg.Cell(0, 1, 2, 1 ) 	= "After Change"
		fg.Cell(0, 1, 3, 1) 	= "Increase/Decrease"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 4, 0, 9) = "Direct Management (Control) (A)"  
		fg.Cell(0, 1, 4, 1) 	= "Before Change"
		fg.Cell(0, 1, 5, 1 ) 	= "After Change"
		fg.Cell(0, 1, 6, 1) 	= "Increase/Decrease"
		fg.Cell(0, 1, 7, 1) 	= "Headoffice"
		fg.Cell(0, 1, 8, 1 ) 	= "Site"
		fg.Cell(0, 1, 9, 1) 	= "Sub - Total"
		
		fg.MergeCol(10) = true
		fg.Cell(0, 0, 10, 1, 10) = "Outsourcing (B)"
		
		fg.MergeCol(11) = true
		fg.Cell(0, 0, 11, 1, 11) = "BCWS (A+B)"
		
		fg.MergeCol(12) = true
		fg.Cell(0, 0, 12, 1, 12) = "Working Rate (%)"
		
		
	
        if (idGrid_Left.rows < 2)
		{
			
			idGrid_Left.AddRow();
		}
	var fg=idGrid_Left.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5

		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Description"
		
}

</script>

<body>
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
        <tr style="height: 2%">
        		<td width="100%" colspan="2">
                		<fieldset style="padding:0">
                        			<table cellpadding="1" cellspacing="1" width="100%">
                                    		<tr>
                                            			<td align="right" width="10%">
                                                                    <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                                                        Project&nbsp;</a></td>
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
                                                                <td style="white-space: nowrap; width: 15%" align="right">
                                                                    Budget Statement No&nbsp;
                                                                </td>
                                                                <td style="width: 35%">
                                                                    <gw:list id="lstBudget" styles='width:100%' />
                                                                </td>
                                                                <td>
                                                                    <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" />
                                                                </td>
                                                                                                </tr>
                                               <tr >
                                               				<td style="white-space: nowrap; width: " align="right">Description&nbsp;</td>
                                                            <td style="width: "><gw:list id="lstDescription" styles='width:100%' /></td>
                                                           
                                                            
                                               </tr>
                                                                                        </table>
                        </fieldset>
                </td>
        </tr>
     
        <tr style="height: 98%;width:100%">
        		
        </tr>
    </table>
</body>
</html>
