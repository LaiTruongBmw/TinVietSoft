<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Room Allocated Status</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script> 
//G2 is grdSpecialServiceSetup
//G3 is grdSpecialService
var G2_pk=0,
	G2_Service_Code=1,
	G2_Service_Name=2,
	G2_Service_LName=3,
	G2_Currency=4,
	G2_Quantity=5,
	G2_Price=6,
	G2_Amount=7,
	G2_OpenYN=8,
	G2_UseYN=9;

var G3_pk=0,
	G3_tht_special_service_pk=1,
	G3_tht_room_allocate_pk=2,
	G_3_Service_Name=3,
	G3_From_Date=4,
	G3_Currency=5,
	G3_Use_Qty=6,
	G3_Price=7,
	G3_Total_Amount=8;
function BodyInit()
{
	BindingDataList();
	dso_htbk00030_mst.Call('SELECT');	
}
function BindingDataList()
{
	var data ="VND;VND|USD;USD"; 
        grdSpecialService.SetComboFormat(G3_Currency,data);
		
		data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='GEN'")%>";
		grdInhouseList.SetComboFormat(5, data);//gender

		data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'")%>";
		grdInhouseList.SetComboFormat(6, data);//nation
		
		data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CTYPE' AND USE_YN='Y' order by ord")%>";
		grdInhouseList.SetComboFormat(2, data);//MKT.Segment

		data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE " )%>"; 
		grdInhouseList.SetComboFormat(26, data);//rate plan
}

function OnSearch(n)
{
	switch(n)
	{
		case 1:
			dso_htbk00030_mst.Call('SELECT');
		break;
		case 2:
			dso_htbk00030_room.Call("SELECT");
		break;
		case 3:
			if (grdInhouseList.rows > 1)
			{
				txt_tht_room_allocate_pk.text=grdInhouseList.GetGridData(grdInhouseList.row,0)//tht_room_allocate_pk
				dso_htbk00030_allocate.Call('SELECT');
			}
		break;
	}
}

