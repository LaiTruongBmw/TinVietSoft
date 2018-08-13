<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Manpower Plan</title>
</head>
<%  ESysLib.SetUser("acnt")%>

<script>
function BodyInit()
{
      System.Translate(document);
      MergeHeader(); 
      MergeHeader_Planned();  
      MergeHeader_LaborCost();
       
}
//==========================================================================
function MergeHeader()
{
        var fg=Grid_Detail.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Detail.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 0, 0, 1)  = "Result MM"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 0, 1, 0) = "MM"
	    fg.Cell(0, 1, 1, 1, 1) = "Amount" 
	    
		fg.Cell(0, 0, 2, 0, 3)  = "Plan MM"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 2, 1, 2) = "MM"
	    fg.Cell(0, 1, 3, 1, 3) = "Amount" 
		
		fg.Cell(0, 0, 4, 0, 5)  = "Input M/M Sum"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 4, 1, 4) = "MM"
	    fg.Cell(0, 1, 5, 1, 5) = "Amount" 
}
//==========================================================================
function MergeHeader_Planned()
{
        var fg=Grid_Planned.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Planned.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 9, 0, 10)  = "2010"   //fg.Cell(0,row, from_col, row, to_col)	
	    
	    fg.Cell(0, 1, 9, 1, 9) = "11Mth"
	    fg.Cell(0, 1, 10, 1, 10) = "12Mth"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 11, 0, 12)  = "2011"   //fg.Cell(0,row, from_col, row, to_col)	
		
		fg.Cell(0, 1, 11, 1, 11) = "11Mth"
	    fg.Cell(0, 1, 12, 1, 12) = "12Mth"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 5, 0, 5)  = "All MM Sum"   //fg.Cell(0,row, from_col, row, to_col)	
	    
	    fg.Cell(0, 1, 5, 1, 5) = "(c=a+b)"	
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 6, 0, 6)  = "Result MM"   //fg.Cell(0,row, from_col, row, to_col)	
	    
	    fg.Cell(0, 1, 6, 1, 6) = " "	
		
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "PK"	
	    fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Site Execution Y/N"	
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Job"	
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Position"	
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "Unit Price"
		
		//fg.MergeCol(5) = true
		//fg.Cell(0, 0, 5, 1, 5) = "All MM Sum(c=a+b)"
		
		//fg.MergeCol(6) = true
		//fg.Cell(0, 0, 6, 1, 6) = "Result MM"	
		
		
		fg.MergeCol(7) = true
		fg.Cell(0, 0,7, 1, 7) = "Plan MM"
		fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 1, 8) = "MH Sum"
		
}
//==========================================================================
function MergeHeader_LaborCost()
{
        var fg=Grid_LaborCost.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_LaborCost.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		
		fg.Cell(0, 0, 4, 0, 5)  = "Sub-total"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 4, 1, 4) = "Mon Hour"
	    fg.Cell(0, 1, 5, 1, 5) = "Amount" 
	      
	    fg.Cell(0, 0, 6, 0, 8)  = "2010"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 6, 1, 6) = "Mon Hour"
	    fg.Cell(0, 1, 7, 1, 7) = "U/P" 
	    fg.Cell(0, 1, 8, 1, 8) = "Amount"    
	    
		fg.Cell(0, 0, 9, 0, 11)  = "2011"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 9, 1, 9) = "Mon Hour"
	    fg.Cell(0, 1, 10, 1, 10) = "U/P" 
	    fg.Cell(0, 1, 11, 1, 11) = "Amount" 
		
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Postion"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "All M/H"
		
		fg.Cell(0, 1, 1, 1, 1) = "(c=a+b)"
	    
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Resutl M/H"
		fg.Cell(0, 1, 2, 1, 2) = "(a)"
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Plan M/H"
		fg.Cell(0, 1, 3, 1, 3) = "(b)"
}
//==========================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Project':
            var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
            var aValue = System.OpenModal( fpath , 600 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
            if(aValue != null)
            {
                    txtProject_Pk.text = aValue[0];
                    txtProject_Cd.text = aValue[1];
                    txtProject_Nm.text = aValue[2];  
            } 
        break;
    }
}
//==========================================================================
</script>

