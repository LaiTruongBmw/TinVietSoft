<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head>
    <title>Get Room</title>
</head>

<script type="text/javascript" language="javascript">
//-------------------------------------------------
    function BodyInit()
    {
        var data1 = "<%=CtlLib.SetListDataSQL("select CODE, NAME from  TCO_COMMCODE where del_if=0 and PARENT_CODE='RTYPE'" )%>|ALL|Select All"; 
        lstRoomType.SetDataText(data1);
        lstRoomType.value="ALL";
        OnSearch();
    }
 //------------------------------------------------

    function OnSearch()
    {
        data_htfo00060_01.Call("SELECT")    
    }
    //-------------------------------------------------

    function RowDbClick()
    {
        var code_data=new Array()
	    var ctrl = idGrid.GetGridControl();
	    var index, rowNo
	    index =0;
	    rowNo = 0
	    if(ctrl.SelectedRows == 0)
        {
               return ;
        }
        else
	    {
	         for(i=0;i<ctrl.SelectedRows;i++)
			    {	  
		            rowNo = ctrl.SelectedRow(i)
		            for(j=0;j< idGrid.cols -1; j++)
		            {
	                    code_data[index] = idGrid.GetGridData(rowNo , j );
	                    index ++;
                    } 
                    
			    }
	    }
	    window.returnValue = code_data; 
	    this.close(); 	
    }
    //-------------------------------------------------

</script>

<body>
    <!----------------------------------------------------->
    <gw:data id="data_htfo00060_01" onreceive=""> 
        <xml> 
           <dso id="1" type="grid" function="st_ht_sel_60250020_n_inhouse" > 
                  <input bind="idGrid" > 
                    <input bind="txtRoomNo" /> 
                    <input bind="txtFloorNo" /> 
                    <input bind="lstRoomType" />
                    </input> 
                <output bind="idGrid" />    
            </dso> 
        </xml> 
    </gw:data>
    <!-- --------------------------------------------------  -->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 10%; white-space: nowrap" align="right">
                </td>
            <td style="width: 15%" align="left">
                <gw:textbox id="txtFloorNo" styles="width:100%;display:none"  onenterkey="OnSearch()" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="right">
                Room No</td>
            <td style="width: 15%">
                <gw:textbox id="txtRoomNo" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 14%">Room Type
            </td>
            <td style="width: 35%"><gw:list id="lstRoomType" onchange="OnSearch()"></gw:list>
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="7">
                <gw:grid id="idGrid" header="_PK|Floor No|Room No|Room Type|Guest Name"
                    format="0|0|0|0|0" aligns="0|0|0|0|0" defaults="||||" editcol="0|0|0|0|0"
                    widths="0|1500|2000|2000|2000|2000" styles="width:100%; height:100%" sorting="T" autosize="T"
                    oncelldblclick="RowDbClick()" param="0,1,2,3,4" />
            </td>
        </tr>
    </table>
</body>
</html>
