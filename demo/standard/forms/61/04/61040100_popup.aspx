<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Project</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
        System.Translate(document);
        BindingDataList();
	    OnSearch();
}  
//============================================================================= 
function OnSearch()
{
        dso_kpbm00091.Call("SELECT");
} 
//=============================================================================
function OnSave()
{
    dso_kpbm00091.Call();
}
//=============================================================================
function OnDelete()
{
     if ( grdFoder.row > 0 )
     {
        if ( grdFoder.GetGridData( grdFoder.row, 0) == '' ) //pk
        {
	        grdFoder.RemoveRowAt( grdFoder.row ); 			
	    }
	    else			
	    {
	        grdFoder.DeleteRow();
	    }
	}
}
//=============================================================================
function OnUnDelete()
{
    grdFoder.UnDeleteRow(); 
}
//=============================================================================  
function BindingDataList()
{
    <%=ESysLib.SetGridColumnComboFormat("grdFoder", 5,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0002' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>; 
    
}
//=============================================================================
function OnAddNew()
{
    grdFoder.AddRow();
}  
//=============================================================================
</script>

<body>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_kpbm00091">
        <xml>
            <dso type="grid" function="sp_sel_kpbm00091" parameter="0,1,2,3,4,5,6" procedure="sp_upd_kpbm00091">
                <input bind="grdFoder">
                    <input bind="txtBudget" /> 
                </input>
                <output bind="grdFoder"/>
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
        <tr style="height: 1%; width: 100%">
            <td>
                <fieldset style="width: 100%; padding: 0">
                    <table style="width: 100%" cellpadding="1" cellspacing="1">
                        <tr>
                            <td width="10%" align="right">
                                Budget</td>
                            <td width="80%">
                                <gw:textbox id="txtBudget" onenterkey="OnSearch()" styles='width:100%' />
                            </td>
                            <td>
                                <gw:imgbtn id="btSearch" img="search" alt="Search" onclick="OnSearch()" />
                            </td>
                            <td>
                                <gw:imgbtn id="btAddnew" img="new" alt="Add New" onclick="OnAddNew()" />
                            </td>
                            <td>
                                <gw:imgbtn id="btDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                            </td>
                            <td>
                                <gw:imgbtn id="btUndelete" img="Udelete" alt="UnDelete" onclick="OnUnDelete()" />
                            </td>
                            <td>
                                <gw:imgbtn id="btSave" img="Save" alt="Save" onclick="OnSave()" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 99%; width: 100%">
            <td width="100%">
                <gw:grid id='grdFoder' header='_PK|Budget Code|Budget Name|_Account_pk|Account Code|Category|Use YN'
                    format='0|0|0|0|0|0|3' aligns='0|0|0|0|0|0|0' check='||||||' editcol='1|1|1|1|1|1|1'
                    widths='1000|1200|1800|1000|1500|1400|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
</html>
