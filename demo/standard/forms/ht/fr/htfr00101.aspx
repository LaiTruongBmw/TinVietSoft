<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>vina genuwin</title>
   <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var start_col = 4;
var total_night = '<%=Request.QueryString("total_night")%>';
function BodyInit()
{
	Bingding();
	//HideShowColumn();
	dtDate.SetDataText("<%=Request.QueryString("start_date")%>");
	OnSearch();
}

function Bingding()
{
	var data = '';
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE ||' - '|| NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE = 'RTYPE'")%>"; 
	data = data + '|ALL|Select All';
	lstRoomType.SetDataText(data);
	lstRoomType.value = 'ALL';
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
	data_htfr00101_0.Call("SELECT");
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
function BuildHeaderGrid2(){
	var first_days=Number(grdRoom.GetGridData(1,start_col+31));
	var last_day=Number(grdRoom.GetGridData(1,start_col+32));
	var first_day=Number(grdRoom.GetGridData(1,start_col+33));
	var col_idx;
	if(first_day > 1){
	    //alert(first_days +":"+last_day+":"+first_day)
		for(var i=0;i<=first_days;i++){
			grdRoom2.SetGridText(0,i+start_col,first_day+i); 
			grdRoom2.SetCellBgColor(0, i+start_col, 0, i+start_col,0xFFE9BD);//orginal header back ground color
		}
		
		for(var i=1;i<=(31-first_days);i++){
			grdRoom2.SetGridText(0,i+start_col+first_days,i);
			grdRoom2.SetCellBgColor(0, i+first_days+start_col, 0, i+first_days+3,0X5DFBF6);
		}
		
	}
	else
	{
		for(var i=0;i<=30;i++){
			grdRoom2.SetGridText(0,i+start_col,i+1);
			grdRoom2.SetCellBgColor(0, i+start_col, 0, i+start_col,0xFFE9BD);
		}
	}
}

function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "grdRoom" && event.row > 0 )
      {
	        if(CheckRoomAvailable(event.row)){
				
				var col_val = oGrid.GetGridData(event.row, 1 );
				
				if(event.row > 0 && ( !CheckDataExist(grdRoom2,col_val)))
				{
					SetRowBackGroundColor(oGrid,col_val,0x0000FF);
					grdRoom2.AddRow();
					for(var i=0;i<oGrid.cols;i++)
					{
					  grdRoom2.SetGridText(grdRoom2.rows-1,i,oGrid.GetGridData(event.row,i));
					}
				}
				BuildHeaderGrid2();
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
function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   if(oGrid.rows > 1)
   {   
      for(var i=1;i<oGrid.rows;i++)
      {
         var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
      }
      
	  if ( arr_data !=null )
	  {
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
   }	  
	  
}
function CheckDataExist(p_oGrid,p_value)
{
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, 1) == p_value)
              {
                 return true;
              }
       }
       return false;
}
function OnRemove()
{
  if(grdRoom.row > 0)
  {
    var col_val = grdRoom2.GetGridData( grdRoom2.row, 0);
    
    grdRoom2.RemoveRowAt(grdRoom2.row);
    
    SetRowBackGroundColor(grdRoom,col_val,0x000000); 
  }
}
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, 1) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
function OnSearch()
{
	data_htfr00101_0.Call("SELECT");
}
</script>

</head>
<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfr00101_0" onreceive="OnDataReceive(this)">
        <xml>
           <dso  type="grid"  function="ST_HT_SEL_HTFR00101_0" >
                <input  bind="grdRoom">
                    <input bind="dtDate" />
					<input bind="lstRoomType" />
					<input bind="txtRoom" />
                </input> 
                <output bind="grdRoom" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">Date</td>
                        <td style="width: 8%; white-space: nowrap">
							<gw:datebox id="dtDate" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
                        </td>		
						<td style="width: 5%; white-space: nowrap" align="right">Room</td>
                        <td style="width: 15%; white-space: nowrap">
							 <gw:textbox id="txtRoom" styles="width: 100%" onenterkey="OnSearch()" />
                        </td>	
						<td style="width: 5%; white-space: nowrap" align='right'> Type</td>
						<td style="width: 25%; white-space: nowrap">
							<gw:list id="lstRoomType" styles='width:100%' onchange='OnSearch()' />
						</td>
						<td style="width: 10%; white-space: nowrap">
							<gw:label id="lbCUS1"  styles="text-align: center; color: white; background-color: #ee82ee;width:100%;font-weight: bold;font-size:13" >INHOUSE 
							</gw:label>
						</td>
						 
						<td style="width: 10%; white-space: nowrap">
							<gw:label id="lbCUS2"  styles="text-align: center; color: white; background-color: #d7b3b3;width:100%;font-weight: bold;font-size:13" >RESERVED 
							</gw:label>
						</td>
						
						<td style="width: 10%; white-space: nowrap">
							<gw:label id="lbCUS3"  styles="text-align: center; color: white; background-color: #336633;width:100%;font-weight: bold;font-size:13" >GUARANTED 
							</gw:label>
						</td>
						<td style="width: 10%; white-space: nowrap">
							<gw:label id="lbCUS3"  styles="text-align: center; color: white; background-color: #969696;width:100%;font-weight: bold;font-size:13" >OUT OF ORDER 
							</gw:label>
						</td>
						
						<td style="width: 3%" >
							<gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
						</td>
						
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 72%">
            <td colspan="12">
                <gw:grid id='grdRoom' header='_PK|RM|Type|Name|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|_16|_17|_18|_19|_20|_21|_22|_23|_24|_25|_26|_27|_28|_29|_30|_31|_first_days|_last_day|_current_day'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" oncelldblclick='OnGridCellDoubleClick(this);' />
            </td>
        </tr>
		<tr style="height: 3%">
            <td style="width:94%"  colspan="10">
               
            </td>
			<td style="width: 3%">
                 <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
             </td>
             <td style="width: 3%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdRoom2)" />
             </td>
        </tr>

		 <tr style="height: 20%">
            <td  colspan="12">
                <gw:grid id='grdRoom2' header='_PK|RM|Type|Name|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|_16|_17|_18|_19|_20|_21|_22|_23|_24|_25|_26|_27|_28|_29|_30|_31|_first_days|_last_day|_current_day'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T"  />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
