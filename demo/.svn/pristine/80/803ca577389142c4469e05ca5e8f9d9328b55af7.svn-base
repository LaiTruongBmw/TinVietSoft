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
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='GEN'")%>";
	grdProfile.SetComboFormat(2, data);//gender

	//data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CITY'")%>";
	//grdProfile.SetComboFormat(9, data);//city
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'")%>";
	grdProfile.SetComboFormat(3, data);//nation
	txtFullName.text = '<%=Request.QueryString("p_guest_name") %>';
	OnSearch();
}

function OnSearch()
{
	dso_htfo00720.Call('SELECT');
}

function OnNew()
{
	grdProfile.AddRow();
}
function OnDelete()
{
	if (grdProfile.row > 0)
	{
		if (grdProfile.GetGridData(grdProfile.row, 0) == '')
		{
			grdProfile.RemoveRow();
		}
		else
		{
			if (confirm("Are you sure delete data?"))
			{
				grdProfile.DeleteRow();
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
    for(var i=1;i<grdProfile.rows;i++)
          {
            if(grdProfile.GetGridData(i,1) == "")
             {
                alert("Please ,input full name at row "+ i);       
                return false;
             }
			 if(grdProfile.GetGridData(i,2) == "")//gender
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
		 txtCount.text=grdProfile.rows-1 + " Guest(s).";  
		 //dso_htfo00720_2.Call("SELECT");
	}
	if(obj.id=='dso_htfo00720_2')
	{
		 if (grdProfileInhouse.rows > 1)
		{		
				grdProfileInhouse.Subtotal( 1, 2, -1, '6!8!9');
		}

	}
}
function OnSelect()
{
    var code_data=new Array()
	var ctrl = grdProfile.GetGridControl();
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
		        for(j=0; j < grdProfile.cols -1; j++)
	        	{
            		code_data[index] = grdProfile.GetGridData(rowNo , j );
            		index ++;
            	}        
		}
	}
	window.returnValue = code_data; 
	this.close(); 	
}
function OnReport()
{
    if(grdProfile.rows > 1)
	{
		/*var url = '/standard/reports/60/25/rpt_602500230_Guest_Profile.aspx?p_guest_phone_mail='+ txtFullName.text+'&p_dtfrm='+dtFrom.value+'&p_dtto='+dtTo.value; 
	     System.OpenTargetPage( System.RootURL+url , "newform" );	*/ 
		 var url =System.RootURL + '/standard/reports/60/25/rpt_602500230_Guest_Profile.aspx?p_guest_phone_mail='+txtFullName.text+'&p_dtfrm='+dtFrom.value+'&p_dtto='+dtTo.value;
		System.OpenTargetPage(url);  
	}
}
function OnClickProfile()
{
	txtProfile_PK.text = grdProfile.GetGridData(grdProfile.row, 0); 
	dso_htfo00720_2.Call('SELECT');
}
</script>
<body>
<gw:data id="dso_htfo00720" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_ht_sel_60250230" procedure="st_ht_upd_60250230">
			<input bind="grdProfile">
				<input bind="dtFrom" />
				<input bind="dtTo" />
				<input bind="txtFullName" />
			</input> 
			<output bind="grdProfile" /> 
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_htfo00720_2" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid"  function="st_ht_sel_60250230_2">
			<input bind="grdProfileInhouse">
				<input bind="txtProfile_PK" />
			</input> 
			<output bind="grdProfileInhouse" /> 
		</dso> 
	</xml> 
</gw:data>
<table style="height: 100%; width: 100%; background: #BDE9FF" border="0">
	<tr style="width: 100%; height: 2%">
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
						<gw:imgbtn img="new" alt="New" id="btnAddNew" onclick="OnNew()" style="display: none" />
					</td>
					 <td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" style="display: none" />
                    </td>
                    <td style="width: 3%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" style="display: none" />
                    </td>
					<td style="width: 1%" >
						
					</td>

					<td width="3%" align="right">	
						<gw:imgbtn id="idSelect" img="select" alt="Select" onclick="OnSelect()" style="display: none" />
                        
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
	<tr style="width: 100%; height: 49%; background: white">
		<td style="width: 100%">
			<gw:grid id="grdProfile" 
			header="_pk|Full Name|Gender|Nationality|Passport|Birthday|Phone|Email|Description|Last Checkin|Last Checkout|Last Group Name" 
			format="0|0|0|0|0|4|0|0|0|4|4|0" 
			aligns="0|0|0|0|0|0|0|0|0|0|0|0" 
			defaults="|||||||||||" 
			editcol="1|1|1|1|1|1|1|1|1|0|0|0" 
			widths="0|0|0|0|0|4|0|0|0|0|0|0" 
			styles="width:100%;height:100%"
			autosize='T'
			debug='false'
			acceptnulldate="T"
			oncellclick="OnClickProfile()"  />
		</td>
	</tr>
	<tr style="width: 100%; height: 49%">
		<td>
                <gw:grid id='grdProfileInhouse' header='_pk|Room#|Guest Name|_First_Name|Checkin Date|Departure Date|Days|Daily Rate|Deposit|Total Due|Company Name|Rate Plan'
                    format='0|0|0|0|4|4|-0|-0|-0|-0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0|0' 
                    widths='0|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T"   />
            </td>
	</tr>
</table>
<gw:textbox id="txtMasterPK" style="display: none" />
<gw:textbox id="txtTEMP" style="display: none" />
<gw:textbox id="txtProfile_PK" style="display: none" />
</body>
<!--------------------------------------------------------------------------------------->
</html>
