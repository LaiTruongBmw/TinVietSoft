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
		var _BCWS =  "<%=Request.querystring("BCWS")%>"; 
		var _NetContract = "<%=Request.querystring("NetContract")%>"; 
		var _Expense = "<%=Request.querystring("Expense")%>"; 
		
		txtBCWS.SetDataText(_BCWS);
		txtNet.SetDataText(_NetContract);
		txtExpenses.SetDataText(_Expense);
		//OnSearch();
}  
//====================================================================================================================
function BindingDataList()
{
	//var Status = "<%=ESysLib.SetListDataFUNC("SELECT acnt.SF_A_GET_COMMONCODE('ACBG0010') FROM DUAL")%>";
//	lstStatus.SetDataText(Status);
	var ls_OderWork = "<%=ESysLib.SetListDataSQL("SELECT ORDERINGCONTTYPECODE, ORDERINGCONTTYPENAME from TECPS_ORDERINGCONTTYPE where del_if = 0")%>";
	lstOrderWork.SetDataText(ls_OderWork);
}
//============================================================================================
function OnNew()
{
		Grid_Detail.AddRow();	
}
//============================================================================================
function OnSave()
{
			dso_update.Call();
}
//====================================================================================================================
function OnSearch()
{
		dso_update.Call('SELECT');
}
//====================================================================================================================
function OnDelete()
{
		if(confirm('Are you sure you want to delete ?'))
		Grid_Detail.DeleteRow();
		
}
//====================================================================================================================
function OnPopUp(obj)
{
		switch(obj)
		{
				case "Item":
					if(event.col == 0)
					{
							var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Budget.aspx";
							var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
							if(object != null)
							{
								Grid_Detail.SetGridText(Grid_Detail.row, 4,   object[0]);
								Grid_Detail.SetGridText(Grid_Detail.row, 0, object[1]);
							}
					}
				break;	
		}
}
</script>
<body>
 <gw:data id="dso_update" onreceive="">
    <xml>
        <dso type="grid"   parameter="0,1,2,3,4,5" function="ec111.sp_sel_kpbm00070_2" procedure="ec111.sp_upd_kpbm00070_2" >
            <input bind="Grid_Detail">
                <input bind="lstOrderWork"/>
                <input bind="txtBCWS"/>
                <input bind="txtNet"/>
                <input bind="txtExpenses"/>
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
                                                        <td width="8%" align="right"><a title="Placement Order Work Division" style="color:#333" >Order W. Div.</a>&nbsp;</td>
                                                        <td width="15%"><gw:list id="lstOrderWork" styles='width:100%' /></td>
                                                        <td width="10%" align="right"><a title="Budget Cost of Work Schedule" style="color:#333">BCWS</a>&nbsp;</td>
                                                        <td width="15%"><gw:textbox id="txtBCWS" type="number" format="###,###,###,###.##R" styles='width:100%' /></td>
                                                        <td width="12%" align="right"><a title="Net Construction Cost" style="color:#333">Net Const. Cost</a>&nbsp;</td>
                                                        <td width="15%"><gw:textbox id="txtNet" type="number" format="###,###,###,###.##R" styles='width:100%' /></td>
                                                        <td width="10%" align="right"><a title="All Expenditures" style="color:#333">All Exp.</a>&nbsp;</td>
                                                        <td width="15%"><gw:textbox id="txtExpenses" type="number" format="###,###,###,###.##R" styles='width:100%' /></td>
                                                        
                                                        
                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="search"  onclick="OnSearch()" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="new" alt="New"  onclick="OnNew()" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="save" alt="Save"  onclick="OnSave()" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="delete" alt="Delete"  onclick="OnDelete()" /></td>
                                            </tr>           
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%;width:100%">
                       <td width="100%">
                       					
								                    <gw:grid 
													            id="Grid_Detail"  
													            header="Item|Actual Calculation Formula|Application Amount|Remarks|_Item_pk|_pk"   
													            format  ="0|0|0|0|0|0"  
													            aligns  ="0|0|0|0|0|0"  
													            defaults="|||||"  
													            editcol ="0|0|0|0|0|0"  
													            widths  ="2000|3000|2000|2000|0|0"  
													            styles="width:100%; height:100%"   
													            sorting="T"
                                                                oncelldblclick="OnPopUp('Item')"
													            /> 
										        </td>
                    </tr>
                </table>
</body>
</html>
