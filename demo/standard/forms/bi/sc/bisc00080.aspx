<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Warehouse Stock Checking</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>


var G_WAREHOUSE		= 0,
    G_ITEM_GROUP    = 1,
    G_ITEM_CODE     = 2, 
    G_ITEM_NAME     = 3,    
    G_UOM           = 4,
    G_LOT_NO     	= 5,
    G_IN_QTY       	= 6,
    G_OUT_QTY       = 7,
    G_END_QTY       = 8,
    G_EXPIRE_DATE   = 9,
    G_DAY_LEFT    	= 10;
    
//=============================================================================

function BodyInit()
{
    System.Translate(document); 
    
	OnFormatGrid();   
}

//=============================================================================

function OnFormatGrid()
{
	var data = "";  
    
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' order by grp_nm")%>||";     
    lstItemGrp.SetDataText(data);   
    lstItemGrp.value="";  

	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";
    lstWHType.SetDataText(data);
    lstWHType.value = '';
    
    data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from tlg_in_warehouse where del_if = 0 and use_yn = 'Y' order by wh_id ")%>||";     
    lstWarehouse.SetDataText(data);   
    lstWarehouse.value="";

    grdDetail.GetGridControl().ColFormat(G_IN_QTY) 		= "###,###,###.##" ;
    grdDetail.GetGridControl().ColFormat(G_OUT_QTY)    	= "###,###,###.##" ;
    grdDetail.GetGridControl().ColFormat(G_END_QTY) 	= "###,###,###.##" ;
	grdDetail.GetGridControl().ColFormat(G_DAY_LEFT)  	= "###,###,###" ;
	
}

//=============================================================================

function OnDataReceive(obj) 
{
    if (obj.id == "data_bisc00080") 
	{
		grdDetail.SetCellBold( 1, G_END_QTY, grdDetail.rows-1, G_END_QTY, true);
			
			for (var i=1; i<grdDetail.rows; i++)
			{
				if ( grdDetail.GetGridData( i, G_DAY_LEFT ) <= 5 )
				{
					grdDetail.GetGridControl().Cell( 7, i, G_END_QTY, i, G_DAY_LEFT ) = 0x3300cc;
				}	
			}
	}
}
//=============================================================================
function OnSearch()
{
    data_bisc00080.Call("SELECT");
}
//=============================================================================
 
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="pro_bisc00080" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_bisc00080" >
                <input>
                    <input bind="lstWHType" />
                </input>
                <output>
                    <output bind="lstWarehouse" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00080" onreceive=""> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bisc00080" >  
                <input> 
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="lstWHType" />
                    <input bind="lstWarehouse" />
                    <input bind="lstItemGrp" />
                    <input bind="txtItem" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->     
                <table style="height: 100%; width: 100%"   >
                    <tr style="height: 1%">
                        
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Expire
                                    </td>
                                    <td style="width: 10%; white-space: nowrap">
                                        <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" />
                                        ~<gw:datebox id="dtTo" lang="<%=Application("Lang")%>" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right" >
                                        W/H
                                    </td>
									<td style="width: 10%; white-space: nowrap" align="right">
										<gw:list id="lstWHType" styles="width:100%" onchange="pro_bisc00080.Call('SELECT')" />
									</td>
                                    <td style="width: 25%; white-space: nowrap">
                                        <gw:list id="lstWarehouse" styles="width:100%" onchange="OnSearch('BALANCE')" csstype="mandatory" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right" >
                                        Item
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstItemGrp" styles="width:100%" onchange="OnSearch('BALANCE')" csstype="mandatory" />
                                    </td>                                    
                                    <td style="width: 10%">
                                        <gw:textbox id="txtItem" styles="width:100%;" onenterkey="OnSearch('BALANCE')" />
                                    </td>
                                    <td style="width: 4%">
                                    </td>                                     
                                    <td style="width: 1%" align="right">
                                        <gw:button id="btnSearch_1" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                                    </td>
                                
                    </tr>
                    <tr style="height: 99%">
                        <td colspan=15 >
                            <gw:grid id='grdDetail' 
								header='W/H|Item Group|Item Code|Item name|UOM|Lot No|In Qty|Out Qty|End Qty|Expire Date|Days Left'
                                format='0|0|0|0|0|0|0|0|0|4|0' 
								aligns='0|0|0|0|1|1|3|3|3|1|1'  
                                editcol='0|0|0|0|0|0|0|0|0|0|0' 
								widths='2000|2000|1500|3000|800|1500|1500|1500|1500|1200|0'
                                sorting='T' styles='width:100%; height:100%' acceptnulldate='T' />
                        </td>
                    </tr>
                </table>
            
</body>
<!------------------------------------------------------->
</html>
