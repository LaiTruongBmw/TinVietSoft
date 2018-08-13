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
		MergeHeader_Bottom();
}  
//============================================================================================
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
		
		fg.Cell(0, 0, 2, 0, 4)  = "Main Contract"   //fg.Cell(0,row, from_col, row, to_col)
		fg.Cell(0, 1, 2, 1, 2) = "Currency"  	
	    fg.Cell(0, 1, 3, 1, 3) = "Ex.Rate"
	    fg.Cell(0, 1, 4, 1, 4) = "Amount" 
		
		fg.Cell(0, 0, 5, 0, 7)  = "Working"   //fg.Cell(0,row, from_col, row, to_col)
		fg.Cell(0, 1, 5, 1, 5) = "Currency"  	
	    fg.Cell(0, 1, 6, 1, 6) = "Ex.Rate"
	    fg.Cell(0, 1, 7, 1, 7) = "Amount" 
	    
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Description"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Currency"	
	    fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 1, 8) = "Profit Rate"	
		fg.MergeCol(8) = true
		
}
//============================================================================================
function MergeHeader_Bottom()
{
        var fg=Grid_Bottom.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Bottom.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		
		fg.Cell(0, 0, 4, 0, 6)  = "Increase / Decrease"   //fg.Cell(0,row, from_col, row, to_col)
		fg.Cell(0, 1, 4, 1, 4) = "Previous"  	
	    fg.Cell(0, 1, 5, 1, 5) = "Current"
	    fg.Cell(0, 1, 6, 1, 6) = "Accumulated" 
	    
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Description"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Outside Order Work"	
	    fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Working"	
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Adjusted"	
		fg.MergeCol(8) = true
		
}
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
									
                            } 
                break;
		}
}

</script>
<body>
 
    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height:4%;width:100%">
                        <td>
                            <fieldset style="width:100%;padding:0">
                                <table  style="width: 100%" cellpadding="1" cellspacing="1">
                                            <tr>
                                                        <td align="right" width="7%">
                                                            <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                                                Project</a></td>
                                                        <td width="43%">
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
                                                        <td width="15%" align="right">Budget No.</td>
                                                        <td width="16%"><gw:list id="lstBudgetNo" styles='width:100%' /></td>
                                                        <td align="right" width="19%">Propose Date</td>
                                                        <td><gw:datebox id="lstBudgetNo" styles='width:100%' lang="1" /></td>
                                                        
                                                        <td ><gw:icon id="btSve2" img="in" alt="Increase / Decrease" text="Increase / Decrease"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="Search"  onclick="OnSearch()" /></td>
                                                        
                                            </tr>
                                            <tr>
                                            			<td width="" align="right">Reason of Adjustment</td>
                                                        <td width="" colspan="8"><gw:textarea id="txtReason" styles='width:100%' /></td>
                                            </tr>           
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 48%;width:100%">
                       <td width="100%">
                       					<!--header="0.Description|1.Currency|2.Contract Amount|3.Ex Rate|4.Booking Amount|5.Budget Amount|6.Ex Rate|7.Booking Amount|8.Gross Margin"-->
								                    <gw:grid 
													            id="Grid_Mst"  
													            header="Description|Currency|Contract Amount|Ex Rate|Booking Amount|Budget Amount|Ex Rate|Booking Amount|Gross Margin"   
													            format  ="0|0|0|0|0|0|0|0|0"  
													            aligns   ="0|0|0|0|0|0|0|0|0"  
													            defaults="||||||||"  
													            editcol ="0|0|0|0|0|0|0|0|0"  
													            widths  ="2000|2500|2500|2000|2000|2000|2000|2000|2000"  
													            styles="width:100%; height:100%"   
													            sorting="T"   
													            /> 
										        </td>
                    </tr>
                    <tr style="height: 48%;width:100%">
                       <td width="100%">
                       					<!--header="0.Description|1.Outside Order Work|2.Budget|3.Adjusted Budget|4.Previous|5.Current|6.Accumulated"  -->
								                    <gw:grid 
													            id="Grid_Bottom"  
													            header="Description|Outside Order Work|Budget|Adjusted Budget|Previous|Current|Accumulated"   
													            format  ="0|0|0|0|0|0|0"  
													            aligns  ="0|0|0|0|0|0|0"  
													            defaults="||||||"  
													            editcol ="0|0|0|0|0|0|0"  
													            widths  ="2000|2500|2500|2000|2000|2000|2000"  
													            styles="width:100%; height:100%"   
													            sorting="T"   
													             /> 
										        </td>
                    </tr>
                </table>
</body>
</html>
