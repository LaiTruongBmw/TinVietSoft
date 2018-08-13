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
		fg.Cell(0, 0, 1, 0, 3)  = "Main Contract"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 1, 1, 1) = "Amount (Contract Ccy)"
	    fg.Cell(0, 1, 2, 1, 2) = "Amount (USD)" 
		fg.Cell(0, 1, 3, 1, 3) = "Ratio to Contract Amount" 
		
		fg.Cell(0, 0, 4, 0, 6)  = "Main Contract"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 4, 1, 4) = "Amount (Contract Ccy)"
	    fg.Cell(0, 1, 5, 1, 5) = "Amount (USD)" 
		fg.Cell(0, 1, 6, 1, 6) = "Ratio to Contract Amount" 
		
		fg.Cell(0, 0, 7, 0, 7)  = "Balance"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 7, 1, 7) = "(Main Contract - Budget)"
	    
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Description"	
		fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 1, 8) = "Budget Amt / Main Contract Amt"	
	   
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
									dso_version.Call();
                            } 
                break;
		}
}
</script>
<body>
 
    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height:5%;width:100%" valign="top">
                        <td >
                            <fieldset style="width:100%;padding:0">
                                <table  style="width: 100%" cellpadding="1" cellspacing="1">
                                            <tr >
                                                        <td align="right" width="12%">
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
                                                        <td width="15%" align="right">Type</td>
                                                        <td width="28%"><gw:list id="lstType" styles='width:100%' /></td>
                                                        
                                                        <td width="2%"></td>
                                                         <td width="5%"><gw:icon id="btnConfirm" img="in" onclick="" styles="width:100%" text="Approve" /></td>

                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="Search"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="excel" alt="Print"  onclick="" /></td>
                                                        
                                            </tr>   
                                            <tr >
                                            			<td width="" align="right">Budget No.</td>
                                                        <td width="">
                                                        		<table width="100%" cellpadding="0" cellspacing="0">
                                                                		<tr>
                                                                        			<td width="40%"><gw:list id="lstBudgetNo" styles='width:100%' /></td>
                                                                        			<td width="20%" align="right">Status&nbsp;</td>
                                                        							<td width="40%"><gw:list id="lstStatus" styles='width:100%' /></td>
                                                                        </tr>
                                                                </table>
                                                        </td>
                                                         <td width="" align="right">Report</td>
                                                        <td width="" colspan=""><gw:list id="lstReport" styles='width:100%' /></td>
                                            </tr>   
                                            <tr></tr>
                                            <tr  >
                                            		<td colspan="8">
                                                    		<fieldset style="width:100%;background:#0FF;padding:0" >
                                                            		<table style="width:100%">
                                                                    	
                                                                    	<tr>
                                                                        		  <td width="12%" align="right">Main Contract Amt</td>
                                                                                  <td width="18%"><gw:textbox id="txtContract_Amt"  styles='width:100%' /></td>
                                                                                  <td width="13%" align="right">Total Budget Amt</td>
                                                                                  <td width="18%"><gw:textbox id="txtTotal_Amt"  styles='width:100%' /></td>
                                                                                  <td width="13%" align="right">Material Cost</td>
                                                                                  <td width="26%" colspan="">
                                                                                  		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                        	<tr>
                                                                                            	<td width="34%"><gw:textbox id="txtMaterial_Amt"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtMaterialSum_Amt"  styles='width:100%' /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                  </td>
                                                                        </tr>
                                                                        <tr>
                                                                        		  <td  align="right">Contract Ccy</td>
                                                                                  <td ><gw:textbox id="txtContract_Ccy"  styles='width:100%' /></td>
                                                                                  <td  align="right">Ex.Rate</td>
                                                                                  <td ><gw:textbox id="txtExchange"  styles='width:100%' /></td>
                                                                                  <td  align="right">Labor Cost</td>
                                                                                  <td  >
                                                                                  		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                        	<tr>
                                                                                            	<td width="34%"><gw:textbox id="txtLaborCost"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtLaborCost_Sum"  styles='width:100%' /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                  </td>
                                                                        </tr>
                                                                        <tr>
                                                                        		  <td  align="right">Remark</td>
                                                                                  <td  colspan="3"><gw:textbox id="txtRemark"  styles='width:100%' /></td>
                                                                                  <td align="right">Outside Work</td>
                                                                                  <td  >
                                                                                  		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                        	<tr>
                                                                                            	<td width="34%"><gw:textbox id="txtOutsideWork"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtOutsideWork_Sum"  styles='width:100%' /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                  </td>
                                                                       </tr>
                                                                       <tr>
                                                                       			  <td  align="right">Approved by</td>
                                                                                  <td  colspan="3">
                                                                                  		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                        	<tr>
                                                                                            	<td width="34%"><gw:textbox id="txtSiteManager"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtSiteManager_Name"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtSiteManager_DateTime"  styles='width:100%' /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                  </td>
                                                                                  <td align="right">Expenses</td>
                                                                                  <td  >
                                                                                  		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                        	<tr>
                                                                                            	<td width="34%"><gw:textbox id="txtExpenses"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtExpenses_Sum"  styles='width:100%' /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                  </td>
                                                                       </tr>
                                                                       <tr>
                                                                       			  <td align="right"></td>
                                                                                  <td  colspan="3">
                                                                                  		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                        	<tr>
                                                                                            	<td width="34%"><gw:textbox id="txtGroupLeader"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtGroupLeader_Name"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtGroupLeader_TimeDate"  styles='width:100%' /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                  </td>
                                                                                  <td align="right">Indirect Cost</td>
                                                                                  <td  >
                                                                                  		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                        	<tr>
                                                                                            	<td width="34%"><gw:textbox id="txtIndirectCost"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtIndirectCost_Sum"  styles='width:100%' /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                  </td>
                                                                       </tr>
                                                                       <tr>
                                                                       			  <td align="right"></td>
                                                                                  <td  colspan="3">
                                                                                  		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                        	<tr>
                                                                                            	<td width="34%"><gw:textbox id="txtGeneralDirector"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtGeneralDirector_Name"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtGeneralDirector_TimeDate"  styles='width:100%' /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                  </td>
                                                                                  <td align="right">Sum</td>
                                                                                  <td  >
                                                                                  		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                        	<tr>
                                                                                            	<td width="34%"><gw:textbox id="txtSum"  styles='width:100%' /></td>
                                                                                                <td width="33%"><gw:textbox id="txtSum_Amt"  styles='width:100%' /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                  </td>
                                                                       </tr>
                                                                    </table>
                                                            </fieldset>
                                                    </td>
                                                      
                                            </tr>     
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 95%;width:100%">
                       <td width="100%">
                       			<!--header="0.Description|1.Amount (Contract Ccy)|2.Amount (USD)|3.Ratio to Contract Amount|4.Amount (Contract Ccy)|5.Amount (USD)|6.Ratio to Contract Amount|7.(Main Contract - Budget)|8.Budget Amt / Main Contract Amt"-->		
                                <gw:grid 
                                id="Grid_Mst"  
                                header="Description|Amount (Contract Ccy)|Amount (USD)|Ratio to Contract Amount|Amount (Contract Ccy)|Amount (USD)|Ratio to Contract Amount|(Main Contract - Budget)|Budget Amt / Main Contract Amt"   
                                format  ="0|0|0|0|0|0|0|0|0"  
                                aligns   ="0|0|0|0|0|0|0|0|0"  
                                defaults="||||||||"  
                                editcol ="0|0|0|0|0|0|0|0|0"  
                                widths  ="3000|2300|2300|2300|2300|2300|2300|2200|2500"  
                                styles="width:100%; height:100%"   
                                sorting="T"   
                                oncelldblclick= "DblClick()" /> 
						</td>
                    </tr>
                </table>
</body>
</html>
