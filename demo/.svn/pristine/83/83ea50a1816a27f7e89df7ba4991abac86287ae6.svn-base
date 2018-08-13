<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Seach List</title>
  </head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>

function BodyInit()
{
	System.Translate(document);
	<%=ESysLib.SetGridColumnComboFormat("grGrid", 1,"SELECT trim(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0020' AND A.USE_IF = 1")%>;
    <%=ESysLib.SetGridColumnComboFormat("grGrid", 2,"SELECT '0', '0' FROM DUAL UNION SELECT '1', '1' FROM DUAL UNION SELECT '2', '2' FROM DUAL UNION SELECT '3', '3' FROM DUAL UNION SELECT '4', '4' FROM DUAL UNION SELECT '5', '5' FROM DUAL UNION SELECT '6', '6' FROM DUAL")%>;
    <%=ESysLib.SetGridColumnComboFormat("grGrid", 3,"SELECT trim(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0240' AND A.USE_IF = 1 ORDER BY A.CODE_NM")%>;
	<%=ESysLib.SetGridColumnComboFormat("grGrid", 7,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0270' AND A.USE_IF = 1")%>;    
	var ls_compk = "<%=Request.querystring("com_pk")%>";
	lstCompany.SetDataText(ls_compk);
	lstLevel.SetDataText("");
	onSearch();
}

function onSave()
{
    if (onCheckData())
    {
        var i = 0;
        for(i=1; i < grGrid.rows; i++)
        {
                grGrid.SetGridText(i, 10, lstCompany.GetData());
        }    
        dso_search.Call();
    }
}

function onDelete()
{
    var ctrl 	= grGrid.GetGridControl();
	var rownum 	= Number(ctrl.Row);
	var rownums = Number(ctrl.Rows);
	
	if ((rownums > 1) && (rownum > 0))
	{
		if (confirm("Are you sure you want to delete?"))
		{
			for(i=1; i<rownums; i++)
			{
				if (ctrl.isSelected(i) == true)
                {
				    grGrid.DeleteRow();
				}
			}
		}
	}
	else
	{
		alert("Please select row for delete.");
	}
}

function onNew()
{
    
    grGrid.DeselectRow(grGrid.selrow);
	grGrid.AddRow();
	grGrid.SelectRow(grGrid.rows - 1);
    
}

function ChangeColor()
{
    var ctrl = grGrid.GetGridControl();	        
    for (i = 1; i < ctrl.Rows; i++)
	{
	    if(grGrid.GetGridData(i,7)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 9) = false;
	        grGrid.SetCellBold(i, 1, i, 9, true);
        }
        else if (grGrid.GetGridData(i,7)== "I")
        {
	        grGrid.SetCellBold(i, 1, i, 9, false);
	        ctrl.Cell(14, i, 1, i, 9) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 9) = false;
	        grGrid.SetCellBold(i, 1, i, 9, false);
	    }
	    grGrid.SetCellBgColor(i, 0, i, 9, Number(grGrid.GetGridData(i, 3)));
	}
}

function onSearch()
{
    dso_search.Call('SELECT');
}

function onCheckData()
{
    var ctrl = grGrid.GetGridControl();
    for (i = 1; i < ctrl.rows - 1; i++)
    {
        var lv_i = grGrid.GetGridData(i,1);
        for (j = i + 1; j < ctrl.Rows; j++)
        {
            var lv_j = grGrid.GetGridData(j,1);
            if (lv_i == lv_j)
            {
                alert('Duplicate Level. Please Choose again!!!'+'\n'+'  Trùng cấp level. Bạn hãy chọn lại!!!')
                return false;
            }
        }
    }
    return true;
}

</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_search" onreceive="ChangeColor()">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="pm_sel_61010130_popup" procedure="pm_upd_kpac1013_popup">
                <input bind="grGrid">
                    <input bind="lstCompany"/>
                    <input bind="lstLevel"/>
                </input>
                <output bind="grGrid"/>
            </dso>
        </xml>
    </gw:data>
    
    
<table border="1" style="width:100%;height:100%" cellpadding="0" cellspacing="0">
<tr>
    <td width="100%">
    	<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="height:2%">
            <td width="100%">
	            <table cellpadding="0" cellspacing="0" width="100%" height="100%" align="left" border="0">
			    <tr>
                    <td width="10%" align="right">Company</td>
                    <td width="60%"><gw:list id="lstCompany" onChange="onSearch()"><data><%=ESysLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%></data></gw:list></td>
                    <td width="10%" align="right">Level</td>
				    <td width="20%">
					    <gw:list id="lstLevel" onChange="onSearch()" ><data><%=ESysLib.SetListDataSQL("SELECT trim(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0020' AND A.USE_IF = 1")%>||</data></gw:list>
				    </td>
				    <td width="50%"></td>
				    <td width="10%">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        <tr>
				            <td ><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
				            <td ><gw:imgBtn id="ibtnNew"    img="new"       alt="New"           onclick="onNew()"/></td>
				            <td ><gw:imgBtn id="ibtnSave"   img="save"      alt="Save"          onclick="onSave()"/></td>
				            <td ><gw:imgBtn id="ibtnDelete" img="delete"    alt="Delete"        onclick="onDelete()"/></td>
				        </tr>
				        </table>
				    </td>
                </tr>
		        </table>
            </td>
	    </tr>
	    <tr style="height:98%">
	        <td width="100%">
                <gw:grid   
				    id      ="grGrid"
				    header  ="_PK|Level|Code Digit|Color|Print|Balance Option|Rename|Font Stype|Pre Empty|Post Empty|_ComPK"
				    format  ="0|0|2|0|3|3|3|0|3|3|0"
				    aligns  ="0|1|0|1|0|0|0|1|0|0|0"
				    defaults="|1|6|0XFFFFFF|-1|-1|-1|R|||"
				    editcol ="1|1|1|1|1|1|1|1|1|1|1"
				    widths  ="0|1200|1500|1500|1000|1500|1000|1400|1000|1000|0"
				    styles  ="width:100%; height:100%"
				    sorting ="F"
				    OnSelChange ="ChangeColor()"/>
            </td>
	    </tr>
	    </table>
	</td>
</tr>	
</table>

</body>
</html>