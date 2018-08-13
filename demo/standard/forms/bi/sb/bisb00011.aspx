<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Booking Checking</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
//======================================================================
function BodyInit()
{
    System.Translate(document); 
	txtWH_PK.text	 = "<%=Request.querystring("p_wh_pk")%>";
	txtItem_PK.text  = "<%=Request.querystring("p_item_pk")%>";
	lblItem.text = "<%=Request.querystring("p_item_code")%>";
	
	data = "<%=ESysLib.SetListDataSQL("select pk, wh_id || '-' || wh_name from TLG_IN_WAREHOUSE where del_if = 0 and use_yn='Y' order by wh_id ")%>||Select ALL"; 
    lstWH.SetDataText(data);
    lstWH.value = txtWH_PK.text; 
    
    lstWH.SetEnable(false);
    
	data_bisb00011.Call('SELECT');
}
//=====================
function ReceiveData(obj)
{
	if( obj.id == "data_bisb00011" )
    {
		for(i=1;i<grdDetail.rows;i++)
		{
		    if(grdDetail.GetGridData(i,7)== "1")
		    {
		        grdDetail.SetCellBgColor( i, 0,  i, 6,  0xCCFFFF );
		    }
		    else
		    {
		        grdDetail.SetCellBgColor( i, 0,  i, 6,  0xFF99FF );
		    }
		}
		lblRecords.text = grdDetail.rows - 1 + " record(s)"
    }	
}
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisb00011" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="lg_sel_bisb00011" >  
                <input> 
                    <input bind="txtWH_PK" />
                    <input bind="txtItem_PK" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="height: 100%; width: 100%">
                <table style="height: 100%; width: 100%" name="Stock Booking" border="1">
                    <tr style="height: 1%">
                        <td>
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <gw:label><b>W/H</b></gw:label>
                                    </td>
                                    <td style="width: 40%; white-space: nowrap">
                                        <gw:list id="lstWH" styles="width:100%" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <gw:label id="lbllotno"><b>Item :</b></gw:label>
                                    </td>
                                    <td style="width: 20%; white-space: nowrap">
                                        <gw:label id="lblItem" styles="color: blue"></gw:label>
                                    </td>
                                    <td style="width: 5%" align="right">
                                    </td>
                                    <td style="width: 20%; white-space: nowrap">
                                        <gw:label id="lblRecords" styles="color: red"></gw:label>
                                    </td>
                                    <td style="width: 9%" align="center">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td>
                            <gw:grid id='grdDetail' header='Partner Name|Po NO|SO Item NO|TR Date|Lot No|Book Qty|Issue Qty|_T_TYPE'
                                format='0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0' check='|||||||' editcol='1|1|1|1|1|1|1|1'
                                widths='1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtWH_PK" styles="width: 100%;display: none" />
    <gw:textbox id="txtItem_PK" styles="width: 100%;display: none" />
    <gw:textbox id="txtLot_No" styles="width: 100%;display: none" />
    <gw:textbox id="txtBook_Tr" styles="width: 100%;display: none" />
</body>
</html>
