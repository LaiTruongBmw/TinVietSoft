<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Check In</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
	//dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-4));
	BindingDataList();
}

function BindingDataList()
{
	var data = '';
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='GEN'")%>";
	grdMST.SetComboFormat(2, data);//gender

	//data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CITY'")%>";
	//grdMST.SetComboFormat(9, data);//city
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'")%>";
	grdMST.SetComboFormat(3, data);//nation
	txtFullName.text = '<%=Request.QueryString("p_guest_name") %>';
	OnSearch();
}

function OnSearch()
{
	dso_htfo00720.Call('SELECT');
}

function OnNew()
{
	grdMST.AddRow();
	grdMST.SetGridText(grdMST.rows-1,12,txtFullName.text);
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
				dso_htfo00720.Call();
			}
		}
	}
}
function OnSave()
{
	if(CheckValidate())
    {
       dso_htfo00720.Call(); 
    }
}
function CheckValidate()
{
    for(var i=1;i<grdMST.rows;i++)
          {
            if(grdMST.GetGridData(i,1) == "")
             {
                alert("Please ,input full name at row "+ i);       
                return false;
             }
			 if(grdMST.GetGridData(i,2) == "")//gender
             {
                alert("Please ,choose gender at row "+ i);
                return false;
             }
          }
          return true;
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_htfo00720')
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
		var url = '/standard/reports/ho/25/rpt_60250220_Guest_Profile.aspx?p_guest_phone_mail='+ txtFullName.text;
	     System.OpenTargetPage( System.RootURL+url , "newform" );	 
	}
}
</script>
<body>
<gw:data id="dso_htfo00720" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="ht_sel_60250220" procedure="ht_upd_60250220">
			<input bind="grdMST">
				<input bind="dtFrom" />
				<input bind="dtTo" />
				<input bind="txtFullName" />
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
					<td style="width: 13%" >
					Date Checkin
					</td>
					
					<td style="width: 10%">
							<gw:datebox id="dtFrom" lang="1" onchange="OnSearch()" />
                            ~<gw:datebox id="dtTo" lang="1" onchange="OnSearch()" />
					</td>
					<td style="width: 25%" align="right" nowrap >Full Name/Passport/Phone/Email:</td>
					<td style="width: 20%" >
						<gw:textbox id="txtFullName" styles="width: 100%" onenterkey="OnSearch()" onchange="OnSearch()" />
					</td>
					<td style="width: 7%" align="right" ></td>
					<td style="width: 7%" >Total :</td>
					<td style="width: 15%" align="center">
						 <gw:label id="txtCount" />
					</td>
					
					<td style="width: 1%" >
						
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
						<gw:imgbtn id="idSelect" img="select" alt="Select" onclick="OnSelect()" />
                        
                    </td>
					<td style="width: 1%" >
						
					</td>
					<td style="width: 1%" >
						<gw:imgbtn img="excel" alt="Print" text="Print" id="btnReport" onclick="OnReport()" />
					</td>
					
				</tr>
			</table>
		</td>
	</tr>
	<tr style="width: 100%; height: 30%; background: white">
		<td style="width: 100%">
			<gw:grid id="grdMST" 
			header="_pk|Full Name|Gender|Nationality|Passport|Birthday|Phone|Email|Description|Last Checkin|Last Checkout|Last Group Name|_Guest Room Master" 
			format="0|0|0|0|0|4|0|0|0|4|4|0|0" 
			aligns="0|0|0|0|0|0|0|0|0|0|0|0|0" 
			defaults="||||||||||||" 
			editcol="1|1|1|1|1|1|1|1|1|0|0|0|0" 
			widths="0|0|0|0|0|4|0|0|0|0|0|0|0" 
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
