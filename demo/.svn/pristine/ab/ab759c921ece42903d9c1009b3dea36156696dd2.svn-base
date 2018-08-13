<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register Outside Order Work</title>
</head>
<%  ESysLib.SetUser("ec111")%>

<script>
function BodyInit()
{
      System.Translate(document);
      BindingDataList();

}    
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function BindingDataList()
{
        <%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 3,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0009' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;
        <%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 2,"SELECT A.CODE, A.CODE FROM COMM.TCO_ABCODE A, COMM.TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
        <%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 4,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0010' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>; 
        <%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 7,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0011' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;  
		<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 8,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0017' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;  
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnNew()
{
        if(txtProject_Pk.text != '')
        { 
            Grid_Detail.AddRow();
            Grid_Detail.SetGridText(Grid_Detail.rows-1, 14, txtProject_Pk.text) 
        }
        else
        {
            alert('Please select the Project first !!');
        }   
}  
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Project':
                            var fpath = System.RootURL + "/form/kp/bp/kpbp00020_popup_Project.aspx";
                            var aValue = System.OpenModal( fpath , 600 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
                            } 
                break;
                case 'Employee':
                        if(event.col == 11)
                        { 
                                var fpath = System.RootURL + "/form/ch/ae/chae00010_search_emp.aspx" ;
                                var obj = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes;');
                                if (obj!=null)
                                {
                                    Grid_Detail.SetGridText(Grid_Detail.rows-1, 13, obj[0]) 
                                    Grid_Detail.SetGridText(Grid_Detail.rows-1, 11, obj[1]) 
                                    Grid_Detail.SetGridText(Grid_Detail.rows-1, 12, obj[2]) 
                                }
                        }
                       /* if(event.col == 0||event.col == 1)
                        { 
                                if(Grid_Detail.GetGridData(Grid_Detail.row,15)!="")
                                {
                                    var fpath = System.RootURL + "/form/kp/bm/kpbm00011.aspx?MasterPk="+ Grid_Detail.GetGridData(Grid_Detail.row,15);
                                    var obj = System.OpenModal( fpath , 600 ,350, 'resizable:yes;status:yes;');
                                    OnSearch();
                                }
                                else
                                {
                                    Alert("Please Save Data first");
                                }
                                
                        }*/
						else
                        { 
								var code_data=new Array()
								var ctrl = Grid_Detail.GetGridControl();
								code_data[0] = Grid_Detail.GetGridData( ctrl.row , 15 ); //pk
								code_data[1] = Grid_Detail.GetGridData( ctrl.row , 0 );//  Code
								code_data[2] = Grid_Detail.GetGridData( ctrl.row , 1 ); // Name
								code_data[3] = Grid_Detail.GetGridData( ctrl.row , 2 ); // Currency
								window.returnValue = code_data; 
								this.close(); 	
						}
                break;
        } 
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function DblClick()
{
        
}    
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSave()
{
        dso_update.Call();
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
        dso_update.Call('SELECT');
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDelete()
{
	if(confirm('Are you sure you want to delete?'))
	{
        Grid_Detail.DeleteRow();
	}
}
</script>

<body>
    <gw:data id="dso_update" onreceive=""> 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="ec111.sp_sel_kpbm00010" procedure="ec111.sp_upd_kpbm00010"   > 
            <input bind="Grid_Detail">                    
                <input bind="txtProject_Pk" /> 
            </input> 
            <output bind="Grid_Detail" /> 
        </dso> 
    </xml> 
</gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td width="100%">
                <fieldset style="padding: 0">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="right" width="6%">
                                <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                    Project&nbsp;</a></td>
                            <td width="50%">
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
                            <td width="30%">
                            </td>
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
                </fieldset>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="4">
                <!-- header=" 0.Outside Work Code | 1.Outside Work Name | 2.Currency | 3.Domestic / Foreign Equipment Description | 4.Service Description | 5.Work | 6.Expected Order Date (MM/YY) | 7.Contract Method | 8.Tax Exemption Rate (%) | 9.Subcontract Revision No | 10.Status | 11.Person In Charger"   -->
                <gw:grid id="Grid_Detail" header="Outside Work Code|Outside Work Name|Currency|Domestic / Foreign Equipment Description|Service Description|Work|Expected Order Date (MM/YYYY)|Contract Method|Tax Exemption Rate (%)|Subcontract Revision No|Status|Person In Charger Code|Person In Charger Name|_emp_pk|_pro_pk|_pk"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|1|1|1|0|1|1|3|0|1|0|0|0|0|0"
                    defaults="|||||||||||||||" editcol="1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0" widths="2000|3000|1000|4000|3000|2000|3000|2000|2500|2500|1500|2200|2500|0|0|0"
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnPopUp('Employee');" />
            </td>
        </tr>
    </table>
</body>
</html>
