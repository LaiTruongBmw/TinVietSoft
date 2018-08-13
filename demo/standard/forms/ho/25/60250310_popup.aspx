<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Room Allocate Popup</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var G_PK = 0,
	G_THT_BOOKINGD_PK=1,
	G_ROOM_NO = 2,
	G_GUEST_NAME = 3,
	G_CHECKIN_DATE = 4,
	G_CHECKOUT_DATE = 5,
	G_DAILY_RATE = 6;
function BodyInit()
{
    var data="";
	OnSearch(1);
}
function OnSearch(obj)
{
	switch(obj)
	{
		case 1:
			data_60250310_popup1.Call("SELECT");
		break;
	}
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "idGrid" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G_PK );
            
            if(event.row > 0 && ( !CheckDataExist(idGrid2,col_val)) )
            {
                SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		        idGrid2.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
            }
      }
      countItem()
}
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G_PK) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
function CheckDataExist(p_oGrid,p_value)
{
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_PK) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//------------------------------------------------------------------------------------------------
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
function OnDataReceive(obj)
{
	
   switch (obj.id) 
    {
		case 'data_60250310_popup1':
            lblRecord2.text = idGrid.rows-1 + " (s)";
        break;
		
	}
}
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G_PK);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    
    countItem()
  }
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
</script>
<body>
<!---------------------------------------------------------------->

<gw:data id="data_60250310_popup1" onreceive="OnDataReceive(this)"> 
    <xml> 
           <dso id="1" type="grid" function="ht_sel_60250310_popup1" > 
                <input>
				  	<input bind="txtRoomNo" />
				</input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
</gw:data>
<!---------------------------------------------------------------->
 <table style="width: 100%; height: 100%">
		<tr style="height: 1%">
			<td style="width: 8%" align="right">Room No</td>
			<td style="width: 20%" align="right">
				<gw:textbox id="txtRoomNo" styles="width:100%" csstype="mandatory" onenterkey="OnSearch(1)"/>
			</td>
			<td style="width: 14%" align="center">
                <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
            </td>
			<td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
			<td></td>
		</tr>
		 <tr style="height: 48%">
            <td colspan="5">
				<gw:grid id="idGrid" 
				    header="_PK|_THT_BOOKINGD_PK|Room No|Guest Name|Checkin Date|Checkout Date|Daily Rate"
                    format="0|0|0|0|4|4|-0" 
					aligns="0|0|0|0|0|0|3"
                    editcol="0|0|0|0|0|0|0" 
					widths="800|1700|1000|2000|1500|1500|1500"                
                    styles="width:100%; height:100%" acceptnulldate ="T" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
		<tr style="height: 1%">
			 <td colspan="5">
				<table>
                    <tr>
						<td style="width: 96%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" style="display: none" />
                          <!--  Duplicate-->
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" style="display: none" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
					</tr>
				</table>	
			 </td>
		</tr>
		<tr style="height: 49%">
            <td colspan="5">
                <gw:grid id="idGrid2" header="_PK|_THT_BOOKINGD_PK|Room No|Guest Name|Checkin Date|Checkout Date|Daily Rate"
                    format="0|0|0|0|4|4|-0" 
					aligns="0|0|0|0|0|0|0"
                    editcol="0|0|0|0|0|0|0" 
					widths="800|1800|1000|2000|1500|1500|1500"
					styles="width:100%; height:100%" acceptnulldate ="T" sorting="T" />
            </td>
        </tr>		
</table>
 <!------------------------------------------------------->
</body>