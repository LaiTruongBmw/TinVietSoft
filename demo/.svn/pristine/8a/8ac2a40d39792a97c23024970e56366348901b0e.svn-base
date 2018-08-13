<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Inquiry Legally Allowed Expenses for each work</title>
</head>
<%  ESysLib.SetUser("EC111")%>
<script>
function BodyInit()
{
        System.Translate(document);
	    BindingDataList();
}  
//============================================================================================
//============================================================================================
//====================================================================================================================
function BindingDataList()
{
	//var Status = "<%=ESysLib.SetListDataFUNC("SELECT acnt.SF_A_GET_COMMONCODE('ACBG0010') FROM DUAL")%>";
//	lstStatus.SetDataText(Status);
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
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2]; 
                            } 
                break;
				case 'OrderWork':
						if(event.col == 0||event.col == 1 ||event.col == 2)
						{
							var fpath = System.RootURL + "/form/kp/bm/kpbm00120_popup.aspx";
							var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
							if(aValue != null)
							{
									Grid_Detail.SetGridText(Grid_Detail.row, 10, aValue[0]);  //level
									Grid_Detail.SetGridText(Grid_Detail.row, 0, aValue[1]); //code
									Grid_Detail.SetGridText(Grid_Detail.row, 1, aValue[2]); //name
									Grid_Detail.SetGridText(Grid_Detail.row, 2, aValue[3]); //ccy
							} 
						}
				break;
		}
}
//====================================================================================================================
function OnSearch()
{
		dso_search.Call('SELECT');
}
//====================================================================================================================
function OnNew()
{
	if(txtProject_Pk.text != '')
	{
		var fpath = System.RootURL + "/form/kp/bm/kpbm00120_popup.aspx";
		var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
		if(aValue != null)
		{
				Grid_Detail.AddRow();
				Grid_Detail.SetGridText(Grid_Detail.rows - 1, 10, aValue[0]);  //level
				Grid_Detail.SetGridText(Grid_Detail.rows - 1, 0, aValue[1]); //code
				Grid_Detail.SetGridText(Grid_Detail.rows - 1, 1, aValue[2]); //name
				Grid_Detail.SetGridText(Grid_Detail.rows - 1, 2, aValue[3]); //ccy
		} 
	}
	else
	{
		alert('Please select a project !!');	
	}
}
</script>
<body>
<!-- <gw:data id="dso_search" onreceive="">
    <xml>
        <dso type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="ec111.sp_sel_kpbm00120" procedure="ec111.sp_upd_kpbm00120" >
            <input bind="Grid_Detail">
                <input bind="txtProject_Pk"/>
                <input bind="lstBudgetNo"/>
                <input bind="lstStatus"/>
            </input>
            <output bind="Grid_Detail"/>
        </dso>
    </xml>
</gw:data>-->
    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height:1%;width:100%">
                        <td>
                            <fieldset style="width:100%;padding:0">
                                <table  style="width: 100%" cellpadding="0" cellspacing="0">
                                            <tr>  
                                                        <td width="8%" align="right"><a title="Placement Order Work Division" style="color:#333">Order W. Div.</a>&nbsp;</td>
                                                        <td width="15%"><gw:list id="lstBudgetNo" styles='width:100%' /></td>
                                                        <td width="10%" align="right"><a title="Budget Cost of Work Schedule" style="color:#333">BCWS</a>&nbsp;</td>
                                                        <td width="15%"><gw:textbox id="txtWork_Name" styles='width:100%' /></td>
                                                        <td width="12%" align="right"><a title="Net Construction Cost" style="color:#333">Net Const. Cost</a>&nbsp;</td>
                                                        <td width="15%"><gw:textbox id="txtNet" styles='width:100%' /></td>
                                                        <td width="10%" align="right"><a title="All Expenditures" style="color:#333">All Exp.</a>&nbsp;</td>
                                                        <td width="15%"><gw:textbox id="txtExpenses" styles='width:100%' /></td>
                                                        
                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="Inquiry Basis Amount Detail"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="search"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="save" alt="Save"  onclick="" /></td>
                                            </tr>           
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%;width:100%">
                       <td width="100%">
                       					
								                    <gw:grid 
													            id="Grid_Detail"  
													            header="Item|Actual Calculation Formula|Application Amount|Remarks"   
													            format  ="0|0|0|0"  
													            aligns  ="0|0|0|0"  
													            defaults="|||"  
													            editcol ="0|0|0|0"  
													            widths  ="2000|3000|2000|2000"  
													            styles="width:100%; height:100%"   
													            sorting="T"
                                                                oncelldblclick="OnPopUp('')"   
													            /> 
										        </td>
                    </tr>
                </table>
</body>
</html>
