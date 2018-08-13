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
function MergeHeader()
{
	var fg=Grid_Mst.GetGridControl();
		if (Grid_Mst.rows < 2)
		{
			Grid_Mst.AddRow();
		}
		fg.FixedRows = 2
		fg.MergeCells = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 3, 0, 3) = "Cost Subject Total"  
		fg.Cell(0, 0, 4, 0, 4) = "Applied Cost"  
		fg.Cell(0, 0, 5, 0, 5) = "O/H Cost Subject Amt" 
		fg.Cell(0, 0, 6, 0, 6) = "Applied Rate"
		fg.Cell(0, 0, 7, 0, 7) = "Result"
		fg.Cell(0, 0, 8, 0, 8) = "O/H Cost Applied Result"
		fg.Cell(0, 0, 9, 0, 9) = "O/H Cost Sum"
		
		fg.Cell(0, 1, 3, 1) 	= "(a)"
		fg.Cell(0, 1, 4, 1 ) 	= "(b)"
		fg.Cell(0, 1, 5, 1) 	= "(c=a-b)"
		fg.Cell(0, 1, 6, 1 ) 	= "(d)"
		fg.Cell(0, 1, 7, 1) 	= "(e=c*d)"
		fg.Cell(0, 1, 8, 1 ) 	= "(f)"
		fg.Cell(0, 1, 9, 1) 	= "(f*e)"
	
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "pk"
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Description"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Applied Criteria"
}
//============================================================================================
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
                    <tr style="height:6%;width:100%">
                        <td>
                            <fieldset style="width:100%;padding:0">
                                <table  style="width: 100%" cellpadding="1" cellspacing="0">
                                            <tr>
                                                        <td align="right" width="13%">
                                                            <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                                                Project&nbsp;</a></td>
                                                        <td width="38%">
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
                                                        <td width="10%" align="right">Budget No.&nbsp;</td>
                                                        <td width="13%"><gw:list id="lstBudgetNo" styles='width:100%' /></td>
                                                        <td width="8%" align="right">Status&nbsp;</td>
                                                        <td width="13%"><gw:list id="lstStatus" styles='width:100%' /></td>
                                                        <td width="2%"></td>
                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="Search"  onclick="OnSearch()" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="save" alt="Save"  onclick="" /></td>
                                            </tr>  
                                            <tr>
                                            			<td  align="right">Working Period&nbsp;</td>
                                                        <td >
                                                                <table style="width:100%" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                            <td width="49%" align="left"><gw:datebox id="dtWorking_Fr" lang="1" /></td>
                                                                            <td width="2%" align="center">~</td>
                                                                            <td width="49%" align="right"><gw:datebox id="dtWorking_To" lang="1" /></td>
                                                                    </tr>
                                                                </table>
                                                        </td>
                                                        <td  align="right"><a title="Main Contract Amount"  style="color:#000">Main.Ctr.Amt&nbsp;</a></td>
                                                        <td colspan="6"><gw:textbox id="txtContract_Amt"  styles='width:100%' /></td>
                                            </tr>
                                            <tr>
                                            			<td  align="left">Working Budget Amt&nbsp;</td>
                                                        <td><gw:textbox id="txtContract_Amt"  styles='width:100%' /></td>
                                                        <td></td>
                                                        <td  align="right" colspan="2">Actual Result  - Received Month &nbsp;</td>
                                                        <td><gw:datebox type="month" id="dtWorking_To" lang="1" /></td>
                                            </tr>    
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 64%;width:100%">
                       <td width="100%">
                       					
								                    <gw:grid 
													            id="Grid_Mst"  
													            header="_PK|1|2|3|4|5|6|7|8|9"   
													            format  ="0|0|0|0|0|0|0|0|0|0"  
													            aligns   ="0|0|0|0|0|0|0|0|0|0"  
													            defaults="|||||||||"  
													            editcol ="0|0|0|0|0|0|0|0|0|0"  
													            widths  ="2000|2500|2500|2000|2000|2000|1700|1700|2300|1500"  
													            styles="width:100%; height:100%"   
													            sorting="T"   
													            oncelldblclick= "DblClick()" /> 
										        </td>
                    </tr>
                    <tr height="30%">
                    			<td width="100%">
                       					
								                    <gw:grid 
													            id="Grddetail"  
													            header="Description|Applied Criteria|Applied Subj.Amt (g)|Applied Rate(h)|Calc.Amount(g*h)"   
													            format  ="0|0|0|0|0"  
													            aligns   ="0|0|0|0|0"  
													            defaults="||||"  
													            editcol ="0|0|0|0|0"  
													            widths  ="2000|2500|2500|2000|2000"  
													            styles="width:100%; height:100%"   
													            sorting="T"   
													            oncelldblclick= "DblClick()" /> 
										        </td>
                    </tr>
                </table>
</body>
</html>
