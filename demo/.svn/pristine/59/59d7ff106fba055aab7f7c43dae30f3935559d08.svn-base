<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Summary By Invoice</title>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
    grdData.GetGridControl().FrozenCols=4;
    Binding();
	OnChangeTab('2');
	dtFrom.style.display = "none";
	dtTo.style.display = "none";
	OnSearch();
}
function Binding()
{
    data = "<%=CtlLib.SetListDataSQL("SELECT  CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' and del_if = 0 and code in ('POINT-01','POINT-02','POINT-03','POINT-04','POINT-08')")%>|ALL|Select All";
	lstLocation.SetDataText(data);
	lstLocation.value = 'ALL';
	
	data = "<%=CtlLib.SetListDataSQL("SELECT pk, last_name FROM tht_room_allocate WHERE pk < 0 AND del_if = 0")%>||Select All";
    lstGolfType.SetDataText(data);
	lstGolfType.value = '';
}
function OnSearch(){
	if(radTab.GetData()=='2')//grid Month
	{
		dso_jart00070.Call("SELECT");
	}
	if(radTab.GetData()=='1')//grid date
	{
		dso_Grid_YYDDMM.Call("SELECT");
	}
}
function OnReport()
{
	if(radTab.GetData()=='2')//grid 
	{
		var url = '/standard/reports/ho/27/rpt_60270110_sale_trend_month.aspx?p_month='+ dtMonth.value+'&p_location='+lstLocation.value+'&p_item='+txtItem.text+'&p_customer_type='+lstGolfType.value;
			System.OpenTargetPage( System.RootURL+url , "newform" );  

		//var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/rt/jart00070_1.rpt&procedure=crm.sp_sel_jart00070_rpt&parameter="+dtMonth.GetData()+","+lstLocation.value+","+txtItem.text+","+lstGolfType.value;
		// System.OpenTargetPage(url); 
	}    
	if(radTab.GetData()=='1')//grid date
	{
		var url = '/standard/reports/ho/27/rpt_60270110_sale_trend_date_from_to.aspx?p_from_date='+ dtFrom.value+'&p_to_date='+dtTo.value+'&p_location='+lstLocation.value+'&p_item='+txtItem.text+'&p_customer_type='+lstGolfType.value;
			System.OpenTargetPage( System.RootURL+url , "newform" );  
		//var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/rt/jart00070_menu_sale_trend_date.rpt&procedure=crm.sp_rpt_jart00070_from_to&parameter="+dtFrom.GetData()+","+dtTo.GetData()+","+lstLocation.value+","+txtItem.text+","+lstGolfType.value;
		//System.OpenTargetPage(url); 
	}  
}

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_jart00070':			
			if (grdData.rows > 1)
			{
				//lblRecord.text = grdData.rows - 1 + " record(s)";
				HighlightColor();
			}
		break;
		case 'dso_Grid_YYDDMM':			
			if (grdYMD.rows > 1)
			{
				//lblRecord.text = grdYMD.rows - 1 + " record(s)";
				HighlightColor();
			}
		break;
	}
}
function HighlightColor(){
	
	if(radTab.GetData()=='2')////grd month
	{
		if (grdData.rows > 2)
		{ 
			for(var i=2;i<grdData.rows;i++)
			{
				
				if(grdData.GetGridData(i,0) == "" && grdData.GetGridData(i,1) == "" && grdData.GetGridData(i,2) != "")
				{
					var set_color = 0XEE82EE;
					
					grdData.SetGridText(i,2,'Sub Total');
					grdData.SetCellBgColor(i, 0, i, grdData.cols-1, set_color);
					grdData.SetCellBold(i,2,i,grdData.cols-1,14);
				}
			}
			grdData.SetGridText(grdData.rows-1,2,'Total');
			grdData.SetCellBold(grdData.rows-1,2,grdData.rows-1,grdData.cols-1,14);
			grdData.SetCellBgColor(grdData.rows-1, 0, grdData.rows-1, grdData.cols-1,0xB3B3D7);
			
		}
	}
	if(radTab.GetData()=='1')//grd yyyymmdd
	{
		if (grdYMD.rows > 2)
		{ 
			for(var i=2;i<grdYMD.rows;i++)
			{
				
				if(grdYMD.GetGridData(i,0) == "" && grdYMD.GetGridData(i,2) != "")
				{
					var set_color = 0XEE82EE;
					
					grdYMD.SetGridText(i,2,'Sub Total');
					grdYMD.SetCellBgColor(i, 0, i, grdYMD.cols-1, set_color);
					grdYMD.SetCellBold(i,2,i,grdYMD.cols-1,4);
				}
			}
			grdYMD.SetGridText(grdYMD.rows-1,2,'Total');
			grdYMD.SetCellBold(grdYMD.rows-1,2,grdYMD.rows-1,grdYMD.cols-1,4);
			grdYMD.SetCellBgColor(grdYMD.rows-1, 0, grdYMD.rows-1, grdYMD.cols-1,0xB3B3D7);
			
		}
	}
}
function OnChangeTab(pos)
 { 
    switch (pos)
    {        
        case 'radTab' :
            var strRad = radTab.GetData();
                     
	        switch (strRad)
	        {
		         case '1':	
					dtMonth.style.display = "none";
					dtFrom.style.display = "";
					dtTo.style.display = "";
		            grdYMD.style.display      = ""; 
		            grdData.style.display = "none";	
					OnSearch();	
                break;
                
                case '2':
					dtMonth.style.display = "";
					dtFrom.style.display = "none";
					dtTo.style.display = "none";
		            grdYMD.style.display      = "none"; 
		            grdData.style.display = "";	
					OnSearch();
                break;		         
            }             
        break;
    }    
 }
