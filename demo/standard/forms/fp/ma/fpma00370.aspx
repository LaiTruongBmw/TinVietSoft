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
	G1_START_DATE		= 6,
	G1_BEGIN_AMT		= 7,
	G1_INCREASE_AMT		= 8,
	G1_DECREASE_AMT 	= 9,
	G1_END_AMT			= 10,
	G1_PERIOD_DEPR		= 11,
	G1_ACCUM_DEPR		= 12,
	G1_REMAIN_AMT		= 13;
	 
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
     
    ctrl.ColFormat(G1_MA_QTY) 	 	= "###,###,###" ;     
    ctrl.ColFormat(G1_BEGIN_AMT) 	= "###,###,###.##" ;
	ctrl.ColFormat(G1_INCREASE_AMT) = "###,###,###.##" ;
	ctrl.ColFormat(G1_DECREASE_AMT) = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_AMT) 		= "###,###,###.##" ;	
    ctrl.ColFormat(G1_PERIOD_DEPR)  = "###,###,###.##" ;     
    ctrl.ColFormat(G1_ACCUM_DEPR)  	= "###,###,###.##" ;
	ctrl.ColFormat(G1_REMAIN_AMT)   = "###,###,###.##" ;

	var data = "<%=ESysLib.SetListDataSQL("select pk, asset_Type_code || ' * ' || asset_type_name from tlg_ma_asset_type where del_if = 0 order by asset_Type_code  ") %>||";
    lstAssetType.SetDataText(data);   
    lstAssetType.value=""; 		
	 
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'grdAsset':           
            //---------------------  			     
            data_fpma00370.Call('SELECT');			 
        break;  

		case 'HEADER':
			pro_fpma00370.Call();
		break;
    }
}
 
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_fpma00370':            
            if ( grdAsset.rows > 1 )
            {				 
                grdAsset.SetCellBold( 1, G1_ASSET_CODE, grdAsset.rows-1, G1_ASSET_CODE, true);	
				
                grdAsset.SetCellBgColor( 1, G1_PERIOD_DEPR, grdAsset.rows - 1, G1_REMAIN_AMT, 0xCCFFFF );			
				
				grdAsset.Subtotal( 0, 2, -1, '5!7!8!9!10!11!12!13','###,###,###.##');							
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
			 
		    var path = System.RootURL + '/form/fp/ma/fpma00371.aspx';
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
			var url = System.RootURL + "/reports/fp/ma/rpt_fpma00371.aspx?p_asset_type_pk=" + lstAssetType.value + "&p_asset=" + txtAssetItem.text + "&p_account=" + txtAccount.text + "&p_begin_date=" + dtFrom.value + "&p_end_date=" + dtTo.value;
			System.OpenTargetPage(url); 		
		break;
	}	

} 
//=============================================================================                       
</script>

<body>    
	<!-------------------------------------------------------------------------->
    <gw:data id="pro_fpma00370" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpma00370" > 
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
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpma00370" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpma00370"  >
                <input bind="grdAsset" >
					<input bind="dtFrom" />	
					<input bind="dtTo" />
					<input bind="lstAssetType" />				 
					<input bind="txtAssetItem" />
					<input bind="txtAccount" />
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
			<td style="width: 20%; white-space: nowrap" align="left" >
				<gw:datebox id="dtFrom" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />                                              
				~
			    <gw:datebox id="dtTo" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />
            </td>
            <td style="width: 5%; white-space: nowrap;" align="right">
                Asset
            </td>
            <td style="width: 25%" >
                <gw:list id="lstAssetType" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>						
            <td style="width: 15%">
                <gw:textbox id="txtAssetItem" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdAsset')" />
            </td>  			
			<td style="width: 5%; white-space: nowrap;" align="right">   
				Account
            </td> 
			<td style="width: 10%; white-space: nowrap;" align="right">   
				<gw:textbox id="txtAccount" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdAsset')" />
            </td> 			
			<td style="width: 3%; white-space: nowrap" align="right">
            </td>			            
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnPopUp('Report')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdAsset')" />
            </td>
        </tr>         
        <tr style="height: 98%">
            <td colspan="16">				 
				<gw:grid id='grdAsset'
					header='Ass Code|Account|Ass Name|Name 1|Name 2|Qty|Start Date|Begin Amt|Increase Amt|Decrease Amt|End Amt|Period Depr|Accum Depr|Remain Amt'
					format='0|0|0|0|0|0|4|0|0|0|0|0|0|0'
					aligns='0|1|0|0|0|3|1|3|3|3|3|3|3|3'
					check='|||||||||||||'
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
					widths='1500|1000|3500|2000|2000|1000|1200|1500|1500|1500|1500|1500|1500|1500'
					sorting='T'
					acceptnulldate="T" 
					styles='width:100%; height:100%'
					/>					
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
 
</html>
