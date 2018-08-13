<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>Depr Summary 4</title>
</head>

<script>

var G1_ASSET_CODE		= 0,
	G1_ACC_CODE			= 1,
	G1_ASSET_NAME		= 2,
	G1_F_NAME_01		= 3,
	G1_F_NAME_02		= 4,
	G1_MA_QTY			= 5,
	G1_IN_AMOUNT		= 6,
	G1_DOC_NO			= 7,
	G1_START_DATE		= 8,
	G1_PLAN_MONTH_COUNT	= 9,
	G1_DEPR_MONTHLY_AMT = 10,
	G1_DEPR_MONTH_COUNT	= 11,
	G1_OUT_AMOUNT		= 12,
	G1_DEPR_THIS_MONTH	= 13,
	G1_BAL_AMOUNT		= 14;
	 
//=============================================================================             
function BodyInit()
{       
    System.Translate(document); 
	 
    FormatGrid();         
    //-----------------     
	
	OnSearch('HEADER');
}
//=============================================================================           
function FormatGrid()
{
    var ctrl = grdAsset.GetGridControl();   
     
    ctrl.ColFormat(G1_MA_QTY) 	 		= "###,###,###" ;     
    ctrl.ColFormat(G1_IN_AMOUNT) 		= "###,###,###.##" ;
	ctrl.ColFormat(G1_PLAN_MONTH_COUNT) = "###,###,###" ;
	ctrl.ColFormat(G1_DEPR_MONTHLY_AMT) = "###,###,###.##" ;
	ctrl.ColFormat(G1_DEPR_MONTH_COUNT) = "###,###,###" ;	
    ctrl.ColFormat(G1_OUT_AMOUNT)       = "###,###,###.##" ;     
    ctrl.ColFormat(G1_DEPR_THIS_MONTH)  = "###,###,###.##" ;
	ctrl.ColFormat(G1_BAL_AMOUNT)       = "###,###,###.##" ;

	var data = "<%=ESysLib.SetListDataSQL("select pk, asset_Type_code || ' * ' || asset_type_name from tlg_ma_asset_type where del_if = 0 order by asset_Type_code  ") %>||";
    lstAssetType.SetDataText(data);   
    lstAssetType.value=""; 		

	data = "<%=ESysLib.SetListDataSQL("select pk, grp_code || ' * '| | grp_name from tlg_ma_asset_group a where  del_if=0 order by grp_code")%>||";       
    lstAssetGroup.SetDataText(data);	
	lstAssetGroup.value = "" ;	
	 
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'grdAsset':           
            //---------------------  			     
            data_fpma00360.Call('SELECT');			 
        break;  			 			
    }
}
  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_fpma00360':            
            if ( grdAsset.rows > 1 )
            {				 
                grdAsset.SetCellBold( 1, G1_ASSET_CODE, grdAsset.rows-1, G1_ASSET_CODE, true);							                               
                grdAsset.SetCellBgColor( 1, G1_DEPR_THIS_MONTH, grdAsset.rows - 1, G1_DEPR_THIS_MONTH, 0xCCFFFF );			
				
				grdAsset.Subtotal( 0, 2, -1, '6!12!13!14','###,###,###.##');							
            }            
        break;      				  		           
    }
}
//============================================================================= 

function OnPopUp(pos)
{
	switch(pos)
	{
		case 'Report':			 
			 
		    var path = System.RootURL + '/form/fp/ma/fpma00361.aspx';
		    var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        	         
		break;     
	}
}

//============================================================================= 
function OnReport(pos)
{    
	switch(pos)
	{
		case '1' :
			var url = System.RootURL + "/reports/fp/ma/rpt_fpma00361.aspx?p_month=" + dtMonth.value + "&p_asset_type_pk=" + lstAssetType.value + "&p_asset_group_pk=" + lstAssetGroup.value + "&p_asset=" + txtAssetItem.text + "&p_all_yn=" + chkALL.value ;
			System.OpenTargetPage(url); 		
		break;
		
		case '2' :
			var url = System.RootURL + "/reports/fp/ma/rpt_fpma00362.aspx";
			System.OpenTargetPage(url); 		
		break;
	}	
} 

//=============================================================================              
         
</script>

<body>        
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpma00360" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpma00360"  >
                <input bind="grdAsset" >
					<input bind="dtMonth" />	
					<input bind="lstAssetType" />	
					<input bind="lstAssetGroup" />
					<input bind="txtAssetItem" />
					<input bind="chkALL" />
                </input>
                <output bind="grdAsset" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr>
            <td style="width: 5%; white-space: nowrap" align="right">
                Month
            </td>
            <td style="width: 10%; white-space: nowrap" align="left">
                <gw:datebox id="dtMonth" lang="1" onchange="OnSearch('HEADER')" type="month" />
            </td>
            <td style="width: 5%; white-space: nowrap;" align="right">
                Asset Type
            </td>
            <td style="width: 25%" >
                <gw:list id="lstAssetType" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>
			<td style="width: 5%; white-space: nowrap;" align="right">
                Asset Group
            </td>
            <td style="width: 25%" >
                <gw:list id="lstAssetGroup" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>			
            
			<td style="width: 5%; white-space: nowrap" align="right">
                Asset
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtAssetItem" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdAsset')" />
            </td>  
			<td style="width: 3%; white-space: nowrap" align="right">
				<gw:checkbox id="chkALL" styles="color:red" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdAsset')">ALL</gw:checkbox>
            </td>			            
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnPopUp('Report')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdAsset')" />
            </td>
        </tr>         
        <tr style="height: 98%">
            <td colspan="15">
				<gw:grid id='grdAsset'
					header='Asset Code|ACC Code|Asset Name|Name 1|Name 2|Asset Qty|In Amount|Doc No|Start Date|Month Life|Depr Monthly|Depr Month|Depr Amount|This Month|Bal Amount'
					format='0|0|0|0|0|0|0|0|4|0|0|0|0|0|0'
					aligns='1|1|0|0|0|3|3|0|1|1|3|1|3|3|3'			 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
					widths='1500|1500|2500|1500|1500|1200|1500|1500|1200|1200|1500|1200|1500|1500|1500'
					sorting='T' 
					acceptnulldate="T"
					styles='width:100%; height:100%' />

            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
 
</html>