function OnDelete()
{
	if (confirm('Are you sure delete data ?'))
	{
		grdSpecialService.DeleteRow();
		dso_htbk00030_allocate.Call();	
	}
}
function OnSave()
{
	dso_htbk00030_allocate.Call();
}
function CheckValidate()
{
    for(var i=0;i<grdSpecialService.rows;i++)
          {
            if(grdSpecialService.GetGridData(i,COL_A_RATE_ADULT) == "" && grdSpecialService.GetGridData(i,COL_A_RATE_ADULT_Female) == "") 
             {
                alert("Please, input adult male or adult female at row "+ i);       
                return false;
             }
			 if(grdSpecialService.GetGridData(i,COL_A_FROM_DATE) == "") 
             {
                alert("Please, input arrival date at row "+ i);       
                return false;
             }
			 if(grdSpecialService.GetGridData(i,COL_A_FROM_DATE) == grdSpecialService.GetGridData(i,COL_A_TO_DATE)) 
             {
                if(!confirm("Arrival date "+ grdSpecialService.GetGridData(i,COL_A_FROM_DATE)+" is correct ?")){       
					return false;
				}
             }
			 if(grdSpecialService.GetGridData(i,COL_A_FROM_DATE) > grdSpecialService.GetGridData(i,COL_A_TO_DATE)) 
             {
                alert("Arrival date can not greater than Departure date.");       
				return false;
				
             }
			 if(grdSpecialService.GetGridData(i,COL_BIRTHDAY) == "") 
             {
                alert("birthday date can not empty.");       
				return false;
				
             }
          }
          return true;
}
function OnSelectRoom()
{
	if (grdInhouseList.rows > 1)
	{
		if (grdInhouseList.row == '-1')
		{
			alert('Please, Select Room Type.')
			return;
		}
		if (grdSpecialServiceSetup.row == '-1')
		{
			return;
		}
		var tht_special_service_pk  = grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row, G2_pk);//tht_special_service_pk
		
		if (txt_tht_room_allocate_pk.text != '')
		{	
			if (grdSpecialService.rows > 1)
			{
				for (row = 1; row < grdSpecialService.rows; row++)
				{
					if (grdSpecialService.GetGridData(row, G3_tht_special_service_pk) == tht_special_service_pk)
					{
						return;
					}
				}
				
				grdSpecialService.AddRow();
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G3_tht_special_service_pk,		grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row, 0));//tht_special_service_pk
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G3_tht_room_allocate_pk,		grdInhouseList.GetGridData(grdInhouseList.row, 0));//tht_room_allocate_pk
				
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G3_Currency,		            grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row, G2_Currency));//
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G3_Use_Qty,		                '1');//
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G3_Price,		                grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row, G2_Price));//
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G_3_Service_Name,		        grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row, G2_Service_Name));//
							
				grdSpecialServiceSetup.SetCellFontColor(grdSpecialServiceSetup.row, 0, grdSpecialServiceSetup.row, grdSpecialServiceSetup.cols-1, 0x0000FF);
			} 
			else
			{
				grdSpecialService.AddRow();
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G3_tht_special_service_pk,		grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row, 0));//tht_special_service_pk
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G3_tht_room_allocate_pk,		grdInhouseList.GetGridData(grdInhouseList.row, 0));//tht_room_allocate_pk
				
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G3_Currency,		            grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row, G2_Currency));//
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G3_Use_Qty,		                '1');//
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G3_Price,		                grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row, G2_Price));//
				grdSpecialService.SetGridText(grdSpecialService.rows-1, G_3_Service_Name,		        grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row, G2_Service_Name));//
			}
			//grdInhouseList.SetCellFontColor(grdInhouseList.row, 0, grdInhouseList.row, grdSpecialServiceSetup.cols-1, 0x0000FF);
		}			
	}
}
function OnRemoveRoom()
{
	for(row = grdSpecialService.rows-1; row > 0; row--)
	{
		agin:
		if (grdSpecialService.GetGridControl().isSelected(row) == true)
		{
			if (grdSpecialService.GetGridData(row, G3_pk) == '')
			{
				for (j = 1; j < grdInhouseList.rows; j++ )
				{
					if (grdSpecialService.GetGridData(row, G3_tht_room_allocate_pk) == grdInhouseList.GetGridData(j, 0))//tht_room_allocate_pk
					{						
						grdInhouseList.SetCellFontColor(j, 0, j, grdInhouseList.cols-1, 0x000000);
					}
				}

				for (i = 1; i < grdSpecialServiceSetup.rows; i++)
				{
					if (grdSpecialService.GetGridData(row, G3_tht_special_service_pk) == grdSpecialServiceSetup.GetGridData(i, 0))//tht_special_service_pk
					{
						grdSpecialService.RemoveRowAt(row);
						grdSpecialServiceSetup.SetCellFontColor(i, 0, i, grdSpecialServiceSetup.cols-1, 0x000000);
						break agin;
					}
				}
			}
		}
	}
}
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_htbk00030_mst':
		
				
				dso_htbk00030_room.Call('SELECT');
		break; 
		case 'dso_htbk00030_allocate':
				dso_htbk00030_room.Call('SELECT');	
		break; 
		case 'dso_htbk00030_room':
			
		break; 
	}
}
function OnInputPrice()//event in grid: onentercell --->not yet!
{
		if(grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row,G2_OpenYN) == "N" && event.col == 6)
		{
			//alert(grdSpecialServiceSetup.GetGridData(grdSpecialServiceSetup.row,G2_OpenYN));
			grdSpecialServiceSetup.row = -1;
		}
}
</script>

<body>
    <gw:data id="dso_htbk00030_mst" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="" function="st_ht_sel_60250110_inhouse">
			<input bind="grdInhouseList">
				<input bind="txtRoomNo_Guest" />
			</input> 
			<output bind="grdInhouseList" /> 
		</dso> 
	</xml> 
</gw:data>
    <gw:data id="dso_htbk00030_room" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="" function="st_ht_sel_60250110_sv_setup">
			<input bind="grdSpecialServiceSetup">
				 <input bind="txtSpecialService" />
			</input> 
			<output bind="grdSpecialServiceSetup" /> 
		</dso> 
	</xml> 
</gw:data>
    <gw:data id="dso_htbk00030_allocate" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="sp_sel_htfo00540_dtl" procedure="sp_upd_htfo00540_dtl">
			<input bind="grdSpecialService">
				<input bind="txt_tht_room_allocate_pk" />
			</input> 
			<output bind="grdSpecialService" /> 
		</dso> 
	</xml> 
