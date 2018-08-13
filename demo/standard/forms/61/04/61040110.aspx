<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>[Construction]Working Details Search By Work Division</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script language="javascript">

var f_lag="1";
function BodyInit()
{
	System.Translate(document);
	var data ;
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('E250') FROM DUAL")%>";
	lstsearch.SetDataText(data);
	data     = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
	lstLanguage.SetDataText(data);
	MerGrid();
}
//============================================================================================
function OnNew()
{
	Grid_WorkDivision.AddRow();
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
	fg.Cell(0, 0, 0, 1, 0) = "Level Work Division Code"
	
	fg.MergeCol(1) = true
	fg.Cell(0, 0, 1, 1, 1) = "Level Work Division Name"

	fg.MergeCol(2) = true
	fg.Cell(0, 0, 2, 1, 2) = "Order Work Division"
	
	fg.MergeRow(0) = true
	fg.Cell(0, 0, 3, 0, 7) = "Contract Amount"  
	fg.Cell(0, 1, 3, 1) 	= "Currency"
	fg.Cell(0, 1, 4, 1 ) 	= "Raw Mtrl. Cost"
	fg.Cell(0, 1, 5, 1) 	= "Labor Cost"
	fg.Cell(0, 1, 6, 1) 	= "Expenses"
	fg.Cell(0, 1, 7, 1) 	= "Amount"
	
	fg.MergeRow(0) = true
	fg.Cell(0, 0, 8, 0, 12) = "Budget Cost of Work Schedule(BCWS)"  
	fg.Cell(0, 1, 8, 1) 	= "Currency"
	fg.Cell(0, 1, 9, 1 ) 	= "Raw Mtrl. Cost"
	fg.Cell(0, 1, 10, 1) 	= "Labor Cost"
	fg.Cell(0, 1, 11, 1) 	= "Expenses"
	fg.Cell(0, 1, 12, 1) 	= "Amount"	
}



function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Project':
                            var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {   
                                    f_lag="1";
									txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
									dso_BudgetNo.Call("SELECT");
                            } 
                break;
        }
} 
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
         switch(obj.id)
         {
                case "dso_Search":
                         MerGrid();
                break;
		 }
}
function OnSearch()
{
		if(txtProject_Pk.text !="")
		{
			dso_Search.Call('SELECT');
		}
		else
		{
			alert("Please,choose project to search.");
		}
}
function OnPrint()
{
	var url = '/reports/61/04/rpt_61040110.aspx?p_project_pk='+ txtProject_Pk.text + '&p_version=' + lstBudget.value + '&p_searchdes=' + lstsearch.value;
	    System.OpenTargetPage( System.RootURL+url , "newform" );
}	
//============================================================================================
function OnShowHide()
{
 /*   var fg=idGrid.GetGridControl(); 	
    if(lstsearch.value == 1)
    {
        fg.ColHidden(1) = false;
        fg.ColHidden(2) = true;
    }
    else
    {
        fg.ColHidden(1) = true;
        fg.ColHidden(2) = false;
    }*/
}
</script>

<body>
	<gw:data id="dso_BudgetNo" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="2" type="list" procedure="sp_sel_kpbm00050_budgetno" > 
			<input> 
				<input bind="txtProject_Pk" />
			</input> 
			<output>
				<output bind="lstBudget" /> 
			</output>
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_Search" onreceive="OnDataReceive(this)">
	  <xml>
		<dso type="grid"  function="sp_sel_kpbm2111" >
		  <input bind="idGrid">
			  <input bind="txtProject_Pk"/>
			  <input bind="lstBudget"/>
			    <input bind="lstsearch"/>
		  </input>
		  <output bind="idGrid"/>
		</dso>
	  </xml>
</gw:data>
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
        <tr style="height: 2%">
			<td width="100%">
				<fieldset style="padding:0">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td align="right" width="10%">
											<a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
												Project&nbsp;</a></td>
							<td width="20%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
							<td width="30%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /><gw:textbox id="txtProject_Pk" styles='width:100%;display:none' /></td>
							<td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
							<td style="white-space: nowrap; width: 15%" align="right">Budget Statement No&nbsp;</td>
							<td style="width: 35%"><gw:list id="lstBudget" styles='width:100%' /></td>
							<td><gw:button id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
						</tr>
						<tr>
							<td align="right" width="10%">Search by&nbsp;</a></td>
							
							<td style="width: 50%" colspan="2"><gw:list id="lstsearch" onchange="OnShowHide()" styles='width:100%' /></td>
							<td style="width: 15%" colspan="2" align="right">Language</td>
							<td style="width: 25%" colspan="1"><gw:list id="lstLanguage" styles='width:100%' /></td>
							<td style="width: 1%" align="right">
								<gw:button img="excel" alt="Print" text="Print" id="btnReport" onclick="OnPrint()" />
							</td>
						</tr>
					</table>
				</fieldset>
			</td>
        </tr>
        <!--0.Work Description|1.Level Work Division|2.Outside Order Work Type|3.Currency|4.Material Cost|5.Labor Cost|6.Expenses|7.Amount|8.Currency|9.Material Cost|10.Labor Cost|11.Expenses|12.Amount-->
        <tr style="height: 98%">
            <td width="100%" colspan="6">
                <gw:grid id="idGrid" 
                header="Work Description|Level Work Division|_Outside Order Work Type|Currency|Material Cost|Labor Cost|Expenses|Amount|Currency|Material Cost|Labor Cost|Expenses|Amount"
                    format="0|0|0|0|-0|-0|-0|-0|0|-0|-0|-0|-0" 
					aligns="2|2|2|1|3|3|3|3|1|3|3|3|3"
                    defaults="||||||||||||" 
					editcol="0|1|1|1|1|1|1|1|1|1|1|1|1" 
					widths="2200|3500|1800|1800|2400|2300|1000|1000|1000|1400|1000|1000|1000"
                    styles="width:100%; height:100%" sorting="T" />
            </td>
        </tr>
    </table>
</body>
</html>
