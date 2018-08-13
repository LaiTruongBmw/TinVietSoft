<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Guest Room</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var G_pk=0,
	G_THT_ROOM_ALLOCATE_PK=1,
	G_Guest_Name=2,
	G_Gender=3,
	G_Nationality=4,
	G_Passport=5,
	G_Birthday=6,
	G_Phone=7,
	G_Email=8,
	G_Description=9,
	G_Checkin_Date=10,
	G_VIP=11;
function BodyInit()
{
	//dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-4));
	BindingDataList();
}

function BindingDataList()
{
	var data = '';
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='GEN'")%>";
	grdMST.SetComboFormat(3, data);//gender

	//data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CITY'")%>";
	//grdMST.SetComboFormat(9, data);//city
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'")%>";
	grdMST.SetComboFormat(4, data);//nation
	txtTHT_ROOM_ALLOCATE_PK.text = '<%=Request.QueryString("p_THT_ROOM_ALLOCATE_PK") %>';
	data ="#VIP1;VIP1|#VIP2;VIP2|#VIP3;VIP3|#VIP4;VIP4|#VIP5;VIP5|#VIP6;VIP6|#;"
    grdMST.SetComboFormat(G_VIP,data);

	OnSearch();
}

function OnSearch()
{
	dso_60250250.Call('SELECT');
}

function OnNew()
{
	grdMST.AddRow();
	grdMST.SetGridText(grdMST.rows-1,G_THT_ROOM_ALLOCATE_PK,txtTHT_ROOM_ALLOCATE_PK.text);
}
function OnDelete()
{
	if (grdMST.row > 0)
	{
		if (grdMST.GetGridData(grdMST.row, 0) == '')
		{
			grdMST.RemoveRow();
		}
		else
		{
			if (confirm("Are you sure delete data?"))
			{
				grdMST.DeleteRow();
				dso_60250250.Call();
			}
		}
	}
}
function OnSave()
{
	if(CheckValidate())
    {
       dso_60250250.Call(); 
    }
}
function CheckValidate()
{
    for(var i=1;i<grdMST.rows;i++)
          {
            if(grdMST.GetGridData(i,G_Guest_Name) == "")
             {
                alert("Please ,input guest name at row "+ i);       
                return false;
             }
			 if(grdMST.GetGridData(i,G_Gender) == "")//gender
             {
                alert("Please ,choose gender at row "+ i);
                return false;
             }
          }
          return true;
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_60250250')
	{
		 txtCount.text=grdMST.rows-1 + " Guest(s).";  
	}
}
function OnSelect()
{
    var code_data=new Array()
	var ctrl = grdMST.GetGridControl();
	var index, rowNo
	
	index =0;
	rowNo = 0 ;
	
	if ( ctrl.SelectedRows == 0 )
    {
           return ;
    }
    else
	{
	    for(i=0; i < ctrl.SelectedRows; i++)
		{	  
		        rowNo = ctrl.SelectedRow(i)
		        for(j=0; j < grdMST.cols -1; j++)
	        	{
            		code_data[index] = grdMST.GetGridData(rowNo , j );
            		index ++;
            	}        
		}
	}
	window.returnValue = code_data; 
	this.close(); 	
}
function OnReport()
{
    if(grdMST.rows > 1)
	{
		
	}
}
</script>
<body>
<gw:data id="dso_60250250" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_ht_sel_60250250" procedure="st_ht_upd_60250250">
			<input bind="grdMST">
				<input bind="txtTHT_ROOM_ALLOCATE_PK" />
			</input> 
			<output bind="grdMST" /> 
		</dso> 
	</xml> 
</gw:data>
<table style="height: 100%; width: 100%; background: #BDE9FF" border="0">
	<tr style="width: 100%; height: 1%">
		<td style="width: 100%; background: white" valign="top" >			
			<table style="width: 100%" border="0">
				<tr >
					<td style="width: 25%" align="right" nowrap ></td>
					<td style="width: 20%" >
						<gw:textbox id="txtTHT_ROOM_ALLOCATE_PK" styles="width: 100%;display: none" onenterkey="OnSearch()" onchange="OnSearch()" />
					</td>
					<td style="width: 9%" align="right" ></td>
					<td style="width: 9%" >Total :</td>
					<td style="width: 15%" align="center">
						 <gw:label id="txtCount" />
					</td>
					<td style="width: 12%" >
					</td>
					<td style="width: 1%" >
						
					</td>
					<td style="width: 7%">
							
						</td>
					<td style="width: 3%">
                        <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                    </td>
					<td style="width: 10%" >
						<gw:imgbtn img="new" alt="New" id="btnAddNew" onclick="OnNew()" />
					</td>
					 <td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                    </td>
                    <td style="width: 3%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                    </td>
					<td style="width: 1%" >
						
					</td>

					<td width="3%" align="right">	
						<gw:imgbtn id="idSelect" img="select" style="display: none" alt="Select" onclick="OnSelect()" />
                        
                    </td>
					<td style="width: 1%" >
						
					</td>
					<td style="width: 1%" >
						<gw:imgbtn img="excel" alt="Print" style="display: none" text="Print" id="btnReport" onclick="OnReport()" />
					</td>
					
				</tr>
			</table>
		</td>
	</tr>
	<tr style="width: 100%; height: 30%; background: white">
		<td style="width: 100%">
			<gw:grid id="grdMST" 
			header="_pk|_THT_ROOM_ALLOCATE_PK|Guest Name|Gender|Nationality|Passport|Birthday|Phone|Email|Description|Checkin Date|VIP" 
			format="0|0|0|0|0|0|4|0|0|0|4|0" 
			aligns="0|0|0|0|0|0|0|0|0|0|0|0" 
			defaults="|||||||||||" 
			editcol="1|1|1|1|1|1|1|1|1|1|0|0" 
			widths="0|0|0|0|0|0|0|0|0|0|0|0" 
			styles="width:100%;height:100%"
			autosize='T'
			debug='false'
			acceptnulldate="T"
			oncelldblclick="" />
		</td>
	</tr>
</table>
<gw:textbox id="txtMasterPK" style="display: none" />
<gw:textbox id="txtTEMP" style="display: none" />
</body>
<!--------------------------------------------------------------------------------------->
</html>