</gw:data>
    <table style="height: 100%; width: 100%; background: #BDE9FF" border="0">
        <tr style="width: 100%; height: 1%">
            <td style="width: 100%; background: white" valign="top">
                <table style="width: 100%" border="0">
                    <tr>
                        <td style="width: 10%" align="right">
                            Date</td>
                        <td style="width: 20%">
                            <gw:datebox id="dtFrom" lang="1" styles="width:100%" onchange="OnSearch(1)" />
                            ~<gw:datebox id="dtTo" lang="1" styles="width:100%" onchange="OnSearch(1)" />
                        </td>
                        <td style="width: 10%" align="right">
                            Book By</td>
                        <td style="width: 30%">
                            <gw:textbox id="txtRoomNo_Guest" styles="width: 100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 4%" align="center">
                            Total :
                        </td>
                        <td style="width: 10%" align="center">
                            <gw:label id="lblStatus" styles="color: blue"></gw:label>
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
                        </td>
                        <td style="width: 12%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 60%; background: white">
			<td>
                <gw:grid id='grdInhouseList' header='_pk|Company|MKT.Segment|Last Name|First Name|Gender|Nation|Arrive Date|Departure|Advance|_Rate|Room#|Room Type|Contact Name|Phone|Mail|Adult-M|Adult-F|Child-M|Child-F|Checkin By|Checkin Date|Request|_Room_Pk|_Room_Type|PA/ID|Rate Plan|Rate|Slip No|Guest2 Name|Guest3 Name|Guest4 Name|_Company_pk'
                    format='0|0|0|0|0|0|0|4|4|-0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|-2|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|3|3|1|0|0|0|0|3|3|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    editcol='0|0|0|1|1|1|1|0|1|0|1|0|0|1|1|1|1|1|1|1|0|0|1|1|1|1|1|1|0|1|1|1|0'
                    widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" oncellclick="OnSearch(3)"  />
            </td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td style="width: 100%; background: white" valign="top">
                <table style="width: 100%" border="0">
                    <tr>
                        <td style="width: 16%">
							Special Service Code/Name
                        </td>
						<td style="width: 17%" align="right">
							<gw:textbox id="txtSpecialService" styles="width: 100%" onenterkey="OnSearch(2)" />
                        </td>
                        <td style="width: 5%" align="right">
                        </td>
                        <td style="width: 29%">
                        </td>
                        <td style="width: 16%">
                        </td>
                        <td style="width: 1%">

                        </td>
                       <td style="width: 7%">
							
						</td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
						 <td width="3%" align="right">
                            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 38%; background: white">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
						<td width="48%">
                            <gw:grid id="grdSpecialServiceSetup" header="_pk|Service Code|Service Name|_ServiceLName|Currency|_Quantity|Price|Amount|Open YN|_UseYN"
                                format="0|0|0|0|0|-0|-2|-2|0|3" aligns="0|0|0|0|0|0|0|0|0|0" defaults="|||||||||" editcol="0|0|0|0|0|0|1|0|0|0"
                                widths="0|600|1500|2000|2000|2000|1000|1000|3000|1000" styles="width:100%; height:100%" 
                                sorting="F"  onafteredit="" onentercell="OnInputPrice()" autosize="T"/>
                        </td>
                        
                        <td style="width: 3%" align="center">
                            <gw:icon id="ibtnSelect" img="in" text=">>" onclick="OnSelectRoom()" />
                            </br>
                            <gw:icon id="ibtnRemove" img="in" text="<<" onclick="OnRemoveRoom()" />
                        </td>
                        <td style="width: 59%; height: 5%; background: #BDE9FF">
                            <gw:grid id="grdSpecialService" header="_pk|_tht_special_service_pk|_tht_room_allocate_pk|Service Name|From Date|Currency|Use Qty|Price|Total Amount"
                                format="0|0|0|0|4|0|-0|-2|-2" 
								aligns="0|0|0|0|0|0|0|0|0"                                
                                defaults="||||||||" 
								editcol="1|1|1|0|1|1|1|1|0"
                                widths="2000|2000|1000|1000|1500|1000|1000|1000|1000" 
								styles="width:100%;height:100%" 
                                autosize='T' debug='false'  oncellclick="" oncelldblclick=""  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="THT_BOOKING_PK" styles="display: none" />
<gw:textbox id="txt_tht_room_allocate_pk" styles="display: none" />
<gw:textbox id="txtDateFrom" styles="display: none" />
<gw:textbox id="txtDateTo" styles="display: none" />
<!--------------------------------------------------------------------------------------->
</html>
