<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>POP Transaction</title>
</head>

<script type="text/javascript" language="javascript">
var p_comma = '' ;
//=========================================================================================
var G1_TYPE			= 0,
	G1_TR_DATE		= 1,
	G1_ITEM_BC		= 2,
	G1_ITEM_CODE	= 3,
	G1_ITEM_NAME	= 4,
	G1_UOM			= 5,
	G1_TR_QTY		= 6,
	G1_LOT_NO		= 7,
	G1_WH_ID		= 8,
	G1_WH_NAME		= 9,
	G1_WH_LOC		= 10,
	G1_PRO_YN		= 11,
	G1_PRO_TIME		= 12,
	G1_TR_PK		= 13;
//=================================================================================

function BodyInit()
{     
    System.Translate(document);
    BindingDataList();         
}
//=================================================================================

function BindingDataList()
{    
    var data="";    
	
    data = "data|1|INCOMING|2|OUTGOING|3|GOODS DELI";
    lstTransType.SetDataText( data);
    lstTransType.value = '1' ;	  
      
    data = "<%=CtlLib.SetListDataSQL("select pk, WH_ID || ' * '| | WH_NAME from TLG_IN_WAREHOUSE a where  del_if=0 order by WH_ID ")%>||";
    lstWarehouse.SetDataText( data);
    lstWarehouse.value = '' ;	
	
	var ctr = grdMaster.GetGridControl();     
    ctr.ColFormat(G1_TR_QTY) = "#,###,###,###,###,###.##";		 

} 
//=================================================================================
function OnSearch()
{
     data_bini00010.Call('SELECT');    
}

//=================================================================================

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'data_bini00010':			 
			if ( grdMaster.rows > 1 )
			{   				   				 			  
   				grdMaster.SetCellBold( 1, G1_ITEM_BC, grdMaster.rows - 1, G1_ITEM_BC, true);  
				
				grdMaster.SetCellBgColor( 1, G1_TYPE,      grdMaster.rows - 1, G1_TYPE,      0xCCFFFF );				
				grdMaster.SetCellBgColor( 1, G1_ITEM_CODE, grdMaster.rows - 1, G1_ITEM_NAME, 0xFFFFCC );					
				grdMaster.SetCellBgColor( 1, G1_WH_ID,     grdMaster.rows - 1, G1_WH_NAME,   0xCCFFFF );					
			}	
		break;
		
		case 'pro_bini00010_2':
			alert(txtReturnValue.text);
			OnSearch();
		break;
		
		case 'pro_bini00010_3':
			alert(txtReturnValue.text);
			OnSearch();
		break;
		
	}
}

//=========================================================================================================
function OnProcess(pos)
{
    txtTransPK.text = '';
    p_comma = '';
	
    for(var i = 0; i < grdMaster.rows; i++)
    {
        if ( grdMaster.GetGridControl().isSelected(i) == true )
        {
		    txtTransPK.text += p_comma + grdMaster.GetGridData( i, G1_TR_PK );
		    p_comma = ","
        }
    }
	//--------------------------
    switch(pos)
    {
        case 'Process':
            if ( grdMaster.row > 0 )
			{				 
                 if ( confirm ('Do you want to Process Data ?') )
                 {
                        pro_bini00010_2.Call();
                 } 
			}	       
        break; 
		
		case 'Cancel':
			if ( grdMaster.row > 0 )
			{				 
                 if ( confirm ('Do you want to Cancel Data ?') )
                 {
                        pro_bini00010_3.Call();
                 } 
			}	
		break;   
    }   
}
 
 
//=========================================================================================================

</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!------------------------------------------------------------------->
    <gw:data id="data_bini00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bini00010" > 
                <input> 
                     <input bind="lstTransType" />   
                     <input bind="dtDateFrom" />  
                     <input bind="dtDateTo" />  
                     <input bind="txtBCLotNo" />  
					 <input bind="txtItem" />
					 <input bind="lstWarehouse" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bini00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bini00010_2" > 
                <input>
                    <input bind="txtTransPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>  
	<!---------------------------------------------------------------->
    <gw:data id="pro_bini00010_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bini00010_3" > 
                <input>
                    <input bind="txtTransPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>      
    <!------------------------------------------------------------------------------->
    <table id="main" border="0" style="width: 100%; height: 100%" class="eco_line" cellpadding="0" cellspacing="0">
        <tr style="height: 2%" class="eco_bg">
            <td style="width: 100%" align="right">
                <table style="height:100%;" cellpadding="2" cellspacing="1">
                    <tr>
                        <td>
                            <gw:button id="dBtnMB" img="process" text="Process" onclick="OnProcess('Process')" />				 
                        </td>
			            <td>
                            <gw:button id="dBtnMB" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />				 
                        </td>           
                        <td>
                            <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 2%">
            <td class="eco_line_t">
                <table style="height:100%;width:100%" cellpadding="2" cellspacing="1">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right" >
                            Trans Type
                        </td>
                        <td style="width: 10%; white-space: nowrap;">
                            <gw:list id="lstTransType" text="" styles="width:100%"  />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right" >
                            Date
                        </td>
                        <td style="width: 15%; white-space: nowrap;">
                            <gw:datebox id="dtDateFrom" styles="width:100%" lang="<%=Session("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtDateTo" styles="width:100%" lang="<%=Session("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right" >
                            Item
                        </td>
                        <td style="width: 15%; white-space: nowrap;">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()"/>
                        </td>
			             <td style="width: 5%; white-space: nowrap" align="right" >
                            BC/Lot No
                        </td>
                        <td style="width: 15%; white-space: nowrap;">
                            <gw:textbox id="txtBCLotNo" styles="width:100%" onenterkey="OnSearch()"/>
                        </td>
			            <td style="width: 5%; white-space: nowrap" align="right" >
                            W/H
                        </td>            
			            <td style="width: 15%; white-space: nowrap;">
                            <gw:list id="lstWarehouse" text="" styles="width:100%" onchange="OnSearch()" />
                        </td>	
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 90%">
            <td class="eco_line_t">
                <gw:grid id='grdMaster' 
                    header='Type|Tr Date|Item BC|Item Code|Item Name|UOM|Tr Qty|Lot No|W/H ID|W/H Name|W/H Loc|Process Y/N|Process Time|_TR_PK'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|1|0|0|0|1|3|1|0|0|1|1|1|0' 			 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1300|1200|1300|1500|3000|800|1200|1300|1500|2500|1500|1200|1000|0'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width:100%;display:none"  />
	<gw:textbox id="txtTransPK" styles="width:100%;display:none"  />
</body>
 </html>