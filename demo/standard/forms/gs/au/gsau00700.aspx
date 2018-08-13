<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head runat="server">
    <title>Untitled Page</title>
</head>

<script>

function BodyInit()
{
    BindingDataList();
	OnSearch();
}

function BindingDataList()
{   
 
 lstDept.SetDataText("<%=CtlLib.SetListDataSQL("select PK, ORG_NM from TCO_ORG WHERE DEL_IF = 0 order by ORG_NM ")%>|ALL|Select All");
 lstDept.value = "ALL";
 
}

function OnSearch()
{	
    dataLoginHistory.Call("SELECT");
}
function OnDataReceive(oData){
//
}
function OnExcel()
{
      var url = '/reports/sys/auth/rpt_sysauth00005.aspx?p_dbuser='+ txtDBUser.text +'&p_from_date='+dtFromDate.value+'&p_to_date='+dtToDate.value+'&p_org='+ lstDept.value + '&p_user_id='+ txtUserId.text +'&p_user_name='+ txtUserName.text +'&p_success_yn='+chkLoged.value;  
		System.OpenTargetPage( System.RootURL+url , "newform" );
}

</script>

<body>
    <gw:data id="dataLoginHistory" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="grid" parameter="0,1,2" function="ST_GS_SEL_GSAU00700_0" > 
            <input> 
			    <input bind="txtDBUser" />
                <input bind="dtFromDate" />
                <input bind="dtToDate" />
                <input bind="lstDept" />
                <input bind="txtUserId" />
                <input bind="txtUserName" />
                <input bind="chkLoged" />
             </input>
            <output  bind="grdLoginHistory"/>
        </dso> 
    </xml> 
</gw:data>
    <table width="100%" style="height:100%" >
        <tr style="width:100%;height:5%" >
            <td width="5%">
                <b>L.Date</b></td>
            <td width="7%">
                <gw:datebox lang="1" id="dtFromDate" />
            </td>
            <td width="2%" align="center">
                ~</td>
            <td width="7%">
                <gw:datebox lang="1" id="dtToDate" />
            </td>
            <td width="5%">
                <b>Dept</b></td>
            <td width="13%">
                <gw:list id="lstDept" styles='width:100%' />
            </td>
            <td width="7%">
                <b>User ID</b></td>
            <td width="10%">
                <gw:textbox id="txtUserId" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td width="5%">
                <b>Name</b></td>
            <td width="10%">
                <gw:textbox id="txtUserName" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td width="2%">
            </td>
            <td width="12%">
                <b>Login success(Y/N)</b></td>
            <td width="3%">
                <gw:checkbox id="chkLoged" mode="01" value="0" onchange="OnSearch()" />
            </td>
            <td width="10%">
                <b>
                    <gw:label id="lblTotalUsers" styles="width:100%" />
                </b>
            </td>
			 <td width="3%">
				
                <gw:button id="btnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
            </td>
            <td width="1%">
				<gw:button id="btExcel" img="excel" text="Report" alt="Excel" onclick="OnExcel()" />
            </td>
           
        </tr>
        <tr style="width:100%;height:95%" valign="top">
            <td colspan="16" style="width:100%;height:100%;">
                
					 <gw:grid id="grdLoginHistory" header="No|User ID|Full Name|Dept Name|Login IP|Login Date|Emp Id|Status|Resign date|Success(Y/N)"
                    format="0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0" 
                     styles="width:100%; height:100%" autosize="true" />
				
            </td>
        </tr>
    </table>
	
	<gw:textbox id="txtDBUser" text="<%= Session("APP_DBUSER")%>" styles="display:none;" /> 
	
</body>
</html>
