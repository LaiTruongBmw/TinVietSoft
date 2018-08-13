<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>Depr Summary 2</title>
</head>

<script>
   
var G1_ASSET_CODE = 0,
	G1_ASSET_NAME = 1,
	G1_MT_CODE    = 2,
	G1_AC_CODE    = 3,        
    G1_IN_AMT     = 4,
    G1_OUT_AMT    = 5,
    G1_BAL_AMT    = 6,
    G1_SD_01      = 7,
	G1_SD_02      = 8,
    G1_SD_03      = 9,
    G1_SD_04      = 10,
    G1_SD_05      = 11,
	G1_SD_06      = 12,
    G1_SD_07      = 13,
    G1_SD_08      = 14,
    G1_SD_09      = 15,
	G1_SD_10      = 16,
    G1_SD_11      = 17,
    G1_SD_12      = 18;	 	
	 
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
	var data = "<%=ESysLib.SetListDataSQL("select pk, asset_Type_code || ' * ' || asset_type_name from tlg_ma_asset_type where del_if = 0 order by asset_Type_code  ") %>||";
    lstAssetType.SetDataText(data);   
    lstAssetType.value=""; 
	 
    var ctrl = grdINOUT.GetGridControl();   
    
	ctrl.ColFormat(G1_IN_AMT)  = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_AMT) = "###,###,###.##" ;
	ctrl.ColFormat(G1_BAL_AMT) = "###,###,###.##" ;
    ctrl.ColFormat(G1_SD_01)   = "###,###,###.##" ;     
    ctrl.ColFormat(G1_SD_02)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_SD_03)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_SD_04)   = "###,###,###.##" ;	
    ctrl.ColFormat(G1_SD_05)   = "###,###,###.##" ;     
    ctrl.ColFormat(G1_SD_06)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_SD_07)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_SD_08)   = "###,###,###.##" ;
    ctrl.ColFormat(G1_SD_09)   = "###,###,###.##" ;    
    ctrl.ColFormat(G1_SD_10)   = "###,###,###.##" ; 
	ctrl.ColFormat(G1_SD_11)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_SD_12)   = "###,###,###.##" ;	
		 	  	
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'BALANCE':           
            //---------------------  			     
            data_fpma00300_1.Call('SELECT');			 
        break;  	
		
		case 'HEADER':
		    //--------------------------
			pro_fpma00300.Call();
		break;			 
    }
}
  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_fpma00300_1':            
            if ( grdINOUT.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();								 		
				
                fg.Cell(0, 0, G1_SD_01, 0, G1_SD_01 ) = txtSD01.text.substring(0,4) + ' - ' + txtSD01.text.substring(4,6) ;                
                fg.Cell(0, 0, G1_SD_02, 0, G1_SD_02 ) = txtSD02.text.substring(0,4) + ' - ' + txtSD02.text.substring(4,6) ;                 
                fg.Cell(0, 0, G1_SD_03, 0, G1_SD_03 ) = txtSD03.text.substring(0,4) + ' - ' + txtSD03.text.substring(4,6) ; 
				fg.Cell(0, 0, G1_SD_04, 0, G1_SD_04 ) = txtSD04.text.substring(0,4) + ' - ' + txtSD04.text.substring(4,6) ; 
				fg.Cell(0, 0, G1_SD_05, 0, G1_SD_05 ) = txtSD05.text.substring(0,4) + ' - ' + txtSD05.text.substring(4,6) ; 
				fg.Cell(0, 0, G1_SD_06, 0, G1_SD_06 ) = txtSD06.text.substring(0,4) + ' - ' + txtSD06.text.substring(4,6) ; 
				fg.Cell(0, 0, G1_SD_07, 0, G1_SD_07 ) = txtSD07.text.substring(0,4) + ' - ' + txtSD07.text.substring(4,6) ; 
				fg.Cell(0, 0, G1_SD_08, 0, G1_SD_08 ) = txtSD08.text.substring(0,4) + ' - ' + txtSD08.text.substring(4,6) ; 
				fg.Cell(0, 0, G1_SD_09, 0, G1_SD_09 ) = txtSD09.text.substring(0,4) + ' - ' + txtSD09.text.substring(4,6) ; 
				fg.Cell(0, 0, G1_SD_10, 0, G1_SD_10 ) = txtSD10.text.substring(0,4) + ' - ' + txtSD10.text.substring(4,6) ; 				 
				fg.Cell(0, 0, G1_SD_11, 0, G1_SD_11 ) = txtSD11.text.substring(0,4) + ' - ' + txtSD11.text.substring(4,6) ; 
				fg.Cell(0, 0, G1_SD_12, 0, G1_SD_12 ) = txtSD12.text.substring(0,4) + ' - ' + txtSD12.text.substring(4,6) ; 
							    
                grdINOUT.SetCellBold( 1, G1_ASSET_CODE, grdINOUT.rows-1, G1_ASSET_CODE, true);							                
                
                grdINOUT.SetCellBgColor( 1, G1_ASSET_CODE, grdINOUT.rows - 1, G1_ASSET_NAME, 0xCCFFFF );			
				grdINOUT.SetCellBgColor( 1, G1_IN_AMT,     grdINOUT.rows - 1, G1_BAL_AMT,    0xFFFFCC );	
				
				grdINOUT.SetCellBgColor( 1, G1_SD_02, grdINOUT.rows - 1, G1_SD_02, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 1, G1_SD_04, grdINOUT.rows - 1, G1_SD_04, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_SD_06, grdINOUT.rows - 1, G1_SD_06, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_SD_08, grdINOUT.rows - 1, G1_SD_08, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_SD_10, grdINOUT.rows - 1, G1_SD_10, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_SD_12, grdINOUT.rows - 1, G1_SD_12, 0xCCFFFF );
				
				grdINOUT.Subtotal( 0, 2, -1, '7!8!9!10!11!12!13!14!15!16!17!18','###,###,###.##');							
            }            
        break;    

		case 'pro_fpma00300': 
			 								
			OnSearch('BALANCE');			     
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
    <gw:data id="data_fpma00300_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpma00300_1"  >
                <input bind="grdINOUT" >					 
					<input bind="lstAssetType" />
					<input bind="txtAsset" />  
					<input bind="txtMTACCode" />
					<input bind="txtSD01" /> 
					<input bind="txtSD02" />
					<input bind="txtSD03" /> 
					<input bind="txtSD04" />
					<input bind="txtSD05" /> 
					<input bind="txtSD06" />
					<input bind="txtSD07" />
					<input bind="txtSD08" />
					<input bind="txtSD09" />
					<input bind="txtSD10" />
					<input bind="txtSD11" />																				      			        
					<input bind="txtSD12" />
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->  
    <gw:data id="pro_fpma00300" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpma00300" > 
                <input>
                    <inout bind="dtDate" />
                </input> 
                <output> 
                     <output bind="txtSD01" />
					 <output bind="txtSD02" />
					 <output bind="txtSD03" />
					 <output bind="txtSD04" />
					 <output bind="txtSD05" />
					 <output bind="txtSD06" />
					 <output bind="txtSD07" />
					 <output bind="txtSD08" />
					 <output bind="txtSD09" />
					 <output bind="txtSD10" />
					 <output bind="txtSD11" />
					 <output bind="txtSD12" />
                </output>
            </dso> 
        </xml> 
    </gw:data>     
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr>
            <td style="width: 5%; white-space: nowrap" align="right">
                Date
            </td>
            <td style="width: 10%; white-space: nowrap" align="left">
                <gw:datebox id="dtDate" lang="1" onchange="OnSearch('HEADER')" type="date" />
            </td>
            
			<td style="width: 5%; white-space: nowrap;" align="right">
                Asset Type
            </td>
            <td style="width: 30%" >
                <gw:list id="lstAssetType" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>			                       
            <td style="width: 5%; white-space: nowrap" align="right">
                Asset
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtAsset" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdAsset')" />
            </td>   
			<td style="width: 5%; white-space: nowrap" align="right">
                MT/AC
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtMTACCode" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdAsset')" />
            </td>         
            <td style="width: 8%">                 
            </td>             
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td>
        </tr>         
        <tr style="height: 98%">
            <td colspan="12">
                <gw:grid id='grdINOUT' header='Asset Code|Asset Name|M/T Code|A/C Code|In Amt|Out Amt|Bal Amt|01|02|03|04|05|06|07|08|09|10|11|12'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='2000|3000|1500|1500|1500|1500|1500|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>

<gw:textbox id="txtSD01" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSD02" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSD03" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSD04" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSD05" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSD06" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSD07" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSD08" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSD09" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSD10" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSD11" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSD12" maxlen="100" styles='width:100%;display:none' />
 
</html>