</script>

</head>
<body>
 <gw:data id="dso_jart00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" parameter="" function="ht_sel_60270110" procedure="" >  
                <input bind="grdData" >  
                    <input bind="dtMonth" />  
					<input bind="lstLocation" /> 
					<input bind="txtItem" />
					<input bind="lstGolfType" />
                </input> 
                <output bind="grdData" /> 
            </dso> 
        </xml> 
    </gw:data> 
<!---------------------------------------------------------->
<gw:data id="dso_Grid_YYDDMM" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" parameter="" function="ht_sel_60270110_from_to" procedure="" >  
                <input bind="grdYMD" >  
                    <input bind="dtFrom" />  
					<input bind="dtTo" /> 
					<input bind="lstLocation" /> 
					<input bind="txtItem" />
					<input bind="lstGolfType" />
                </input> 
                <output bind="grdYMD" /> 
            </dso> 
        </xml> 
    </gw:data> 	
<!---------------------------------------------------------->	
    <table width="100%" style="height:100%">
        <tr style="height: 5%">
			<td style="width: 15%; white-space: nowrap" align="center">
				<gw:radio id="radTab" value="2" styles="width:100%" onchange="OnChangeTab('radTab')">                      
					<span id="tab_1" value="1">YTD</span>
					<span id="tab_2" value="2">Month</span>
				</gw:radio>
            </td>
            <td width="8%" ><gw:datebox id="dtMonth" type="month" lang="1" onchange="OnSearch()"/></td>
			<td width="7%" ><gw:datebox id="dtFrom" lang="1" onchange="OnSearch()" /></td>
			<td width="7%" ><gw:datebox id="dtTo" lang="1" onchange="OnSearch()" /></td>
            <td width="15%"><gw:list id="lstLocation" onchange="OnSearch()" /></td>
            <td width="5%" align="center">Item</td>
			<td width="15%"><gw:textbox id="txtItem"  onenterkey="OnSearch()"/></td>
			<td width="5%" align="center">Customer</td>
			<td width="12%"><gw:list id="lstGolfType" onchange="OnSearch()" /></td>
            <td width="8%" align="right"><gw:label id="lblRecord" styles="color: blue; width: 100%"></gw:label></td>
            <td with="1%"></td>
            <td with="3%" align="right"><gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
            <td style="width: 3%"><gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" /></td>
        </tr>
        <tr style="height: 95%" >
            <td colspan="13">
                 <gw:grid 
                    id="grdData"
                    header="Item code|Item Name|Group|Unit|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|Total" 
                    format  ="0|0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0"
                    aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    defaults="|||||||||||||||||||||||||||||||||||" 
                    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    sorting='T'
                    autosize='T'
	                styles="width:100%; height:100%"
                    />
					<gw:grid 
                    id="grdYMD"
                    header="Item code|Item Name|Group|Unit|Total" 
                    format  ="0|0|0|0|-0"
                    aligns  ="0|0|0|0|0" 
                    defaults="||||" 
                    editcol ="0|0|0|0|0" 
                    sorting='T'
                    autosize='T'
	                styles="width:100%; height:100%"
                    />
            </td>
            </td>
        </tr>
    </table>
</body>
</html>
