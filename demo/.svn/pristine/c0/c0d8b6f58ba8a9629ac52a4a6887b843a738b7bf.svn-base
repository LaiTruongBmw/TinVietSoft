<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>vina genuwin</title>
    <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var start_col=3;
var total_night = '<%=Request.QueryString("total_night")%>';
function BodyInit()
{
	Bingding();
	//HideShowColumn();
	dtDate.SetDataText("<%=Request.QueryString("start_date")%>")
	OnSearch();
}

function Bingding()
{
	var data = '';
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE = 'RTYPE'")%>"; 
	data = data + '|ALL|Select All';
	lstRoomType.SetDataText(data);
	lstRoomType.value = '<%=Request.QueryString("room_type")%>';
	//dtDate.SetDataText(System.AddMonth(dtDate.GetData(),1));

}
function OnDataReceive()
{
	//grdRoom.SetCellBgColor(0, 34, 0, grdRoom.cols-1,0XCC00FF);	
if (grdRoom.rows > 1)
	{
	    BuildHeader();
		//return;
		grdRoom.GetGridControl().FrozenCols =3;
		for (row = 1; row < grdRoom.rows; row ++ )
		{
			for (col = start_col; col < grdRoom.cols-4; col++ )
			{
				data = grdRoom.GetGridData(row, col);

				switch(data)
				{
					case 'OCC':         
						grdRoom.SetCellBgColor(row, col, row, col,0XEE82EE);
						//grdRoom.SetGridText(row, col, '');
					break;
					case 'RE':
						grdRoom.SetCellBgColor(row, col, row, col, 0xB3B3D7);
						//grdRoom.SetGridText(row, col, '');
					break;
					case 'GU':
						grdRoom.SetCellBgColor(row, col, row, col, 0x336633);
						//grdRoom.SetGridText(row, col, '');
					break;
					case 'OOO':
						grdRoom.SetCellBgColor(row, col, row, col, 0x969696);
						//grdRoom.SetGridText(row, col, '');
					break;
				}
			}
		}
	}
}

function OnSearch()
{
	dsoRoom.Call("SELECT");
}
function BuildHeader(){
	var first_days=Number(grdRoom.GetGridData(1,start_col+31));
	var last_day=Number(grdRoom.GetGridData(1,start_col+32));
	var first_day=Number(grdRoom.GetGridData(1,start_col+33));
	var col_idx;
	if(first_day > 1){
	    //alert(first_days +":"+last_day+":"+first_day)
		for(var i=0;i<=first_days;i++){
			grdRoom.SetGridText(0,i+start_col,first_day+i); 
			grdRoom.SetCellBgColor(0, i+start_col, 0, i+start_col,0xFFE9BD);//orginal header back ground color
		}
		
		for(var i=1;i<=(31-first_days);i++){
			grdRoom.SetGridText(0,i+start_col+first_days,i);
			grdRoom.SetCellBgColor(0, i+first_days+start_col, 0, i+first_days+start_col,0X5DFBF6);
		}
		
	}
	else
	{
		for(var i=0;i<=30;i++){
			grdRoom.SetGridText(0,i+start_col,i+1);
			grdRoom.SetCellBgColor(0, i+start_col, 0, i+start_col,0xFFE9BD);
		}
	}
	//grdRoom.GetGridControl().TopRow=grdRoom.rows-1;
}
function OnReport()
{
        var url =System.RootURL + '/reports/ht/fo/rpt_htfo00110.aspx?month=' + dtDate.value ;
	    window.open(url, "_blank");
}
//=========================================================================

