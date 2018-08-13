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
        var data1 = "<%=CtlLib.SetListDataSQL("select CODE, CODE||' - '||NAME from  TCO_COMMCODE where del_if=0 and PARENT_CODE='RTYPE' and use_yn='Y' " )%>|ALL|Select All"; 
         var data4 = "<%=CtlLib.SetListDataSQL("select CODE, NAME from  TCO_COMMCODE where del_if=0 and PARENT_CODE='RSTA'" )%>|ALL|Select All";
         
         //<%=CtlLib.SetGridColumnComboFormat("grdRoom", 5, "select PARENT_CODE, NAME from  TCO_COMMCODE where del_if=0 and PARENT_CODE='RTYPE'")%>; 
        // <%=CtlLib.SetGridColumnComboFormat("grdRoom", 6, "select PARENT_CODE, NAME from  TCO_COMMCODE where del_if=0 and PARENT_CODE='RSTA'")%>;   
        lstRoomType.SetDataText(data1);
        lstRoomType.value="ALL";
        lstStatus.SetDataText(data4);
        lstStatus.value="ALL";
        var data5 = "<%=CtlLib.SetGridColumnDataSQL("select CODE, CODE||' - '||NAME from  TCO_COMMCODE where del_if=0 and PARENT_CODE='RTYPE' and use_yn='Y' " ) %> ";               
        
        grdRoom.SetComboFormat( 5, data5 );
        var data6 = "<%=CtlLib.SetGridColumnDataSQL("select CODE, NAME from  TCO_COMMCODE where del_if=0 and PARENT_CODE='RSTA'" ) %> ";       
        grdRoom.SetComboFormat( 6, data6 );
      }
     function OnSearch(){
        dsoRoom.Call("SELECT");
      }
      function OnNew()
      {
        grdRoom.AddRow();
        var roomtype,status;
            roomtype =lstRoomType.value;
            status = lstStatus.value;
        for(var i=1;i<grdRoom.rows;i++)
            if((grdRoom.GetGridData(i, 5)  == "" && roomtype != "ALL") ||(grdRoom.GetGridData(i, 6)  == "" && status != "ALL"))
                {
                    if(grdRoom.GetGridData(i, 5)  == "" && roomtype != "ALL")
                     {
                            grdRoom.SetGridText( i , 5, roomtype);
                     }   
                    if(grdRoom.GetGridData(i, 6)  == "" && status != "ALL")
                     {
                            grdRoom.SetGridText( i , 6, status);
                     }   
                }
             /*else if(grdRoom.GetGridData(i, 6)  == "" && status != "ALL")
             {
                    grdRoom.SetGridText( i , 6, status);
             } */  
      }
      function OnDelete()
      {
        grdRoom.DeleteRow();
      }
      function UnDelete()
      {
        grdRoom.UnDeleteRow();
      }
      function OnSave()
      {
         dsoRoom.Call();
      }
    </script>

</head>
<body>
    <gw:data id="dsoRoom"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="ht_sel_60290030" procedure="ht_upd_60290030">  
                <input bind="grdRoom"   >  
                    <input bind="txtRoomNo" /> 
                    <input bind="txtFloor" /> 
                    <input bind="lstRoomType" />
                    <input bind="lstStatus" />	       															
                </input> 
                <output bind="grdRoom" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table width="100%" style="height: 100%">
        <tr style="height: 2%">
            <td width="8%">
                <b>Room No</b></td>
            <td width="8%">
                <gw:textbox id="txtRoomNo" onenterkey="OnSearch()" />
            </td>
            <td width="7%">
                Floor</td>
            <td width="8%">
                <gw:textbox id="txtFloor" onenterkey="OnSearch()" />
            </td>
            <td width="12%">
                Room Type</td>
            <td width="20%">
                <gw:list id="lstRoomType" onchange="OnSearch();"></gw:list>
            </td>
            <td width="6%">
                Status</td>
            <td width="23%">
                <gw:list id="lstStatus" onchange=""></gw:list>
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
                <gw:imgbtn id="btnUnDelete" img="UDelete" alt="UnDelete" onclick="UnDelete()" />
            </td>
            <td with="3%">
                <gw:imgbtn id="btnSave" img="Save" alt="Save" onclick="OnSave()" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="13">
                <gw:grid id="grdRoom" header="_PK|Building No|Area No|Floor No|Room No|Room Type|_Room Status|Max Adult|Max Child|Description|Use YN"
                    format="0|0|0|0|0|0|0|-|-|0|3" aligns="0|0|0|0|0|0|0|3|3|0|0" defaults="||||||||||" editcol="0|1|1|1|1|1|1|1|1|1|1"
                    widths="1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000" sorting='T' autosize="T"
                    check="|0|0|0n|0|0|||||" styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
</body>
</html>
