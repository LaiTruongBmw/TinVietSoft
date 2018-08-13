<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Project</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
        System.Translate(document);
	   // BindingDataList();
		FormatGrid();
} 
function BindingDataList()
{
	//giong nhu fr kia loi cmc 
}
 
//============================================================================================
function OnCaculator()
{
			var Net = Grid_Detail.GetGridData(Grid_Detail.row, 4);
			var Safe_7 =  Grid_Detail.GetGridData(Grid_Detail.row, 6);
			var Insurance_8 = Grid_Detail.GetGridData(Grid_Detail.row, 7);
			var Other_9 = Grid_Detail.GetGridData(Grid_Detail.row, 8);
			var Overhead_10  = Grid_Detail.GetGridData(Grid_Detail.row, 9);
			var BCWS = 0;
			var Total_Exp_6 = 0;
			Total_Exp_6 = Number(Safe_7) + Number(Insurance_8) + Number(Other_9) + Number(Overhead_10);
			BCWS = Number(Net) + Total_Exp_6 ;
			Grid_Detail.SetGridText(Grid_Detail.row, 5, Total_Exp_6);
			Grid_Detail.SetGridText(Grid_Detail.row, 3, BCWS);
}

//============================================================================================
function OnCreate()
{
	if(txtProject_Pk.text == '')
	{
		alert('Please select project !!');
	}
	else
	{
		
		dso_create.Call();
	}
}
//====================================================================================================================

//====================================================================================================================
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
									dso_budget_no.Call();
									//OnSearch();
                            } 
                break;
				case 'Create':
					if(event.col == 3 || event.col == 4 || event.col == 5)
					{
                            var path = System.RootURL + "/form/61/04/61040080_popup_Inquiry.aspx?BCWS=" + Grid_Detail.GetGridData(Grid_Detail.row, 3) + '&NetContract=' + Grid_Detail.GetGridData(Grid_Detail.row, 4) + '&Expense=' + Grid_Detail.GetGridData(Grid_Detail.row, 5) + '&Project_pk=' + Grid_Detail.GetGridData(Grid_Detail.row, 12) ;
                            var aValue = System.OpenModal( path , 1000 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                   
                            } 
					}
                break;
				case 'New':
						if(event.col == 0 || event.col == 1)
						{
                            var fpath = System.RootURL + "/form/61/04/61040080_Order_W_Div.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    Grid_Detail.SetGridText(Grid_Detail.row, 11,   aValue[0]);
									Grid_Detail.SetGridText(Grid_Detail.row, 0, aValue[1]);
									Grid_Detail.SetGridText(Grid_Detail.row, 1, aValue[2]);
									Grid_Detail.SetGridText(Grid_Detail.row, 2, aValue[3]);
                            }
						}
                break;
		}
}
//====================================================================================================================
function OnSearch()
{
	if(txtProject_Pk.text != '')
	{
		dso_search.Call('SELECT');
	}
	else
	{
		alert('Please select Project to search !!');
	}
}
//====================================================================================================================
function OnClick()
{
			txtPk.SetDataText(Grid_Detail.GetGridData(Grid_Detail.row, 10));
			
}
//====================================================================================================================
/*function OnNew()
{
		if(txtProject_Pk.text !='')
		{
			Grid_Detail.AddRow();
			Grid_Detail.SetGridText(Grid_Detail.rows -1, 12, txtProject_Pk.text);
			Grid_Detail.SetGridText(Grid_Detail.rows -1, 13, lstBudgetNo.value);
		}
		else
		{
			alert('Please select a project !!');	
		}
}*/
//====================================================================================================================
function OnSave()
{
			dso_update.Call();
}
//====================================================================================================================
function OnDelete()  
{
		if(confirm('Are you sure you want to delete !!'))
		{
			Grid_Detail.DeleteRow();
			dso_update.Call();
		}
}
//====================================================================================================================
function FormatGrid()
{ 
	var ctrl = Grid_Detail.GetGridControl();
	ctrl.ColFormat(3) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(4) = "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(5) = "#,###,###,###,###,###,###,###,###.##R";
}
function OnDataReceive(obj)
{         switch(obj.id)
         {
                case "dso_create":
						//FormatGrid();
						alert(txtReturn_Mess.text);
						dso_search.Call("SELECT");
				break;
				case "dso_budget_no":
						dso_search.Call("SELECT");
				break;
		 }
}
</script>
<body>
 <gw:data id="dso_update" onreceive="OnDataReceive(this)">
    <xml>
        <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="pm_sel_61040080"    procedure="pm_upd_61040080_1">
            <input bind="Grid_Detail">
                <input bind="txtProject_Pk"/>
                <input bind="lstBudgetNo"/>
            </input>
            <output bind="Grid_Detail"/>
        </dso>
    </xml>