function OnReportRS()
{
        var url =System.RootURL + '/reports/ht/fo/rpt_htfo00111.aspx?month=' + dtDate.value ;
	    window.open(url, "_blank");
}
function OnPopupGetName()//OnShowDetail()
{
    //alert(grdRoom.col);
    var Tmp_dd= grdRoom.col;
	
	var col_header=grdRoom.GetGridData(0, Tmp_dd);
    var dd;
    if(Number(col_header) < 10)
    {
        dd= "0"+""+col_header;
    }
    else
    {
        dd=col_header;
    }
	
    var yyyymm = dtDate.GetData();
	var color_header=grdRoom.GetCellBgColor(0, grdRoom.col, 0, grdRoom.col);
	var color_header=grdRoom.GetCellBgColor(0, grdRoom.col, 0, grdRoom.col);
    var date= yyyymm+dd;
    var room_pk=grdRoom.GetGridData(grdRoom.row, 0);//room pk
    var color=grdRoom.GetCellBgColor(grdRoom.row, grdRoom.col, grdRoom.row, grdRoom.col);
    if(color != 0)
    {
		if(color == '206')
		{
			return false;
		}
        var path = System.RootURL + "/form/ht/fo/htfo00110_popup.aspx?p_room_pk="+room_pk+"&p_date="+date+"&p_color="+color+"";
            var object = System.OpenModal( path ,630 , 350 ,  'resizable:yes;status:yes');
    }
    else
    {
        alert("room empty");
    }
}
function OnGetRoom()
{
	var ctrl = grdRoom.GetGridControl();
	var rtn_value = new Array();
	var index = 0;

	if (grdRoom.row > 0)
	{
	    if(CheckRoomAvailable(grdRoom.row )){
			for(j = 0; j < grdRoom.cols -1; j++)
			{
				rtn_value[index] = grdRoom.GetGridData(grdRoom.row, j );
				index ++;
			}
			
			window.returnValue = rtn_value; 
			this.close();
		}
	}
}
function CheckRoomAvailable(row){
	for(var i=0;i<total_night;i++){
		if(grdRoom.GetGridData(row,i+start_col) != ""){
			alert("This room is not available. Please select another room.");
			return false;
		}
	}
	return true;
}
</script>

</head>
<body>
    <!----------------------------------------------------------------------->
    <gw:data id="dsoRoom" onreceive="OnDataReceive(this)">
        <xml>
           <dso  type="grid"  function="ht_sel_60240010_room_popup" >
                <input  bind="grdRoom">
                    <input bind="dtDate" />
					<input bind="lstRoomType" />
					<input bind="txtRoom" />
                </input> 
                <output bind="grdRoom" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">Date</td>
                        <td style="width: 8%; white-space: nowrap">
							<gw:datebox id="dtDate" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
                        </td>	
						<td style="width: 5%; white-space: nowrap" align="right">Room</td>
                        <td style="width: 8%; white-space: nowrap">
							 <gw:textbox id="txtRoom" styles="width: 100%" onenterkey="OnSearch()" />
                        </td>	
						<td style="width: 5%; white-space: nowrap" align='right'>Type</td>
						<td style="width: 21%; white-space: nowrap">
							<gw:list id="lstRoomType" styles='width:100%' onchange='OnSearch()' />
						</td>
						<td style="width: 10%; white-space: nowrap">
							<gw:label id="lbCUS1"  styles="text-align: center; color: white; background-color: #ee82ee;width:100%;font-weight: bold;font-size:13" >INHOUSE 
							</gw:label>
						</td>
						<td style="width: 2%; white-space: nowrap"></td>       
						<td style="width: 10%; white-space: nowrap">
							<gw:label id="lbCUS2"  styles="text-align: center; color: white; background-color: #d7b3b3;width:100%;font-weight: bold;font-size:13" >RESERVED 
							</gw:label>
						</td>
						<td style="width: 2%; white-space: nowrap"></td>
						<td style="width: 10%; white-space: nowrap">
							<gw:label id="lbCUS3"  styles="text-align: center; color: white; background-color: #336633;width:100%;font-weight: bold;font-size:13" >GUARANTED 
							</gw:label>
						</td>
						<td style="width: 10%; white-space: nowrap">
							<gw:label id="lbCUS3"  styles="text-align: center; color: white; background-color: #969696;width:100%;font-weight: bold;font-size:13" >OUT OF ORDER 
							</gw:label>
						</td>
						<td style="width: 2%; white-space: nowrap"></td>
						<td style="width: 1%" >
							<gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
						</td>
						<td style="width: 10%; white-space: nowrap">
						</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
           <td>
                <gw:grid id='grdRoom' header='_PK|RM|Type|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|_first_days|_last_day|_current_day'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" oncelldblclick='OnGetRoom();' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
