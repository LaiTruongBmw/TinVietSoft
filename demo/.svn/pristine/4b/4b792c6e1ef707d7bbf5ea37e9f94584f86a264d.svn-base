<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get One Asset Info</title>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
</head>

<script type="text/javascript">

var G_ASSET_PK	    = 0,
    G_ASSET_TYPE	= 1,
	G_ASSET_GROUP	= 2,
    G_ASSET_CODE	= 3,
    G_ASSET_NAME	= 4,
    G_UOM		    = 5,
	G_QTY			= 6,
	G_AMOUNT		= 7,
    G_DEPT_PK		= 8,     
    G_DEPT_NAME		= 9,
	G_CHARGER_PK	= 10, 
    G_CHARGER_NAME	= 11,         
    G_REMARK		= 12;
    
//=================================================================================================
function BodyInit()
{
	 System.Translate(document);
	 //-------------------------	 	
     var data = "";      
     
     data = "<%=ESysLib.SetListDataSQL("select pk, asset_type_code || ' * ' || asset_type_name from tlg_ma_asset_type a where  del_if=0 order by asset_type_code")%>";       
     lstAssetType.SetDataText(data+"||");
     lstAssetType.value=''; 
	 
	 data = "<%=ESysLib.SetListDataSQL("select pk, grp_code || ' * '| | grp_name from tlg_ma_asset_group a where  del_if=0 order by grp_code")%>";       
     lstAssetGroup.SetDataText(data+"||");
     lstAssetGroup.value='';
     //-------------------------   
     data = "<%=ESysLib.SetListDataSQL("select pk, DEPT_ID || ' * ' || DEPT_NAME from tlg_PO_DEPT a where  del_if=0 order by DEPT_ID")%>";       
     lstCurrDept.SetDataText(data+"||");
     lstCurrDept.value="";
      	
 	 lstCurrDept.value = "<%=Request.querystring("CurrDeptPK")%>";
	 //---------------------------------------	
	 var ctrl = idGrid.GetGridControl(); 
	 
	 ctrl.ColFormat(G_QTY)    = "#,###,###,###,###,###";
	 ctrl.ColFormat(G_AMOUNT) = "#,###,###,###,###,###";
	 //---------------------------------------	
}

//=================================================================================================
function OnSearch(obj)
{ 
    switch (obj)
    {
        case 'DETAIL' :
                 data_fpma00111.Call("SELECT");
        break;
    }
   
}
//=================================================================================================

function OnSelect(oGrid)
{
    var arr_data = new Array();
	
    for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
      
        var arrTemp=new Array();		
	    
	     for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[j]= oGrid.GetGridData(row,j);            
         }
         
         arr_data[arr_data.length]= arrTemp;
	}
        
	window.returnValue =  arr_data;
	window.close();
}
 
//=================================================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_fpma00111':
			if ( idGrid.rows > 1 )
			{
             	idGrid.SetCellBold( 1, G_ASSET_CODE, idGrid.rows - 1, G_ASSET_CODE, true); 
			} 
        break;
    }
}
 
//=================================================================================================

</script>

<body>
    <!-----------------------------DS LAY DANH SACH TAI SAN----------------------------------->
    <gw:data id="data_fpma00111" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00111" > 
                  <input bind="idGrid" >
                    <input bind="lstAssetType" />
					<input bind="lstAssetGroup" />
                    <input bind="txtItem" />
					<input bind="lstCurrDept" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">      
        <tr style="height: 1%">
            <td style="width: 5%">
               Dept
            </td>
            <td style="width: 25%;">
                <gw:list id="lstCurrDept" styles="width:100%;" onchange="OnSearch('DETAIL')" />
            </td>
            <td style="width: 5%">
                Type
            </td>
            <td style="width: 20%;">
                <gw:list id="lstAssetType" styles="width:100%;" onchange="OnSearch('DETAIL')" />
            </td>
			<td style="width: 5%">
                Group
            </td>
            <td style="width: 20%;">
                <gw:list id="lstAssetGroup" styles="width:100%;" onchange="OnSearch('DETAIL')" />
            </td>
            <td style="width: 5%" align="right">
                Asset
            </td>
            <td style="width: 13%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('DETAIL')" />
            </td>             
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('DETAIL')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid)" />
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="10">
                <gw:grid id='idGrid' header='_PK|Asset Type|Asset Group|Asset Code|Asset Name|UOM|Qty|Amount|_DEPT_PK|Curr Dept|_CHARGER_PK|Charger Name|Remark'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|1|3|3|0|0|0|0|0'
                    check='||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|1500|1500|2000|3500|800|1000|1200|0|2000|0|2000|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnSelect(this)' />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->  
</body>
</html>
