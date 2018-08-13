<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>Depr Closing Detail</title>
</head>

<script>
   
var G1_ASSET_PK   = 0,
	G1_ASSET_CODE = 1,
	G1_ASSET_NAME = 2,
	G1_BEGIN_AMT  = 3,  
    G1_IN_AMT     = 4,
    G1_OUT_AMT    = 5,
    G1_END_AMT    = 6,
    G1_EXP_ACC    = 7,
	G1_ASS_ACC    = 8,
    G1_DEPR_ACC   = 9;	 	
	 
//=============================================================================             
function BodyInit()
{       
    System.Translate(document); 
	
	FormatGrid();
	
	txtMasterPK.text   = "<%=Request.querystring("master_pk")%>";
	lstAssetType.value = "<%=Request.querystring("asset_type_pk")%>";
	              
    //-----------------  
	OnSearch('BALANCE');
	   
}
//=============================================================================           
function FormatGrid()
{
    var ctrl = grdINOUT.GetGridControl();   
	
    ctrl.ColFormat(G1_BEGIN_AMT) = "###,###,###.##" ;
	ctrl.ColFormat(G1_IN_AMT)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_AMT)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_AMT)   = "###,###,###.##" ; 
	
	var     data = "<%=ESysLib.SetListDataSQL("select pk, asset_Type_code || ' * ' || asset_type_name from tlg_ma_asset_type where del_if = 0 order by asset_Type_code  ") %>||";
    lstAssetType.SetDataText(data);   
    lstAssetType.value=""; 
    		 	  	
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'BALANCE':           
            //---------------------  			     
            data_fpma00231.Call('SELECT');			 
        break;  			 		 
    }
}
  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_fpma00231':            
            if ( grdINOUT.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();								 		
				 
                grdINOUT.SetCellBold( 1, G1_ASSET_CODE, grdINOUT.rows-1, G1_ASSET_CODE, true);							                
				
				grdINOUT.SetCellBgColor( 1, G1_BEGIN_AMT, grdINOUT.rows - 1, G1_IN_AMT,  0xCCFFFF );	
				grdINOUT.SetCellBgColor( 1, G1_OUT_AMT,   grdINOUT.rows - 1, G1_END_AMT, 0xFFFFCC );
				
				grdINOUT.Subtotal( 0, 2, -1, '3!4!5!6','###,###,###.##');							
            }            
        break;       				  		           
    }
}

//============================================================================= 
function OnReport()
{    
     var url = System.RootURL + "/reports/bi/sc/rpt_fpma00250.aspx?p_lang="+lstLang1.value+'&p_wh_type='+lstWHType01.value+'&p_wh='+lstWH01.value+'&p_item_group='+lstItemGroup01.value;
     url = url + '&p_item='+txtItem01.text+'&p_begin_01='+txtBegin_01.text+'&p_end_01='+txtEnd_01.text+'&p_begin_02='+txtBegin_02.text+'&p_end_02='+txtEnd_02.text ;
     url = url + '&p_begin_03='+txtBegin_03.text+'&p_end_03='+txtEnd_03.text+'&p_begin_04='+txtBegin_04.text+'&p_end_04='+txtEnd_04.text+'&p_rad_type='+radType.value+'&p_month='+dtMonth01.value;
     //System.OpenTargetPage(url); 
} 
//=============================================================================                       
</script>

<body>    
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpma00231" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpma00231"  >
                <input bind="grdINOUT" >
					<input bind="txtMasterPK" />					 
					<input bind="lstAssetType" />
					<input bind="txtAsset" />  					 				 
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>       
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr>             
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
            <td style="width: 29%">                 
            </td>                         
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td>
        </tr>         
        <tr style="height: 98%">
            <td colspan="12">
                <gw:grid id='grdINOUT' 
					header='_ASSET_PK|Asset Code|Asset Name|Begin Amt|In Amt|Out Amt|End Amt|Exp Acc|Asset Acc|Depr Acc'
                    format='0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|3|3|3|3|0|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0' 
					widths='0|2000|3000|1500|1500|1500|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>

<gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' /> 
 
</html>
