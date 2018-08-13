<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Deli Voucher / Invoice Checking</title>
</head>

<script>
 
var G_WH_ID			= 0,
    G_WH_NAME		= 1,
	G_DELI_DATE		= 2,
	G_CUST_ID		= 3,
	G_CUST_NAME		= 4,
	G_SLIP_NO		= 5,
	G_CCY			= 6,
	G_DELI_ITEM_AMT	= 7,
	G_DELI_TAX_AMT	= 8,
	G_DELI_TOTAL_AMT= 9,
	G_INV_NO		= 10,
	G_INV_DATE		= 11,
	G_INV_ITEM_AMT	= 12,
	G_INV_TAX_AMT	= 13,
	G_INV_TOTAL_AMT	= 14; 
  
 //===============================================================
 function BodyInit()
 { 
 	System.Translate(document);  // Translate to language session

    //----------------
    FormatGrid();
    //----------------  
	OnProcess('CHANGE_MONTH');  
 }
 //===============================================================

 function FormatGrid()
 {
    grdDetail.GetGridControl().ColFormat(G_DELI_ITEM_AMT)  	= "###,###,###,###,###.##";
	grdDetail.GetGridControl().ColFormat(G_DELI_TAX_AMT)    = "###,###,###,###,###.##";
    grdDetail.GetGridControl().ColFormat(G_DELI_TOTAL_AMT)  = "###,###,###,###,###.##";
    grdDetail.GetGridControl().ColFormat(G_INV_ITEM_AMT)	= "###,###,###,###,###.##"; 
	grdDetail.GetGridControl().ColFormat(G_INV_TAX_AMT) 	= "###,###,###,###,###.##";			
	grdDetail.GetGridControl().ColFormat(G_INV_TOTAL_AMT)  	= "###,###,###,###,###.##";
	 	
	var data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||";
    lstWHType.SetDataText(data);
    lstWHType.value = '';
	 
	grdDetail.GetGridControl().MergeCells  = 2 ;	
    grdDetail.GetGridControl().MergeCol(0) = true ;	
    grdDetail.GetGridControl().MergeCol(1) = true ;   	
    grdDetail.GetGridControl().MergeCol(2) = true ;
	grdDetail.GetGridControl().MergeCol(3) = true ;
	grdDetail.GetGridControl().MergeCol(4) = true ;
 }

 //===============================================================
 function OnSearch(pos)
 {
 	switch (pos)
	{
		case 'Detail' :			 
			data_dsbs00300.Call("SELECT");			 
		break;		 		
	}       
 }
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
	  		case 'data_dsbs00300':
				if (grdDetail.rows >1)
				{
					grdDetail.Subtotal( 0, 2, -1, '7!8!9!12!13!14');
				}
			break;						
      }	 
 }
 //===============================================================
 
function OnReport()
{ 
           var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00300.aspx?p_partner_pk='+ txtPartnerPK.text 
           + '&p_from_date=' + dtFrom.value 
           + '&p_to_date=' + dtTo.value 
           + '&p_po=' + txtPOTab1.text
           + '&p_item=' + txtItemTab1.text;
		   
           System.OpenTargetPage(url);  
}
 
   
 //=================================================================
 function OnProcess(pos)
 {
	switch (pos)
	{
		case 'CHANGE_MONTH':
			pro_dsbs00300_1.Call();
		break;
		
		case 'CHANGE_WH_TYPE':
			pro_dsbs00300_2.Call();
		break;
	}			
 }
 
 //=================================================================
 function OnReport(pos)
 {
	switch(pos)
	{
		case 'DETAIL':
			var url =System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00300.aspx?p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_wh_type='+ lstWHType.value +'&p_wh_pk='+ lstWareHouse.value +'&p_cust='+ txtCust.text ;
			window.open(url); 		
		break;
	}
 }
 //=================================================================
 
</script>

<body>
	<!-------------------------------------------------------------------------->
    <gw:data id="pro_dsbs00300_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsbs00300_1" > 
                <input>
                    <input bind="dtMonth" />
                </input> 
                <output>
                    <output bind="dtFrom" />
                    <output bind="dtTo" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------------->
    <gw:data id="pro_dsbs00300_2" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_dsbs00300_2" >
                <input>
                    <input bind="lstWHType" />
                </input>
                <output>
                    <output bind="lstWareHouse" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00300" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00300" > 
                <input bind="grdDetail" >
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
					<input bind="lstWHType" />
					<input bind="lstWareHouse" />
					<input bind="txtCust" />
					<input bind="radTab" />
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>

    <!--------------------------------------------------------------------------> 
	
    <table style="width: 100%; height: 100%" name="By All Customer"> 
                    <tr style="height: 1%">
						<td>
							<table style="width: 100%; height: 100%">
								<tr>
			 						<td style="width: 5%">
			                            Month
			                        </td>
			                        <td style="width: 5%">
			                            <gw:datebox id="dtMonth" text="" maxlen="10" type="month" lang="<%=Session("Lang")%>"
			                                onchange="OnProcess('CHANGE_MONTH')" />
			                        </td>
			                        <td style="width: 5%" align="right">
			                            Date
			                        </td>
			                        <td style="width: 15%; white-space: nowrap">
			                            <gw:datebox id="dtFrom" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />                                              
								  		~
			                            <gw:datebox id="dtTo" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />
			                        </td>
									
									<td align="RIGHT" style="width: 5%; white-space: nowrap">
										W/H
									</td> 
									<td style="width: 20%; white-space: nowrap" >  
										<gw:list id="lstWHType" styles="width:100%" onchange="OnProcess('CHANGE_WH_TYPE')" />
									</td>
									<td style="width: 20%; white-space: nowrap" >  
										<gw:list id="lstWareHouse" styles="width:100%" onchange="" />
									</td>
						
			                        <td style="width: 5%" align="right" >
			                            Cust
			                        </td>
			                        <td style="width: 15%">
			                            <gw:textbox id="txtCust" styles='width:100%' onenterkey="OnSearch('Detail')" />
			                        </td>
									<td style="width: 3%">	
										<gw:radio id="radTab" value="1" styles="width:100%" onchange="OnSearch('Detail')"> 
											<span value="1" id="">Deli</span> 
											<span value="2" id="">Invoice</span> 									 
										</gw:radio>
			                        </td>	 
			                        <td style="width: 1%">
			                            <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport('DETAIL')" />
			                        </td>	 
			                        <td style="width: 1%">
			                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
			                        </td>								
								</tr>
							</table>
						</td>                       
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdDetail' header='W/H ID|W/H Name|Out Date|Cust ID|Cust Name|Slip No|CCY|Item Amount|Tax Amount|Total Amount|Invoice No|Invoice Date|Item Amount|Tax Amount|Total Amount'
                                format='0|0|4|0|0|0|0|0|0|0|0|4|0|0|0' 
								aligns='0|0|1|0|0|1|1|3|3|3|1|1|3|3|3' 						 
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='1200|1500|1200|1500|4000|1500|600|1500|1500|1500|1500|1200|1500|1500|1500' 
								sorting='T' 
								styles='width:100%; height:100%'  acceptnulldate="T" />
                        </td>
                    </tr>                
    </table>	 
 
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtPartnerPK" styles='width:100%;display:none' />
	<gw:textbox id="txtDivisionPK" styles="width:100%;display:none"  />
	<!-------------------------------------------------------------------------->
</body>
</html>
