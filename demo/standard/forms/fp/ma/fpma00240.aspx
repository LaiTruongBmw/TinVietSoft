<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Depr Transaction Checking</title>
</head>

<script type="text/javascript" language="javascript">

var G_DEPR_SD_ID	= 0,
	G_ASSET_CODE	= 1,
	G_ASSET_NAME	= 2,
	G_TRANS_CODE	= 3,
	G_SLIP_NO		= 4,
	G_TR_AMOUNT		= 5,
	G_TR_CCY		= 6,
	G_ASSET_TYPE	= 7,
	G_ASSET_GROUP	= 8,
	G_DEPT			= 9,
	G_DEPR_RATE		= 10,
	G_ASSET_ACC		= 11,
	G_DEPR_ACC		= 12,
	G_EXP_ACC		= 13,
	G_CRT_DATE		= 14,
	G_CRT_BY		= 15,
	G_CUR_ASS_CODE	= 16,
	G_CUR_ASS_NAME	= 17;
        
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	//----------------------
    BindingDataList();
	//----------------------
    dtFrom.SetDataText(System.AddDate(dtFrom.GetData(),-365));    
	
    OnSearch('grdAsset');
    
}
//=================================================================================
function BindingDataList()
{  
	 grdAsset.GetGridControl().Cell( 7, 0, G_DEPR_SD_ID, 0, G_DEPR_SD_ID) = 0x3300cc; 
	 
     var data="";   
     data = "<%=ESysLib.SetListDataSQL(" select pk, DEPT_ID || ' * '| | DEPT_NAME from tlg_PO_DEPT a where  del_if=0 order by DEPT_ID ")%>||";     
     lstDept.SetDataText(data); 
     lstDept.value = '';
     
     data = "<%=ESysLib.SetListDataSQL("select pk, asset_Type_code || ' * ' || asset_type_name from tlg_ma_asset_type where del_if = 0 order by asset_Type_code  ") %>||";
     lstAssetType.SetDataText(data);   
     lstAssetType.value=""; 

	 data = "<%=ESysLib.SetListDataSQL("select TRANS_CODE , TRANS_CODE || ' * ' || TRANS_name from TLG_IN_TRANS_CODE where  del_if=0 and trans_Type = 'D' order by TRANS_CODE")%>||";       	 
	 lstTrType.SetDataText(data);
	 lstTrType.value="";  
	 
	 data = "<%=ESysLib.SetListDataSQL("select pk, grp_code || ' * ' || grp_name from tlg_ma_asset_group where del_if = 0 order by grp_code  ") %>||";
     lstGroup.SetDataText(data);   
     lstGroup.value="";    	  
	 	 
	 var ctrl = grdAsset.GetGridControl(); 
   
     ctrl.ColFormat(G_TR_AMOUNT) = "#,###,###,###,###,###.##";  
	 ctrl.ColFormat(G_DEPR_RATE) = "#,###,###,###,###,###.#";			   
}

//=================================================================================
function OnDataReceive(p_oData)
{
  switch(p_oData.id)
  {
    case 'data_fpma00240':
         
        if (grdAsset.rows >1)
        {
        	grdAsset.SetCellBold( 1, G_TR_AMOUNT, grdAsset.rows - 1, G_TR_AMOUNT, true);           	   
        }   
    break;
    
  }
}
//=================================================================================
function OnGridCellDblClick(objGrid)
{
    var col = event.col;
    var row = event.row;
	
    switch(objGrid.id)
    {
        case 'grdAsset':
            
        break;
        default:
        break;
    }
}
//=================================================================================
function OnReport()
{
     var url =System.RootURL + '/reports/fp/ma/rpt_fpma00240.aspx?p_line_pk='+lstDept.value+ '&p_line_name=' + lstDept.GetText() + '&p_from_date=' + dtFrom.value + '&p_to_date=' + dtTo.value; 
     System.OpenTargetPage(url);    
}
//=================================================================================
function OnSearch(pos)
{     
    switch(pos)
    {
        case'grdAsset':
            data_fpma00240.Call("SELECT");
        break;
    }   
	
}
//=================================================================================
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00240" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00240"> 
                <input bind="grdAsset" >
					<input bind="dtFrom" />  
                    <input bind="dtTo" />
                    <input bind="lstDept" />
					<input bind="lstGroup" />
                    <input bind="lstAssetType" />					
                    <input bind="txtAsset" />
					<input bind="lstTrType" />					                                        
                </input>
                <output  bind="grdAsset" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" >
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap;" align="right">
                Dept
            </td>
            <td style="width: 30%">
                <gw:list id="lstDept" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>
            <td style="width: 5%; white-space: nowrap;" align="right">
                Group
            </td>
            <td style="width: 30%" >
                <gw:list id="lstGroup" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>
			<td style="width: 5%; white-space: nowrap;" align="right">
                Tr Date
            </td>
            <td style="width: 20%; white-space: nowrap;" >
                <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" mode="01" onchange="OnSearch('grdAsset')" />
                ~
                <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" mode="01" onchange="OnSearch('grdAsset')" />
            </td>	
			<td style="width: 3%">                
            </td>
			<td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdAsset')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnExcel" img="excel" alt="excel" onclick="OnReport()" />
            </td>			 						              
        </tr>
         <tr style="height: 1%">
		 	<td style="width: 5%; white-space: nowrap;" align="right">
                Asset Type
            </td>
            <td style="width: 30%" >
                <gw:list id="lstAssetType" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>			                       
             <td style="width: 5%; white-space: nowrap" align="right">
                Asset
            </td>
            <td style="width: 30%">
                <gw:textbox id="txtAsset" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdAsset')" />
            </td>           
            <td style="width: 5%; white-space: nowrap" align="right"  >
                Tr Type
            </td>			                
            <td style="width: 25%; white-space: nowrap" colspan=4 >
                <gw:list id="lstTrType" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>                        
        </tr>
        <tr style="height: 99%">
            <td colspan="10">
                <gw:grid id='grdAsset' 
					header='Depr S/D|Asset Code|Asset Name|Trans Type|Slip No|Tr Amount|Tr CCY|Asset Type|Asset Group|Department|Depr Rate|Asset Acc|Depr Acc|Expense Acc|Crt Date|Mod Date|Curr Asset Code|Curr Asset Name'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='1|0|0|0|0|3|1|0|0|0|3|0|0|0|1|1|0|0'
                    check='|||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1200|2000|3000|1500|1200|1200|800|1500|1500|1500|1200|1500|1500|1500|2000|2000|2000|3000'
                    sorting='T' 
					defaults='||||||||||||||||' 
					styles='width:100%; height:100%' 
					acceptnulldate="T"
					/>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
 
</body>
</html>
