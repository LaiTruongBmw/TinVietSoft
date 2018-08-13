<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>MAINTAIN ASSET LIST</title>
</head>

<script type="text/javascript" language="javascript">

var G0_STATUS				= 0,
    G0_TYPE_PK		    	= 1,
    G0_TYPE_NAME			= 2,
    G0_GRP_PK				= 3,
    G0_GRP_NAME		    	= 4,
    G0_ASSET_PK		        = 5,
	G0_ASSET_CODE		    = 6,
    G0_ASSET_NAME		    = 7,
	G0_UOM		            = 8,
	G0_MA_LAST_DATE  		= 9,
	G0_MA_NEXT_DATE 	    = 10,
	G0_MA_ROUND_DAYS    	= 11,	 
    G0_MT_ASSET_CODE        = 12,
    G0_AC_ASSET_CODE		= 13,
    G0_START_DATE		    = 14,	
    G0_DEPT_PK		        = 15,
    G0_DEPT_NAME			= 16,
	G0_CHARGER_PK		    = 17,
    G0_CHARGER_NAME		    = 18,
    G0_REMARK		        = 19;
        
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	//----------------------
    BindingDataList();
	//----------------------
    dtTIToDate.SetDataText(System.AddDate(dtToFrDate.GetData(),+30));    
	
    OnSearch('grdAsset');
    
}
//=================================================================================
function BindingDataList()
{  
	 grdAsset.GetGridControl().Cell( 7, 0, G0_STATUS, 0, G0_STATUS) = 0x3300cc; 
	 
     var data="";   
     data = "<%=ESysLib.SetListDataSQL(" select pk, DEPT_ID || ' * '| | DEPT_NAME from tlg_PO_DEPT a where  del_if=0 order by DEPT_ID ")%>||";     
     lstDept.SetDataText(data); 
     lstDept.value = '';
     
     data = "<%=ESysLib.SetListDataSQL("select pk, asset_Type_code || ' * ' || asset_type_name from tlg_ma_asset_type where del_if = 0 order by asset_Type_code  ") %>||";
     lstAssetType.SetDataText(data);   
     lstAssetType.value=""; 
	 
	 data = "<%=ESysLib.SetListDataSQL("select pk, grp_code || ' * ' || grp_name from tlg_ma_asset_group where del_if = 0 order by grp_code  ") %>||";
     lstGroup.SetDataText(data);   
     lstGroup.value="";    
	 
	 data = "data|1|WAITING|2|RUNNING|3|UN-USE|4|REPAIRING|5|LOST|6|LENDING|7|LIQUIDATED||";
     lstStatus.SetDataText(data); 
	 lstStatus.value = '' ;	 	  
					   
}

//=================================================================================
function OnDataReceive(p_oData)
{
  switch(p_oData.id)
  {
    case 'data_fpma00340':
        lblRecord.text = (grdAsset.rows - 1) + ' (s)';
		  
        if (grdAsset.rows >1)
        {
        	grdAsset.SetCellBold( 1, G0_ASSET_CODE,    grdAsset.rows - 1, G0_ASSET_CODE,    true);   
        	grdAsset.SetCellBold( 1, G0_DEPT_NAME,     grdAsset.rows - 1, G0_DEPT_NAME,     true);  
			grdAsset.SetCellBold( 1, G0_MA_NEXT_DATE,  grdAsset.rows - 1, G0_MA_NEXT_DATE,  true); 
			
			grdAsset.SetCellBgColor( 1, G0_MA_LAST_DATE, grdAsset.rows - 1, G0_MA_ROUND_DAYS, 0xCCFFFF ); 
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
function OnSave(pos)
{     
    switch(pos)
    {
        case'grdAsset':
            data_fpma00340.Call();
        break;
    }   
	
}
//=================================================================================
function OnSearch(pos)
{     
    switch(pos)
    {
        case'grdAsset':
            data_fpma00340.Call("SELECT");
        break;
    }   
	
}
//=================================================================================
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00340" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="<%=l_user%>lg_sel_fpma00340" procedure="<%=l_user%>lg_upd_fpma00340" > 
                <input bind="grdAsset" >
                    <input bind="lstDept" />
                    <input bind="lstAssetType" />
                    <input bind="txtAsset" />
					<input bind="lstGroup" />
                    <input bind="dtTIFrDate" />  
                    <input bind="dtTIToDate" />
                    <input bind="lstStatus" />
                </input>
                <output  bind="grdAsset" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap;" align="right">
                Dept
            </td>
            <td style="width: 25%">
                <gw:list id="lstDept" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>
            <td style="width: 5%; white-space: nowrap;" align="right">
                Group
            </td>
            <td style="width: 25%" >
                <gw:list id="lstGroup" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>
			<td style="width: 5%; white-space: nowrap;" align="right">
                Use Date
            </td>
            <td style="width: 25%; white-space: nowrap;">
                <gw:datebox id="dtTIFrDate" lang="<%=Session("Lang")%>" mode="01" onchange="OnSearch('grdAsset')" />
                ~
                <gw:datebox id="dtTIToDate" lang="<%=Session("Lang")%>" mode="01" onchange="OnSearch('grdAsset')" />
            </td>	
			<td style="width: 25%" colspan=3 >
                <gw:list id="lstStatus" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td> 								              
        </tr>
         <tr style="height: 1%">
		 	<td style="width: 5%; white-space: nowrap;" align="right">
                Asset Type
            </td>
            <td style="width: 25%" >
                <gw:list id="lstAssetType" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>			                       
             <td style="width: 5%; white-space: nowrap" align="right">
                Asset/Serial
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtAsset" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdAsset')" />
            </td>           
             <td style="width: 20%" colspan=2 align="center" >
                <gw:label img="new" id="lblRecord" styles="color:#CC0000;" text="-" />
            </td>			   
            <td style="width: 8%">                 
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdAsset')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('grdAsset')" />
            </td>               
        </tr>
        <tr style="height: 99%">
            <td colspan="9">
                <gw:grid id='grdAsset' 
					header='Status|_Asset_Type_pk|Asset Type|_GRP_PK|Asset Group|_ASSET_PK|Asset Code|Asset Name|UOM|Last M/A|Next M/A|Round Days|MT CODE|AC CODE|Start Date|_DEPT_PK|Dept|_CHARGER_PK|Charger Name|Remark'
                    format='0|0|0|0|0|0|0|0|0|4|4|1|0|0|4|0|0|0|0|0' 
		    aligns='1|0|0|0|0|0|0|0|1|1|1|3|0|0|1|0|0|0|0|0'
                    check='|||||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0|0|0|0' 
					widths='1500|0|2000|0|2000|0|1500|3000|800|1200|1200|1200|1500|0|1500|1500|2000|0|2000|1000'
                    sorting='T' 
					defaults='||||||||||||||||||' 
					styles='width:100%; height:100%' 
					acceptnulldate="T"
                    oncelldblclick='OnGridCellDblClick(this)'/>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
 
</body>
</html>
