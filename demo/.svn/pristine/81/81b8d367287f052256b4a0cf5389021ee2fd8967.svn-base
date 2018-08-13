<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>OUT OF ORDER</title>
</head>

<script>

var l_room_pk = "<%=Request.querystring("p_room_pk")%>";
//var l_status = "<%=Request.querystring("p_status")%>";


function BodyInit()
{     
    Binding();
	txtRoomPK.text=l_room_pk;
    OnSearch();
}
function Binding()
{
	var data; 
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code, NAME FROM tco_commcode WHERE del_if = 0 AND parent_code = 'RSTA' ")%>";
    grdHistory.SetComboFormat(3, data);
}
function OnSearch()
{
	dsoListHistory.Call('SELECT');
}
function OnDataReceive(obj)
{
    switch(obj.id){
        case "dsoListHistory":
			
        break;
    }
}
function CheckValidate()
{
    for(var i=1;i<grdHistory.rows;i++)
          {
             if(grdHistory.GetGridData(i,4) == "")
             {
                alert("Please input begin date. ");
                return false;
             }
            if(grdHistory.GetGridData(i,5) == "")
             {
                alert("Please input end date. ");
                return false;
             }
            if(grdHistory.GetGridData(i,6) == "")
             {
                alert("Please input reason .");
                return false;
             }
          }
          return true;
}
function OnSave()
{   
   if(CheckValidate())
   {
		dsoListHistory.Call();
   }
   
}
function OnNew()
{
	if(grdHistory.rows < 2)
	{
		grdHistory.AddRow(); 
		grdHistory.SetGridText(1,1,l_room_pk);
		grdHistory.SetGridText(1,3,'OOO');
	}
	else
	{
		alert("you can not add new.");
	}
}
</script>
<body bgcolor='#F5F8FF'>
    <gw:data id="dsoListHistory" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6" function="st_ht_sel_60260040_popup" procedure="st_ht_upd_60260040_popup">  
                <input bind="grdHistory">  
                    <input bind="txtRoomPK" />
                </input> 
                <output bind="grdHistory" /> 
            </dso> 
        </xml>
    </gw:data>
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <table style="width: 100%; height: 100%" border="0">
					<tr style=" height: 2%">
						<td style="width:30%">
							<table style="width: 100%; height: 100%">
								<tr style=" height: 100%">
									<td  style="width:87%">
										
									</td>
									<td  style="width:8%">
										<gw:icon id="ibtnOOO" alt="Add New" text="Add New" img="in" styles="width:100%"
													onclick="OnNew()" />
									</td>
									<td  style="width:5%">
										<gw:icon id="ibtnOOO" alt="Save" text="Save" img="in" styles="width:100%"
													onclick="OnSave()" />
									</td>
								</tr>
							</table>
						<td>
					</tr>
                    <tr style=" height: 98%">
									 <td style="width:100%">
										<table style="width: 100%; height: 100%">
											<tr style="height: 98%">
												<td>
													<gw:grid id='grdHistory' header='_pk|_tht_room_PK|_Room No|Status|Begin Date|End Date|Reason'
														format  ='0|0|0|0|4|4|0' 
														aligns  ='0|0|0|0|0|0|0' 
														editcol ='0|0|0|1|1|1|1'
														defaults='||||||'  
														autosize='T'
														widths='0|0|800|2500|1000|1000' sorting='T' 
														styles='width:100%;height:100%'
														autosize="T" acceptNullDate="T" />
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
    <gw:textbox id="txtRoomPK" styles="display:none" />
	<gw:textbox id="txtRoomStatus" styles="width:100%;display:none" />
    <gw:textbox id="txtStaffPK" styles="width:100%;display:none" />
</body>
