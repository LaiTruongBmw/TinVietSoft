<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Menu Location Entry</title>
</head>

<script>
function BodyInit()
{
     var data = "<%=CtlLib.SetGridColumnDataSQL("SELECT PK, MENU_NAME FROM  THT_MENU WHERE DEL_IF=0")%>";
	 grdLocationEntry.SetComboFormat(1, data);//Menu
	 data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='POINT' AND USE_YN = 'Y'")%>";
	 grdLocationEntry.SetComboFormat(2, data);//lstLocation
	 data = "<%=CtlLib.SetListDataSQL("SELECT PK, MENU_NAME FROM  THT_MENU WHERE DEL_IF=0" )%>"; 
	 lstMenu.SetDataText(data);
	 data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='POINT' AND USE_YN = 'Y'" )%>"; 
	 lstLocation.SetDataText(data);
	 OnSearch();
}
function OnSearch()
{
    dsoGrdLocationEntry.Call("SELECT");
}
function OnDelete()
{
    if (confirm('Are you sure delete data ?'))
		{
             grdLocationEntry.DeleteRow();
             dsoGrdLocationEntry.Call(); 
              
        } 
}
function OnNew()
{
    grdLocationEntry.AddRow();
    grdLocationEntry.SetGridText(grdLocationEntry.rows-1, 1, lstMenu.value);//lstMenu
    grdLocationEntry.SetGridText(grdLocationEntry.rows-1, 2, lstLocation.value);//lstLocation
    grdLocationEntry.SetGridText(grdLocationEntry.rows-1, 3, -1);//YN
}
function OnSave()
{
     dsoGrdLocationEntry.Call();    
}
</script>

<body bgcolor='#F5F8FF'>
    <gw:data id="dsoGrdLocationEntry"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3" function="st_ht_sel_60270020" procedure="st_ht_upd_60270020">  
                <input bind="grdLocationEntry"   >  
                    <input bind="lstMenu" />  
                    <input bind="lstLocation" />  	 															
                </input> 
                <output bind="grdLocationEntry" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td width="10%">
                            Menu
                        </td>
                        <td width="33%">
                            <gw:list id="lstMenu" styles='width:100%' onchange="OnSearch()" />
                        </td>
                        <td width="10%">
                            Location
                        </td>
                        <td width="33%">
                            <gw:list id="lstLocation" styles='width:100%' onchange="OnSearch()" />
                        </td>
                        <td width="2%">
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnNew()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="9">
                            <gw:grid id='grdLocationEntry' header='_pk|Menu|Location|Use YN'
                                format='0|0|0|3' aligns='0|0|0|0' defaults='|||' editcol='1|1|1|1'
                                widths='1000|1500|1500|1500' sorting='T' autosize="T" styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
