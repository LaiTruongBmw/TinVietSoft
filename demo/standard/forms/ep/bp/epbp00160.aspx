<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Price History</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

var G1_ITEM_PK   	= 0,           
    G1_ITEM_CODE 	= 1,
    G1_ITEM_NAME 	= 2,
    G1_UOM       	= 3,
    G1_SUPPLIER  	= 4,
    G1_PO_DATE   	= 5,
	G1_PO_QTY	 	= 6,	
    G1_UPRICE    	= 7,
	G1_LAST_PRICE	= 8,
	G1_PO_CCY	 	= 9,
	G1_SUPPLIER_PK	= 10,
	G1_DETAIL_PK	= 11,
	G1_L_NAME		= 12,
	G1_F_NAME		= 13;
	
//==================================================================
         
function BodyInit()
{       
    //---------------------------------- 
    System.Translate(document);
    var now = new Date(); 
    var lmonth, ldate;
 
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;      
    //---------------------------------- 
           
    FormatGrid();
    //-----------------------------------
}
//==================================================================
  
function FormatGrid()
{
    var ctrl = grdSearch.GetGridControl();       
    
    ctrl.Cell( 7, 0, G1_UPRICE, 0, G1_UPRICE) = 0x3300cc;
    //--------------------- 
	ctrl.ColFormat(G1_UPRICE) 		= "###,###,###.##";
	ctrl.ColFormat(G1_LAST_PRICE) 	= "###,###,###.##";
	ctrl.ColFormat(G1_PO_QTY) 		= "###,###,###.##";
	//---------------------
	data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";
    lstItemGroup.SetDataText(data);
    lstItemGroup.value = '';   
	//---------------------
}

//==================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'grdSearch':
            data_epbp00160.Call('SELECT');
        break;
    }
}
//==================================================================   
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_epbp00160":
            lbRecord.text = grdSearch.rows -1 + " row(s)" ;
			
			if ( grdSearch.rows > 1 )
			{ 
            	grdSearch.SetCellBgColor( 1, G1_SUPPLIER, grdSearch.rows - 1, G1_SUPPLIER, 0xCCFFFF ); 
			
            	grdSearch.SetCellBold( 1, G1_ITEM_CODE, grdSearch.rows - 1, G1_ITEM_CODE, true);   
				grdSearch.SetCellBold( 1, G1_UPRICE,    grdSearch.rows - 1, G1_UPRICE,    true);                         			           
			}		
        break;
		
		case "pro_epbp00160":
			alert(txtReturnValue.text);
			
			OnSearch('grdSearch');
		break;
    }
}   

//==================================================================
 
function OnProcess(pos)
{
    switch (pos)
    {
        case 'PRICE' :
            
            if ( confirm ('Do you want to process Item Unit Price?') )
            {
                pro_epbp00160.Call();
            }    
                   
        break;
        
     }
}	   
//=================================================================== 
function OnPrint()
{
    if(grdSearch.rows > 1)
    {
        var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00160.aspx?p_dt_from='+dtFrom.value+'&p_dt_to='+dtTo.value+'&p_group_pk='+lstItemGroup.value+'&p_item='+txtItem.text+'&p_partner='+txtPartner.text+'&p_last_time='+chkLastTime.value ;
        System.OpenTargetPage(url);  
    }
}		
//==================================================================      
</script>

<body>
	<!--------------------------------------------------------------------->
    <gw:data id="data_epbp00160" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_lg_SEL_epbp00160" procedure="st_lg_upd_epbp00160" >
                <input bind="grdSearch" >
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="lstItemGroup" />
			        <input bind="txtItem" />
					<input bind="txtPartner" />
					<input bind="chkLastTime" />
                </input>
                <output bind="grdSearch" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00160" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00160" > 
                <input>
                    <input bind="dtFrom" /> 
					<input bind="dtTo" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Item
                        </td>
						<td style="width: 20%">
							<gw:list id="lstItemGroup" styles="width: 100%" onchange="OnSearch('grdSearch')" />
						</td>
                        <td style="width: 10%">
                            <gw:textbox id="txtItem" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdSearch')" />
                        </td>						
						<td style="width: 5%; white-space: nowrap" align="right">
                            Partner
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtPartner" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdSearch')" />
                        </td>	
						<td style="width: 10%; text-align: center; white-space: nowrap">
                            <gw:checkbox id="chkLastTime" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('grdSearch')">Last Time
							</gw:checkbox>
                        </td>											
                        <td style="width: 7%; text-align: center">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>(s)</gw:label>
                        </td>
                        <td style="width: 1%">
                             <gw:button id="btnProcess" img="Process U/Price"" text="Process U/Price" onclick="OnProcess('PRICE')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button img="excel" alt="Report" id="btnReport" onclick="OnPrint()" />
                        </td>
						<td style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch1" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="13">
                            <gw:grid id='grdSearch' header='_PK|Item Code|Item name|UOM|Supplier|Price date|Qty|U/Price|Last U/P|CCY|_Supplier_PK|_DETAIL_PK|L Name|F Name'
                                format='0|0|0|0|0|4|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|1|0|1|3|3|3|1|0|0|0|0' 
								check='|||||||||||||' 
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='0|2000|4000|800|4000|1200|1500|1500|1000|0|0|1200|1200' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!----------------------------------------------------------->
</body>
</html>
