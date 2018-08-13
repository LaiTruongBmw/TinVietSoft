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
	    BindingDataList();
}  
//============================================================================================
//============================================================================================
//====================================================================================================================
function BindingDataList()
{
	var Status = "<%=ESysLib.SetListDataFUNC("SELECT acnt.SF_A_GET_COMMONCODE('ACBG0010') FROM DUAL")%>";
	lstStatus.SetDataText(Status);
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
	//if(txtProject_Pk.text != '')
//	{
		var fpath = System.RootURL + "/form/kp/bm/kpbm00120_popup_Inquiry.aspx";
		var aValue = System.OpenModal( fpath , 1024 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
		if(aValue != null)
		{
				Grid_Detail.AddRow();
				Grid_Detail.SetGridText(Grid_Detail.rows - 1, 10, aValue[0]);  //level
				Grid_Detail.SetGridText(Grid_Detail.rows - 1, 0, aValue[1]); //code
				Grid_Detail.SetGridText(Grid_Detail.rows - 1, 1, aValue[2]); //name
				Grid_Detail.SetGridText(Grid_Detail.rows - 1, 2, aValue[3]); //ccy
		} 
	//}
//	else
//	{
//		alert('Please select a project !!');	
//	}
}
</script>
<body>
 <!--<gw:data id="dso_search" onreceive="">
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
                                                        <td width="10%" align="right">Budget No.&nbsp;</td>
                                                        <td width="15%"><gw:list id="lstBudgetNo" styles='width:100%' /></td>
                                                        <td width="8%" align="right">Status&nbsp;</td>
                                                        <td width="15%"><gw:list id="lstStatus" styles='width:100%' /></td>
                                                        <td width="2%"></td>
                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="Search"  onclick="OnSearch()" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="new" alt="New"  onclick="OnNew()" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="save" alt="Save"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="delete" alt="delete"  onclick="OnDelete()" /></td>
                                            </tr>           
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%;width:100%">
                       <td width="100%">
                       					
								                    			<gw:grid 
													            id="Grid_Detail"  
													            header="Code|Order Work Division Name|Currency|Budget Cost of Work Schedule|Net Construction Cost Total|Total Expenses|Safety Control Cost|Insurance Premium etc.|Others|Overhead Cost and Profit|_OrderWork_pk|_Project_pk|_pk"   
													            format  ="0|0|0|0|0|0|0|0|0|0|0|0|0"  
													            aligns  ="0|0|1|0|0|0|0|0|0|0|0|0|0"  
													            defaults="||||||||||||"  
													            editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0"  
													            widths  ="1500|2500|900|2000|2500|2000|2000|2200|2000|2000|0|0|0"  
													            styles="width:100%; height:100%"   
													            sorting="T"
                                                                oncelldblclick="OnPopUp('OrderWork')"   
													            /> 
										        </td>
                    </tr>
                </table>
</body>
</html>
