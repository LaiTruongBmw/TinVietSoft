<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Evaluation Group Entry</title>
</head>

<script>
var COL_PK              = 0,
    COL_THT_ROOM_PK     = 1,
    COL_ROOM_NO         = 2,
    COL_STATUS          = 3,
    COL_DATE            = 4,
    COL_TIME            = 5,
    COL_STAFF_PK        = 6,
    COL_STAFF           = 7,
	COL_out_of_order_fr =8 ,
	COL_out_of_order_fr =9 ,
    COL_DESCRIPTIOn     = 10;       
function BodyInit()
{     
    Binding(); 
    OnSearch();
}
function Binding()
{
	var data; 
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code, NAME FROM tco_commcode WHERE del_if = 0 AND parent_code = 'RSTA' ")%>";
    grdHistory.SetComboFormat(2, data);
	data = "<%=CtlLib.SetListDataSQL("SELECT code, NAME FROM tco_commcode WHERE del_if = 0 AND parent_code = 'RSTA'" )%>|ALL|Select All"; 
	lstRoomStatus.SetDataText(data);//rate plans
	lstRoomStatus.value='ALL';
}
function OnSearch()
{
    dsoListHistory.Call('SELECT');
}
function OnDataReceive(obj)
{
    switch(obj.id){
        case "dsoListHistory":
			if(grdHistory.rows > 1){
			 for (row = 1; row < grdHistory.rows; row ++ )
			 {
					var status_color= grdHistory.GetGridData(row, 2);
								if(status_color == 'VD')
								{
									set_color =0x00ffff; // ffff00 
								}
								else if(status_color == 'OD')
								{
									set_color =0x0066ff;//ff6600
								}
								if(status_color == 'VC')// 3366ff
								{
									set_color =0xff6633;
								}
								else if(status_color == 'OC')//15340c
								{
									set_color =0x2CC00B;
								}
								else if(status_color == 'OOO')
								{
									set_color =0x0000ff;// ff0000
								}    
								grdHistory.SetCellBgColor(row, 0, row, 3, set_color);
				}
				grdHistory.SetCellBold(1, 0, grdHistory.rows-1, 3, 0x000000);
			}
        break;
    }
}
function OnSave(obj)
{   
   var ctrl=grdHistory.GetGridControl();
    switch(obj){
        case "VC":
           	if(confirm('Are you sure you want to change status to VC ?'))
			{
				for (var i =1;i<ctrl.Rows;i++ ){
						if (ctrl.isSelected(i) == true)
						  grdHistory.SetGridText(i,2,'VC');
				 }
				 dsoListHistory.Call();	
			}
        break;
		case "OC":
           if(confirm('Are you sure you want to change status to OC ?'))
			{
				for (var i =1;i<ctrl.Rows;i++ ){
						if (ctrl.isSelected(i) == true)
						  grdHistory.SetGridText(i,2,'OC');
				 }
				 dsoListHistory.Call();	
			 }
        break;
		case "OD":
            alert("you can use not this function.");
			/*for (var i =1;i<ctrl.Rows;i++ ){
					if (ctrl.isSelected(i) == true)
			          grdHistory.SetGridText(i,2,'OD');
	         }
			 dsoListHistory.Call();	*/
        break;
		case "VD":
            if(confirm('Are you sure you want to change status to VD ?'))
			{
				for (var i =1;i<ctrl.Rows;i++ ){
						if (ctrl.isSelected(i) == true)
						  grdHistory.SetGridText(i,2,'VD');
				 }
				 dsoListHistory.Call();	
			}
        break;
		case "OOO":
			if(grdHistory.row != '-1')
			{
				 var path = System.RootURL + '/standard/forms/60/26/60260040_popup_OOO.aspx?p_room_pk=' + grdHistory.GetGridData(grdHistory.row, 0);
				 var obj = System.OpenModal( path ,600 , 400,  'resizable:yes;status:yes');
				 OnSearch();
			 }
			 else
				{
					alert("please,choose guest name.");
				}
        break;
    }

}
function OnNotchange()
{
	if(grdHistory.col==2)
	{
		grdHistory.row=-1;
	}
}
</script>
<body bgcolor='#F5F8FF'>
    <gw:data id="dsoListHistory" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="st_ht_sel_60260040" procedure="st_ht_upd_60260040">  
                <input bind="grdHistory">  
                    <input bind="lstRoomStatus" />
                </input> 
                <output bind="grdHistory" /> 
            </dso> 
        </xml>
    </gw:data>
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr style=" height: 100%">
					<td style="width:30%">
							<table style="width: 100%; height: 100%" border="1">
								<tr style=" height: 90%">
									<td  style="width:25%">
										<table style="width: 100%; height: 100%">   
										<tr style=" height: 2%">
												<td width="100%" style="border: 0">
													<gw:list id="lstRoomStatus" styles="width: 100%" onchange=" OnSearch()" />
												<td>
											</tr>
											<tr style=" height: 3%">
												
											</tr>
											<tr style=" height: 2%">
												<td width="100%" style="border: 0">
												<table style="width: 100%; height: 100%">
													<tr>
														<td width="60%" style="border: 0" colspan="2" align="center">
															<gw:icon id="ibtnVC" alt="VACANCY CLEAN" text="VACANCY CLEAN" img="in" styles="width:100%;display:none"
															onclick="OnSave('VC')" />
															<gw:label id="lbCUS1" styles="text-align: center; color: white; background-color: #cd5c5c;width:100%;font-weight: bold;font-size:13;height:22px;display:none"></gw:label>
															<img src='imghtfo200\BT5.jpg' onclick="OnSave('VC')" onmouseover="javascript:this.style.cursor='hand'"  />
														</td>
													</tr>
												</table>
													
												</td>
												
											</tr>
											<tr style=" height: 2%">
												<td width="100%" style="border: 0">
													<table style="width: 100%; height: 100%">
													<tr>
														
														<td width="60%" style="border: 0" colspan="2" align="center">
															<gw:icon id="ibtnOC" alt="OCCUPPIED CLEAN" text="OCCUPPIED CLEAN" img="in" styles="width:100%;display:none"
															onclick="OnSave('OC')" />
												
															
														
															<gw:label id="lbCUS2" styles="text-align: center; color: white; background-color: #d7b3b3;width:100%;font-weight: bold;font-size:13;height:22px;display:none"></gw:label>
															<img src='imghtfo200\BT6.jpg' onclick="OnSave('OC')" onmouseover="javascript:this.style.cursor='hand'"  />
														</td>
													</tr>
												</table>
													
												<td>
											</tr>
											
											<tr style=" height: 2%">
												<td width="100%" style="border: 0">
													<table style="width: 100%; height: 100%">
													<tr>
														<td width="60%" style="border: 0" colspan="2" align="center">
															<gw:icon id="ibtnVD" alt="VACANCY DIRTY" text="VACANCY DIRTY" img="in" styles="width:100%;display:none"
															onclick="OnSave('VD')" />
														
															<gw:label id="lbCUS4" styles="text-align: center; color: white; background-color: #3399CC;width:100%;font-weight: bold;font-size:13;height:22px;display:none"></gw:label>
															<img src='imghtfo200\BT2.jpg' onclick="OnSave('VD')" onmouseover="javascript:this.style.cursor='hand'"  />
														</td>
													</tr>
												</table>
													
												<td>
											</tr>
											<tr style=" height: 2%">
												<td width="100%" style="border: 0">
													<table style="width: 100%; height: 100%">
													<tr>
														<td width="60%" style="border: 0" colspan="2" align="center">
															<gw:icon id="ibtnOOO" alt="OUT OF ORDER" text="OUT OF ORDER" img="in" styles="width:100%;display:none"
															onclick="OnSave('OOO')" />
														
															<gw:label id="lbCUS5" styles="text-align: center; color: white; background-color: #898989;width:100%;font-weight: bold;font-size:13;height:22px;display:none"></gw:label>
															<img src='imghtfo200\BT1.jpg' onclick="OnSave('OOO')" onmouseover="javascript:this.style.cursor='hand'"  />
														</td>
													</tr>
												</table>
													
												<td>
											</tr>
											<tr style=" height: 20%">
												
											</tr>
											<tr style=" height: 2%">
												<td width="100%" style="border: 0">
													<table style="width: 100%; height: 100%">
													<tr>
														<td width="60%" style="border: 0" colspan="2" align="center">
															<gw:icon id="ibtnOD" alt="OCCUPPIED DIRTY" text="OCCUPPIED DIRTY" img="in" styles="width:100%;display:none"
															onclick="OnSave('OD')" />
														
															<gw:label id="lbCUS3" styles="text-align: center; color: white; background-color: #336633;width:100%;font-weight: bold;font-size:13;height:22px;display:none"></gw:label>
															<img src='imghtfo200\BT3.jpg' onclick="OnSave('OD')" onmouseover="javascript:this.style.cursor='hand'"  />
														</td>
													</tr>
												</table>
													
												<td>
											</tr>
											<tr style=" height: 65%">
												
											</tr>
										</table>
									</td>
									 <td style="width:75%">
										<table style="width: 100%; height: 100%"  border="1">
											<tr style="height: 98%">
												<td> 
													<gw:grid id='grdHistory' header='_PK|Room No|_Status|Status|Guest Name|Arrival|Depart|Last Clean|Last Update' 
														format  ='0|0|0|0|0|0|0|0|0' 
														aligns  ='0|0|0|0|0|0|0|0|0' 
														editcol ='0|0|0|0|0|0|0|0|0'
														defaults='||||||||'  
														autosize='T'
														widths='0|0|800|2500|1000|1000|1000|1000|1000' sorting='T' 
														styles='width:100%;height:100%'	
														autosize="T" oncellclick="OnNotchange()"  />																
												</td>
											</tr>  
										</table>
									</td>
								</tr>
							</table>
						</td>
						
                    </tr>                    
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtRoomPK" styles="width:100%;display:none" />
	<gw:textbox id="txtRoomStatus" styles="width:100%;display:none" />
    <gw:textbox id="txtStaffPK" styles="width:100%;display:none" />
</body>