</gw:data>

<gw:data id="dso_budget_no" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="SP_PRO_SEL_kpbp00070" > 
            <input> 
                <input bind="txtProject_Pk" />
            </input>
	       <output>
	            <output bind="lstBudgetNo" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>   

<gw:data id="dso_create" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="process" procedure="pm_pro_61040080" > 
            <input> 
                <input bind="txtProject_Pk" />
                <input bind="lstBudgetNo" />
            </input>
	       <output>
	            <output bind="txtReturn_Mess" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>

 <gw:data id="dso_search" onreceive="OnDataReceive(this)">
    <xml>
        <dso id="1" type="grid"  function="pm_sel_61040080"    >
            <input bind="Grid_Detail">
                <input bind="txtProject_Pk"/>
                <input bind="lstBudgetNo"/>
            </input>
            <output bind="Grid_Detail"/>
        </dso>
    </xml>
</gw:data>
    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height:1%;width:100%">
                        <td>
                            <fieldset style="width:100%;padding:0">
                                <table  style="width: 100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                        <td align="right" width="7%">
                                                            <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                                                Project&nbsp;</a></td>
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
                                                        <td width="25%" align="right">Budget Statement No.&nbsp;</td>
                                                        <td width="20%"><gw:list id="lstBudgetNo" onchange="OnSearch()" styles='width:100%' /></td>
                                                       
                                                        <td width="5%"></td>
														<td ><gw:imgbtn id="btSve2" img="search" alt="Search"  onclick="OnSearch()" /></td>
                                                        <td ><gw:button id="btSve2" img="create" alt="Create"  onclick="OnCreate()" /></td>
                                                        <td style="display:none"><gw:button id="btSve2" img="new" alt="New"  onclick="OnNew()" /></td>
                                                        <td  style="display:"><gw:button id="btSve2" img="save" alt="Save"  onclick="OnSave()" /></td>
                                                        <td  style="display:none"><gw:button id="btSve2" img="delete" alt="Delete"  onclick="OnDelete()" /></td>
                                            </tr>           
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%;width:100%">
                    	<!--header="0.Code|1.Order Work Division Name|2.Currency|3.BCWS|4.Net Construction Cost Total|5.Total Expenses|6.Safety Control Cost|7.Insurance Premium etc.|8.Others|9.Overhead Cost and Profit|10._pk|11._OrderWork_pk|12._Project_pk|13._Budget_pk"   -->
                       <td width="100%">
							<gw:grid 
							id="Grid_Detail"  
							header="Code|Order Work Division Name|Currency|BCWS|Net Construction Cost Total|Total Expenses|Safety Control Cost|Insurance Premium etc.|Others|Overhead Cost and Profit|_pk|_OrderWork_pk|_Project_pk|_Budget_pk"   
							format  ="0|0|0|1|1|1|1|1|1|1|0|0|0|0"  
							aligns    ="0|0|0|3|3|3|3|3|3|3|0|0|0|0"  
							defaults="|||||||||||||"  
							editcol ="0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1"  
							widths  ="1500|2500|900|2000|2500|2000|2000|2200|2000|2000|0|0|0|0"  
							styles="width:100%; height:100%"   
							sorting="T"
							oncellclick=""   
							oncelldblclick=""
							onafteredit="OnCaculator()"
							/> 
					   </td>
                    </tr>
                </table>
        <gw:textbox id="txtPk" styles='width:100%;display:none' />      
		 <gw:textbox id="txtReturn_Mess" styles='width:100%;display:none' />      
</body>
</html>