<body>
    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td width="100%">
                <fieldset style="padding: 0">
                    <table cellpadding="1" cellspacing="1" width="100%">
                        <tr>
                            <td width="40%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr> 
									<td width="25%"align="right">
										 <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
											Project&nbsp;</a>
										</td>
                                        <td width="25%">
                                            <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="38%">
                                            <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="1%">
                                            <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
                                        </td>
                                        <td width="1%">
                                            <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
                                        </td>
										<td width="10%"></td>
                                    </tr>
                                </table>
							</td>	
                             <td width="60%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
										<td width="30%"align="right"> Actual Result Receipt Date&nbsp;</td>
                                        <td width="10%">
                                            <gw:datebox type="month" id="dtActual" lang="1" />
                                        </td>
                                        <td align="right" width="20%">
                                            <a href="#" style="text-decoration: none" onClick="OnPopUp()">Contract Ccy&nbsp;</a>
										</td>	
                                            <td width="28%">
                                                <gw:list id="lstContract_Ccy" onchange="" styles='width:100%'></gw:list>
                                            </td>
											
											 <td width="3%">
                                                <gw:imgbtn id="ibtnopdte" img="search" alt="Search" onclick="OnSearch()" />
                                            </td>
                                            <td width="3%">
                                                <gw:imgbtn id="ibtndte" img="new" alt="New" onclick="OnNew()" />
                                            </td>
                                            <td width="3%">
                                                <gw:imgbtn id="ibtnpdate" img="save" alt="Save" onclick="OnSave()" />
                                            </td>
                                            <td width="3%">
                                                <gw:imgbtn id="ibtUdate" img="delete" alt="Delete" onclick="OnDelete()" />
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                        
                            <td width="40%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
										<td align="right" width="25%">Working Period&nbsp;</td>
                                        <td width="30%">
                                            <gw:datebox id="dtWorking_Period_Fr" lang="1" />
                                        </td>
                                        <td width="5%">~</td>
										<td width="5%"></td>
                                        <td width="35%">
                                            <gw:datebox id="dtWorking_Period_To" lang="1" />
                                        </td>
										
									</tr>
                                </table>
                            </td>
                            <td width="60%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
										<td align="right" width="10%">
										<a href="#" style="text-decoration: none" onClick="OnPopUp()">Budget No.&nbsp;</a>
										</td>
                                        <td width="30%">
                                            <gw:list id="lstBudget_No" onchange="" styles='width:100%'></gw:list>
                                        </td>
                                        <td align="right" width="20%">
                                            Contract Amount &nbsp;</td>
                                        <td width="38%">
                                            <gw:textbox id="txtContract_Amt" styles='width:100%' />
                                        </td>
										
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 30%">
            <td width="100%">
                <gw:grid id="Grid_Detail" header="MM|Amount|MM|Amount|MM|Amount" format="0|0|0|0|0|0" aligns="1|3|1|3|1|3""
                    defaults="|||||" editcol="1|1|1|1|1|1" widths="1000|6000|1000|2500|1000|2500" styles="width:100%; height:100%"
                    sorting="T" />
            </td>
        </tr>
        <tr style="height: 68%">
            <td width="100%">
                <gw:tab id="idTab">
                <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" name="MM Plan">
                    <tr>
                        <td width="100%">
                            <!--header="0.Site Execution Y/N|1.Job|2.Position|3.Unit Price|4.MM Sum|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec"   -->
                            <gw:grid id="Grid_Planned" 
                            	header="PK||||||||||||"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                aligns="1|1|0|0|1|1|1|1|1|0|0|0|0"
                                defaults="||||||||||||" 
                                editcol="1|1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="2000|2500|2500|2500|2500|1500|2000|2000|2000|2000|1000|1000|1000"
                                styles="width:100%; height:100%" sorting="T" />
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" name="Inquiry Labor Cost">
                    <tr style="height: 10%; width: 100%;display:none">
                        <td>
                            <fieldset style="width: 100%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="right" width="12%">
                                            <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                                Project</a></td>
                                        <td width="30%">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="40%">
                                                        <gw:textbox id="txtProjectL_Cd" readonly="true" styles='width:100%' />
                                                    </td>
                                                    <td width="60%">
                                                        <gw:textbox id="txtProjectL_Nm" readonly="true" styles='width:100%' />
                                                    </td>
                                                    <td width="">
                                                        <gw:textbox id="txtProjectL_Pk" styles='width:100%;display:none' />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btvre2" img="reset" alt="Reset" onclick="txtProjectL_Cd.text='';txtProjectL_Nm.text='';txtProjectL_Pk.text='';" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right" width="15%">
                                            Budget No.</td>
                                        <td width="47%">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="30%">
                                                        <gw:textbox id="txtBudget_No" styles='width:100%' />
                                                    </td>
                                                    <td align="right" width="30%">
                                                        Turnover/Person</td>
                                                    <td width="30%">
                                                        <gw:textbox id="txtTurnover" styles='width:100%' />
                                                    </td>
                                                    <td width="10%">
                                                        USD/Year</td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnUpdte" img="search" alt="Search" onclick="OnSearch()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnpdte" img="new" alt="New" onclick="OnNew()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnUpdate" img="save" alt="Save" onclick="OnSave()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtUpdate" img="delete" alt="Delete" onclick="OnDelete()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Working Period</td>
                                        <td width="">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="45%">
                                                        <gw:datebox id="dtWorking_Period_Fr1" lang="1" />
                                                    </td>
                                                    <td width="10%" align="center">
                                                        ~</td>
                                                    <td width="45%">
                                                        <gw:datebox id="dtWorking_Period_To1" lang="1" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                                            Contract Amount</td>
                                        <td width="">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td width="100%">
                            <!--header=" 0.Description | 1.Amount (Contract Ccy) | 2.Amount (USD) | 3.Ratio to Contract Amount | 4.Amount (Contract Ccy) | 5.Amount (USD) | 6.Ration to Total Amount | 7.Amount (Contract Ccy) | 8.Amount (USD) | 9.Ration to Total Amount | 10.Current - Orignial | 11.Current-Last"   -->
                            <gw:grid id="Grid_LaborCost" 
                            	header="Postion|MM|Ccy|Amount|MM|Unit Price|Amount|MM|Amount|||"
                                format="0|0|0|0|0|0|0|0|0|0|0|0" 
                                aligns="1|1|0|0|1|1|1|1|1|1|1|1" 
                                defaults="|||||||||||"
                                editcol="1|1|1|1|1|1|1|1|1|1|1|1" 
                                widths="3000|2500|2500|2500|2500|2500|2500|2500|2500|2500|2500|2500"
                                styles="width:100%; height:100%" sorting="T" />
                        </td>
                    </tr>
                </table>
                </gw:tab>
            </td>
        </tr>
    </table>
</body>
</html>
