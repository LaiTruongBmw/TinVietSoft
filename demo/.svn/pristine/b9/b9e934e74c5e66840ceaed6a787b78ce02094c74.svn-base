<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get One Item</title>
</head>
<%  ESysLib.SetUser("mafg")
  
%>

<script>
function BodyInit()
{
    System.Translate(document);
    Binding();
    txtEmployee.GetControl().focus();
}
function Binding()
{
    var data;
     data   = "<%=ESysLib.SetListDataSQL("select  pk, dept_id ||'-'|| dept_nm from comm.tco_dept where del_if=0 order by 2")%>|ALL|Select all";
     lstDepartment.SetDataText(data);
     lstDepartment.value='ALL';
}

function OnSearch()
{
   data_employee_popup.Call("SELECT"); 
}
function OnSelect(oGrid)
{
        var code_data = new Array();       
	    
	    if ( oGrid.row > 0 )
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = oGrid.GetGridData(oGrid.row , j );
            } 
	    }
	    else
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = '';
            } 	    
	    }
	    //----------------------------
	    window.returnValue = code_data; 
	    this.close(); 	
}

//---------------------------------------------------------------------------
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_employee_popup" > 
    <xml> 
           <dso id="1" type="grid" function="MAFG.sp_sel_employee_popup" > 
                  <input bind="idGrid" > 
                    <input bind="lstDepartment" />
                    <input bind="txtEmployee" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Department
            </td>
            <td style="width: 44%">
                <gw:list id="lstDepartment" styles="width:100%" onchange="OnSearch()" csstype="mandatory" />
            </td>
            <td style="width: 5%" align="right">
                Employee
            </td>
            <td style="width: 44%">
                <gw:textbox id="txtEmployee" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid)" />
            </td>
        </tr>
        <tr style="height: 47%">
            <td colspan="6">
                <gw:grid id="idGrid" header="_emp_pk|Emp ID|Full Name|_dept_pk|Dept ID|Dept Name"
                    format="0|0|0|0|0|0" aligns="0|0|0|0|0|0"
                    autosize="true"
                    editcol="0|0|0|0|0|0" widths="1500|1500|1500|1500|1500|1500"
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnSelect(idGrid)" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
    
    <!---------------------------------------------------------------->
</body>
</html>
