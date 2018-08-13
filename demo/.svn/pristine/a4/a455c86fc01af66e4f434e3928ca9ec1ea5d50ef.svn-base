<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register Outside Order Work</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

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
        <%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 2,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
        <%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 4,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0010' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>; 
        <%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 8,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0011' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;  
		<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 9,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0017' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;  
		Grid_Detail.SetComboFormat(10, '#Y;Yes|#N;No');
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSelect()
{
    var _code = "";
    _code = Grid_Detail.GetGridData(Grid_Detail.row, 0).substring(0,1);
    txtWork_Code.text = _code;
}
function OnNew()
{
    if(txtProject_Pk.text != '')
    { 
        if(Grid_Detail.rows>1)
        {
            if(txtWork_Code.text != '')
            {
                    var j=0;
                    var _Work_Code = 0;
                    var _code = Grid_Detail.GetGridData(Grid_Detail.row, 0).substring(0,1);
                    var _tmp = Number(Grid_Detail.GetGridData(Grid_Detail.row, 0).substring(1,4));
                     for(j=1;j<Grid_Detail.rows;j++)
                     { 
                         if(_code==Grid_Detail.GetGridData(j,0).substring(0,1))
                         {
                            if(Number(Grid_Detail.GetGridData(j,0).substring(1,4))> Number(_tmp))
                            {
                                _tmp = Number(Grid_Detail.GetGridData(j,0).substring(1,4));
                            }
                         }
                     }
                      _tmp++; 
                    if(_tmp > 9 && _tmp < 100)
                    {
                        _Work_Code = '0' + _tmp;
                    }
                    else if(_tmp>100)
                    {
                        _Work_Code = _tmp;
                    }
                    else
                    {
                        _Work_Code = '00' + _tmp;
                    }
                //alert(Grid_Detail.GetGridData(Grid_Detail.row, 4));
			    var fpath = System.RootURL + "/form/61/04/61040010_popup_addnew.aspx?Project_pk=" + txtProject_Pk.text + '&Code=' + _code+ _Work_Code + '&Service_Type=' + Grid_Detail.GetGridData(Grid_Detail.row, 4) + '&Ccy=' + Grid_Detail.GetGridData(Grid_Detail.row, 2);
			    var obj = System.OpenModal( fpath , 600 ,500, 'resizable:yes;status:yes;');
			    OnSearch();
            }
            else
            {
                alert('Please select a row to add new !!');
            }
        }
        else
        {
            
            var fpath = System.RootURL + "/61/04/61040010_popup_addnew.aspx?Project_pk=" + txtProject_Pk.text + '&Code=C001' ;
			var obj = System.OpenModal( fpath , 600 ,500, 'resizable:yes;status:yes;');
			OnSearch();
        }
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
                            var fpath = System.RootURL + "/form/61/04/61040010_popup_Project.aspx";
                            var aValue = System.OpenModal( fpath , 600 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
									dso_update.Call("SELECT");
                            } 
                break;
                case 'Employee':
                        if(event.col == 13)
                        { 
                                var fpath = System.RootURL + "/form/61/04/61040010_popup_search_emp.aspx" ;
                                var obj = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes;');
                                if (obj!=null)
                                {
                                    Grid_Detail.SetGridText(Grid_Detail.row, 14, obj[0]) 
                                    //Grid_Detail.SetGridText(Grid_Detail.rows-1, 11, obj[1]) 
                                    Grid_Detail.SetGridText(Grid_Detail.row, 13, obj[2]) 
                                }
                        }
                        if(event.col == 0||event.col == 1)
                        { 
                               if(Grid_Detail.GetGridData(Grid_Detail.row,16)!="")
                                {
                                    var fpath = System.RootURL + "/form/61/04/61040010_popup.aspx?MasterPk="+ Grid_Detail.GetGridData(Grid_Detail.row,16);
                                    var obj = System.OpenModal( fpath , 600 ,400, 'resizable:yes;status:yes;');
                                    OnSearch();
                                }
                                else
                                {
                                    alert("Please Save Data first");
                                }
                                
                        }
                break;
        } 
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------

//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSave()
{
        dso_update.Call();
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
		if(txtProject_Pk.text != '')
		{
        		dso_update.Call('SELECT');
		}
		else
		{
				alert('Please select Project !!');	
		}
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDelete()
{
	if(confirm('Are you sure you want to delete?'))
	{
        Grid_Detail.DeleteRow();
		dso_update.Call();
	}
}
function OnPrint()
{
	var url = '/reports/61/04/61040010.aspx?p_TPS_PROJECT_PK='+txtProject_Pk.text;
	    System.OpenTargetPage( System.RootURL+url);
}
</script>

<body>
    <gw:data id="dso_update" onreceive=""> 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="pm_sel_61040010" procedure="pm_upd_61040010"   > 
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
                                <gw:button id="ibtnpdte" img="new" alt="New" onclick="OnNew()" />
                            </td>
                            <td>
                                <gw:button id="ibtnUpdate" img="save" alt="Save" onclick="OnSave()" />
                            </td>
                            <td>
                                <gw:button id="ibtUpdate" img="delete" alt="Delete" onclick="OnDelete()" />
                            </td>
							<td>
								<gw:button img="excel" alt="Print Out Report" text="Print" id="btnReport" onclick="OnPrint()" />
							</td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="4">
                <!--header="0.Code|1.Order Work Division Name|2.Currency|3.Domestic / Foreign Equipment Description|4.Service Type|5.Registered Work Division|6.Refer to Headoffice's Safety Control Cost Rate|7.Placement Order Expected Year/Month|8.Contract Type|9.Tax Exemption Rate|10.Quotation without Quantity  (Yes/No)|11.Outsource Change Times (Serial No.)|12.Progress Status|13.Responsible Person|14._emp_pk|15._pro_pk|16._pk"   -->
                <gw:grid id="Grid_Detail" 
                header="Work Division Code|Order Work Division Name|Currency|Domestic / Foreign Equipment Description|Service Type|Registered Work Division|Refer to Headoffices Safety Control Cost Rate|Placement Order Expected Month/Year|Contract Type|Tax Exemption Rate|Quotation without Quantity  (Yes/No)|Outsource Change Times (Serial No.)|Progress Status|Responsible Person|_emp_pk|_pro_pk|_pk"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    aligns="0|0|1|1|1|0|3|1|3|1|1|0|0|0|0|0|0"
                    defaults="||||||||||||||||" 
                    editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0" 
                    widths="2000|3000|1000|4000|1500|2500|4000|3500|1500|2500|3300|3200|1500|2500|0|0|0"
                    styles="width:100%; height:100%" 
                    sorting="T" 
                    oncelldblclick="OnPopUp('Employee')"
                    oncellclick="OnSelect()" />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtWork_Code" readonly="true" styles='width:100%;display:none' />
</body>
</html>
