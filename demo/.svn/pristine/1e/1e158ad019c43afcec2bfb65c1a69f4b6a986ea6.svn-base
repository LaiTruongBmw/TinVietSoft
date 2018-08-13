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
	G1_STATUS		= 1,
	G1_TR_DATE		= 2,
	G1_ITEM_BC		= 3,
	G1_ITEM_CODE	= 4,
	G1_ITEM_NAME	= 5,
	G1_UOM			= 6,
	G1_TR_QTY		= 7,
	G1_LOT_NO		= 8,
	G1_WH_ID		= 9,
	G1_WH_NAME		= 10,
	G1_WH_LOC		= 11,
	G1_PRO_YN		= 12,
	G1_PRO_TIME		= 13,
	G1_TR_PK		= 14;
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
	data = "data||All|001|001 * Not Exist |002|002 * Not Warehouse|003|003 * Different Warehouse|004|004 * Different Location|000|000 * In Warehouse|111|111 * Makeslip";  
    lstErrorCode.SetDataText( data);
    lstErrorCode.value = '0' ;	  
	
    data = "<%=CtlLib.SetListDataSQL("select pk, WH_ID || ' * '| | WH_NAME from TLG_IN_WAREHOUSE a where  del_if=0 order by WH_ID ")%>||";
    lstWarehouse.SetDataText( data);
    lstWarehouse.value = '' ;	
	lstWarehouseProcess.SetDataText( data);
    lstWarehouseProcess.value = '' ;
	
	var ctr = grdMaster.GetGridControl();     
    ctr.ColFormat(G1_TR_QTY) = "#,###,###,###,###,###.##";		 

	 tr_month.style.display="none";
} 
//=================================================================================
function OnSearch()
{
     data_biws00060.Call('SELECT');    
}
function OnReport()
{
	var url = System.RootURL + "/standard/reports/bi/sa/rpt_biws00060_0.aspx?p_from_date="+ dtDateFrom.value + "&p_to_date=" + dtDateTo.value ;
				url = url + "&p_item=" + txtItem.text + "&p_bc_lotno=" + txtBCLotNo.text + "&p_wh=" + lstWarehouse.value ;
				url = url + "&p_status=" + lstErrorCode.value  ;
     	 
			System.OpenTargetPage(url);		
}
//=================================================================================

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'data_biws00060':			 
			if ( grdMaster.rows > 1 )
			{   				   				 			  
   				grdMaster.SetCellBold( 1, G1_ITEM_BC, grdMaster.rows - 1, G1_ITEM_BC, true);  
				
				grdMaster.SetCellBgColor( 1, G1_TYPE,      grdMaster.rows - 1, G1_TYPE,      0xCCFFFF );				
				grdMaster.SetCellBgColor( 1, G1_ITEM_CODE, grdMaster.rows - 1, G1_ITEM_NAME, 0xFFFFCC );					
				grdMaster.SetCellBgColor( 1, G1_WH_ID,     grdMaster.rows - 1, G1_WH_NAME,   0xCCFFFF );					
			}
			lblRowCount.text = grdMaster.rows - 1;			
		break;
		
		case 'pro_biws00060':
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
    if(lstWarehouseProcess.value =="")
	{
		alert("Please select one warehouse to process");
		return;
	}
	//--------------------------
    switch(pos)
    {
        case 'Process':	 
			 if ( confirm ('Do you want to Process Data ?') )
			 {
					pro_biws00060.Call();
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
function OnToggle(n)
{
    switch(n)
    {
        case 1:
            
            break;
       case 2:
            if(img2.status == "show")
            {
                img2.status = "hide";
                img2.src = "../../../../system/images/close_popup.gif";
			    img2.alt="Hide month salary information";
			    tr_month.style.display='';
            }
            else 
            {
                img2.status = "show";
                img2.src = "../../../../system/images/iconmaximize.gif";
			    img2.alt="Show month salary information";
			    tr_month.style.display="none";
            }
           
            break;   
       case 3:
            
            break;       
    }    
    
  
}
</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_biws00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_biws00060" > 
                <input> 
					<input bind="lstErrorCode" />					 
                     <input bind="dtDateFrom" />  
                     <input bind="dtDateTo" />  
                     <input bind="txtBCLotNo" />  
					 <input bind="txtItem" />
					 <input bind="lstWarehouse" />
					  <input bind="chkGroup" />	
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_biws00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_biws00060" > 
                <input>
                    <input bind="lstWarehouseProcess" /> 
					<input bind="dtDateProcess" />
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
            <dso type="process" procedure="st_lg_pro_biws00060_3" > 
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
    <table style="width: 100%; height: 100%;">
		<tr id="tr_month" style="width: 100%; height: 1%; " >
			<td style="background-color: #B4E7FF" colspan="11">
				<table style="width: 100%; height: 100%" border="0">
					<tr>
						<td  style="width: 1%;border:0;cursor:hand" align="right" >
							
						</td>
						<td style="width: 1%; white-space: nowrap" align="right" >
						   
						</td>
						<td style="width: 20%; white-space: nowrap;">
							
						</td>
						<td style="width: 15%; white-space: nowrap" align="right" >
							Warehouse
						</td>
						<td style="width: 15%; white-space: nowrap;">
							<gw:list id="lstWarehouseProcess" text="" styles="width:100%"  />
						</td>
						 <td style="width: 5%; white-space: nowrap" align="right" >
							<gw:datebox id="dtDateProcess" styles="width:100%" lang="<%=Session("Lang")%>" mode="01" />
						</td>
						<td style="width: 4%">
										 
						</td> 
						<td style="width: 18%; white-space: nowrap;">
							<gw:icon id="dBtnMB" img="2" text="Process"  onclick="OnProcess('Process')" />
						</td>
						
						
						
					</tr>
				</table>
			</td>
		</tr>
        <tr style="width: 100%; height: 1%; ">
            <td  style="width: 1%;border:0;cursor:hand" align="right" >
				<img status="show" id="img2" alt="Show Process" src="../../../../system/images/iconmaximize.gif"  onclick="OnToggle(2)"  />
			</td>
            <td style="width: 1%; white-space: nowrap" align="right" >
                Date
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:datebox id="dtDateFrom" styles="width:100%" lang="<%=Session("Lang")%>" mode="01" />
                ~
                <gw:datebox id="dtDateTo" styles="width:100%" lang="<%=Session("Lang")%>" mode="01" />
            </td>
            <td style="width: 15%; white-space: nowrap" align="right" >
                Item
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()"/>
            </td>
			 <td style="width: 5%; white-space: nowrap" align="right" >
                BC/Lot No
            </td>
            <td style="width: 18%; white-space: nowrap;">
                <gw:textbox id="txtBCLotNo" styles="width:100%" onenterkey="OnSearch()"/>
            </td>
			
            
			<td style="width: 1%">
                <gw:icon id="dBtnMB" img="2" text="Cancel" styles='width:100%;display:none' onclick="OnProcess('Cancel')" />				 
            </td>           
            <td style="width: 1%">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
			<td style="width: 1%">
                <gw:button id="btnReport" img="excel" alt="Report" onclick="OnReport()" />
            </td>
        </tr>
        <tr style="width: 100%; height: 1%; ">
			<td style="width: 1%;border:0;cursor:hand" align="right" >
			</td>
			<td style="width: 5%; white-space: nowrap" align="right" >
                W/H
            </td>            
			<td style="width: 20%; white-space: nowrap;">
                <gw:list id="lstWarehouse" text="" styles="width:100%" onchange="OnSearch()" />
            </td>
			<td  style="width: 5%;" align="right" >
                Status
            </td>
			<td style="width: 20%">
			<gw:list id="lstErrorCode" text="" styles="width:100%"  />
            </td>
			<td style="width: 10%" align="right" >
				<gw:checkbox id="chkGroup" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch()"></gw:checkbox>
			 </td>
			<td style="width: 18%" align="left">
                Group Item
            </td>
			<td style="width: 1%">
                			 
            </td>           
            <td style="width: 1%">
               Records:
            </td>
			<td style="width: 1%">
               <gw:label id="lblRowCount" styles='width:100%;color:cc0000;font:9pt' text='0' type="number" format="###,###.##" />
            </td>
		</tr>
		<tr style="width: 100%; height: 90%">
            <td colspan="17">
                <gw:grid id='grdMaster' 
                    header='_Type|Status|Tr Date|Item BC|Item Code|Item Name|UOM|Tr Qty|Lot No|W/H ID|W/H Name|W/H Loc|_Process Y/N|_Process Time|_TR_PK'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|0|0|1|3|1|0|0|1|1|1|0' 			 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1300|2000|1200|2000|1500|3000|800|1200|1300|1500|2500|1500|1200|1000|0'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width:100%;display:none"  />
	<gw:textbox id="txtTransPK" styles="width:100%;display:none"  />
</body>
 </html>