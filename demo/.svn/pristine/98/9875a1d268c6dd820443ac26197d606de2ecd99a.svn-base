<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>vina genuwin</title>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

    <script>
      function BodyInit()
      {
        Bingding();
		OnSearch();
      }
      function Bingding()
      {
        var data = "<%=CtlLib.SetListDataSQL("SELECT pk, room_no FROM  tht_room WHERE DEL_IF=0  order by room_no")%>|ALL|Select All";
	    lstRoomNo.SetDataText(data);
		lstRoomNo.value='ALL';
        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT pk, room_no FROM  tht_room WHERE DEL_IF=0  order by room_no" ) %> ";       
        grdPhone.SetComboFormat( 1, data );//room
      }
     function OnSearch(){
        dso_Phone.Call("SELECT");
      }
      function OnNew()
      {
        grdPhone.AddRow();
      }
      function OnDelete()
      {
        if(confirm("Do you want to delete ?"))
		{
			grdPhone.DeleteRow();
			dso_Phone.Call();
		}
      }
      function OnSave()
      {
		 if(CheckDataIsValid())
		 {
			dso_Phone.Call();
		}
      }
function CheckDataIsValid()
{
    for(var i=1;i<grdPhone.rows;i++)
    {
        if(grdPhone.GetGridData(i,1)=="")//room no
        {
            alert("Please choose room at row "+i);
            return false;
        }
    }
   return true;
}
 </script>

</head>
<body>
    <gw:data id="dso_Phone"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4" function="ht_sel_60290040" procedure="ht_upd_60290040">  
                <input bind="grdPhone">  
                    <input bind="lstRoomNo" /> 
                    <input bind="txtPhoneExt" />  															
                </input> 
                <output bind="grdPhone" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table width="100%" style="height: 100%">
        <tr style="height: 2%">
            <td width="8%">
                <b>Room No</b></td>
            <td width="13%">
                <gw:list id="lstRoomNo" onchange="OnSearch()"></gw:list>
            </td>
			<td width="3%">
                </td>
            <td width="9%">
                Phone Ext</td>
            <td width="21%">
                <gw:textbox id="txtPhoneExt" onenterkey="OnSearch()" />
            </td>
            <td width="32%">
                </td>
            <td with="3%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td with="3%">
                <gw:imgbtn id="btnNew" img="New" alt="New" onclick="OnNew()" />
            </td>
            <td with="3%">
                <gw:imgbtn id="btnDelete" img="Delete" alt="Delete" onclick="OnDelete()" />
            </td>
            
            <td with="3%">
                <gw:imgbtn id="btnSave" img="Save" alt="Save" onclick="OnSave()" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="10">
                <gw:grid id="grdPhone" header="_PK|Room No|Phone Ext|Point|Description"
                    format="0|0|0|0|0" aligns="0|0|0|0|0" defaults="||||" 
					editcol="0|1|1|1|1"
                    widths="1000|1000|1000|1000|1000" 
					sorting='T' autosize="T"
                    styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
</body>
</html>
