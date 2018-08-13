<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>Depr Summary 1</title>
</head>

<script>
   
var G1_ASS_ACC_CD    	= 0,
	G1_ASS_ACC_NM   	= 1, 
	G1_ASSET_CODE		= 2,
	G1_ASSET_NAME 		= 3,	      
    G1_BEGIN_01   		= 4,
    G1_IN_01      		= 5,
    G1_OUT_01     		= 6,
    G1_END_01     		= 7,
	G1_BEGIN_02   		= 8,
    G1_IN_02      		= 9,
    G1_OUT_02     		= 10,
    G1_END_02     		= 11,
	G1_BEGIN_03   		= 12,
    G1_IN_03      		= 13,
    G1_OUT_03     		= 14,
    G1_END_03     		= 15,
	G1_BEGIN_04   		= 16,
    G1_IN_04      		= 17,
    G1_OUT_04     		= 18,
    G1_END_04     		= 19;
	
var G2_BEGIN_01 = 0,
	G2_END_01   = 1,
	G2_BEGIN_02 = 2,
	G2_END_02   = 3,
	G2_BEGIN_03 = 4,
	G2_END_03   = 5,
	G2_BEGIN_04 = 6,
	G2_END_04   = 7,
	G2_HEADER_01= 8,
	G2_HEADER_02= 9,		
	G2_HEADER_03= 10,	
	G2_HEADER_04= 11;		
	 
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
	
	data = "data|10|Grand|20|by Account";
    lstGridType.SetDataText(data);  
    lstGridType.value = '10'; 
	
	//---------------------------
    var ctrl = grdINOUT.GetGridControl();   
     
    ctrl.ColFormat(G1_BEGIN_01) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_01)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_01)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_01)   = "###,###,###.##" ;	
    ctrl.ColFormat(G1_BEGIN_02) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_02)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_02)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_02)   = "###,###,###.##" ;
    ctrl.ColFormat(G1_BEGIN_03) = "###,###,###.##" ;    
    ctrl.ColFormat(G1_IN_03)    = "###,###,###.##" ; 
	ctrl.ColFormat(G1_OUT_03)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_03)   = "###,###,###.##" ;
    ctrl.ColFormat(G1_BEGIN_04) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_04)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_04)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_04)   = "###,###,###.##" ;

	ctrl.FrozenCols = G1_BEGIN_01 ;
		 	  	
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'BALANCE':           
            //---------------------  	
 		
            data_fpma00310_1.Call('SELECT');			 
        break;  	
		
		case 'HEADER':
		    //--------------------------
			data_fpma00310.Call('SELECT');
		break;			 
    }
}
  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_fpma00310_1':    
       
            if ( grdINOUT.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();
				
				fg.FixedRows  = 2 ;
            	fg.MergeCells = 5 ;
				grdINOUT.SetCellBold( 1, 0, 1, G1_END_04, true);
				
				fg.MergeCol(G1_ASSET_CODE)  = true;
				fg.MergeCol(G1_ASSET_NAME)  = true;
				fg.MergeCol(G1_ASS_ACC_CD)     = true;
				fg.MergeCol(G1_ASS_ACC_NM)     = true;
				                			
				fg.MergeRow(0) = true;
				 
				fg.Cell(0, 0, G1_ASSET_CODE, 0, G1_ASSET_NAME ) = "Asset"; 
				fg.Cell(0, 1, G1_ASSET_CODE, 1, G1_ASSET_CODE ) = "Code";
				fg.Cell(0, 1, G1_ASSET_NAME, 1, G1_ASSET_NAME ) = "Name";			
                fg.Cell(0, 0, G1_ASS_ACC_CD, 0, G1_ASS_ACC_NM ) = "Asset Account";
				fg.Cell(0, 1, G1_ASS_ACC_CD, 1, G1_ASS_ACC_CD ) = "Code";
				fg.Cell(0, 1, G1_ASS_ACC_NM, 1, G1_ASS_ACC_NM ) = "Name";
				
				fg.Cell(0, 0, G1_BEGIN_01, 0, G1_END_01 ) = grdHeader.GetGridData( 1, G2_HEADER_01 );
				fg.Cell(0, 0, G1_BEGIN_02, 0, G1_END_02 ) = grdHeader.GetGridData( 1, G2_HEADER_02 );
				fg.Cell(0, 0, G1_BEGIN_03, 0, G1_END_03 ) = grdHeader.GetGridData( 1, G2_HEADER_03 );
				fg.Cell(0, 0, G1_BEGIN_04, 0, G1_END_04 ) = grdHeader.GetGridData( 1, G2_HEADER_04 );
                fg.Cell(0, 1, G1_BEGIN_01, 1 ) = "Begin" ;
                fg.Cell(0, 1, G1_IN_01,    1 ) = "In" ;
                fg.Cell(0, 1, G1_OUT_01,   1 ) = "Out" ;
				fg.Cell(0, 1, G1_END_01,   1 ) = "End" ;
                fg.Cell(0, 1, G1_BEGIN_02, 1 ) = "Begin" ;
                fg.Cell(0, 1, G1_IN_02,    1 ) = "In" ;
                fg.Cell(0, 1, G1_OUT_02,   1 ) = "Out" ;
				fg.Cell(0, 1, G1_END_02,   1 ) = "End" ;				
                fg.Cell(0, 1, G1_BEGIN_03, 1 ) = "Begin" ;
                fg.Cell(0, 1, G1_IN_03,    1 ) = "In" ;
                fg.Cell(0, 1, G1_OUT_03,   1 ) = "Out" ;
				fg.Cell(0, 1, G1_END_03,   1 ) = "End" ;				
                fg.Cell(0, 1, G1_BEGIN_04, 1 ) = "Begin" ;
                fg.Cell(0, 1, G1_IN_04,    1 ) = "In" ;
                fg.Cell(0, 1, G1_OUT_04,   1 ) = "Out" ;
				fg.Cell(0, 1, G1_END_04,   1 ) = "End" ;
				
				if ( grdINOUT.rows > 2 )
				{		 	    
					grdINOUT.SetCellBold( 2, G1_ASSET_CODE, grdINOUT.rows-1, G1_ASSET_CODE, true);							                
					 
					grdINOUT.SetCellBgColor( 2, G1_BEGIN_01, grdINOUT.rows - 1, G1_END_01, 0xCCFFFF );			
					grdINOUT.SetCellBgColor( 2, G1_BEGIN_03, grdINOUT.rows - 1, G1_END_03, 0xCCFFFF );	
					 
					if ( lstGridType.value == '10' )
					{
						grdINOUT.Subtotal( 0, 2, -1, '4!5!6!7!8!9!10!11!12!13!14!15!16!17!18!19','###,###,###.##');							
					}
					else
					{
						grdINOUT.Subtotal( 0, 2, 0, '4!5!6!7!8!9!10!11!12!13!14!15!16!17!18!19','###,###,###.##');
					}
				}		
            }            
        break;    

		case 'data_fpma00310': 
			if ( grdHeader.rows > 1 )
			{
				txtBegin_01.text = grdHeader.GetGridData( 1, G2_BEGIN_01 );
				txtEnd_01.text   = grdHeader.GetGridData( 1, G2_END_01   );
				txtBegin_02.text = grdHeader.GetGridData( 1, G2_BEGIN_02 );
				txtEnd_02.text   = grdHeader.GetGridData( 1, G2_END_02   );
				txtBegin_03.text = grdHeader.GetGridData( 1, G2_BEGIN_03 );
				txtEnd_03.text   = grdHeader.GetGridData( 1, G2_END_03   );
				txtBegin_04.text = grdHeader.GetGridData( 1, G2_BEGIN_04 );
				txtEnd_04.text   = grdHeader.GetGridData( 1, G2_END_04   );								
				 
				OnSearch('BALANCE');
			}
			else
			{
				alert('Pls check search date .');
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
			 
		    var path = System.RootURL + '/form/fp/ma/fpma00311.aspx';
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
			var url = System.RootURL + "/reports/fp/ma/rpt_fpma00311.aspx?p_asset_type_pk=" + lstAssetType.value + "&p_asset=" + txtAssetItem.text + "&p_account=" + txtAccount.text + "&p_begin_date=" + txtBegin_01.value + "&p_end_date=" + txtEnd_04.value;
			System.OpenTargetPage(url); 		
		break;
		
		case '2' :
			var url = System.RootURL + "/reports/fp/ma/rpt_fpma00312.aspx";
			System.OpenTargetPage(url); 		
		break;
	}	
} 

//============================================================================= 
function OnChangeCheck()
{
	if ( chkInOut.value == 'Y' )
	{
		grdINOUT.GetGridControl().ColHidden(G1_BEGIN_01) = true ;
		grdINOUT.GetGridControl().ColHidden(G1_END_01) 	 = true ;
		grdINOUT.GetGridControl().ColHidden(G1_BEGIN_02) = true ;
		grdINOUT.GetGridControl().ColHidden(G1_END_02)   = true ;
		grdINOUT.GetGridControl().ColHidden(G1_BEGIN_03) = true ;
		grdINOUT.GetGridControl().ColHidden(G1_END_03)   = true ;
		grdINOUT.GetGridControl().ColHidden(G1_BEGIN_04) = true ;
		grdINOUT.GetGridControl().ColHidden(G1_END_04)   = true ;
	}
	else
	{
		grdINOUT.GetGridControl().ColHidden(G1_BEGIN_01) = false ;
		grdINOUT.GetGridControl().ColHidden(G1_END_01) 	 = false ;
		grdINOUT.GetGridControl().ColHidden(G1_BEGIN_02) = false ;
		grdINOUT.GetGridControl().ColHidden(G1_END_02)   = false ;
		grdINOUT.GetGridControl().ColHidden(G1_BEGIN_03) = false ;
		grdINOUT.GetGridControl().ColHidden(G1_END_03)   = false ;
		grdINOUT.GetGridControl().ColHidden(G1_BEGIN_04) = false ;
		grdINOUT.GetGridControl().ColHidden(G1_END_04)   = false ;	
	}	
}

//=============================================================================    
                   
</script>

<body>    
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpma00310_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpma00310_1"  >
                <input bind="grdINOUT" >	
					<input bind="lstAssetType" />
					<input bind="txtAsset" /> 
					<input bind="txtAccount" />
					<input bind="chkInOut" />
					<input bind="txtBegin_01" />
					<input bind="txtEnd_01" />  
					<input bind="txtBegin_02" />
					<input bind="txtEnd_02" /> 
					<input bind="txtBegin_03" />
					<input bind="txtEnd_03" /> 
					<input bind="txtBegin_04" />
					<input bind="txtEnd_04" /> 															      			        
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpma00310" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpma00310"  >
                <input bind="grdHeader" >
					<input bind="dtMonth01" />	
					<input bind="radType" />									 													      			        
                </input>
                <output bind="grdHeader" />
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
                <gw:datebox id="dtMonth01" lang="1" onchange="OnSearch('HEADER')" type="month" />
            </td>
            <td style="width: 15%; white-space: nowrap" align="center">
                <gw:radio id="radType" value="M" styles="width:100%" onchange="OnSearch('HEADER')"> 
				     <span value="M" id="Span01">Month</span> 
				     <span value="Q" id="Spqn02">Quater</span> 									      
				 </gw:radio>
            </td> 
			<td style="width: 5%; white-space: nowrap;" align="right">
                Asset Type
            </td>
            <td style="width: 20%" >
                <gw:list id="lstAssetType" styles="width:100%;" onchange="OnSearch('grdAsset')" />
            </td>			                       
            <td style="width: 5%; white-space: nowrap" align="right">
                Asset
            </td>	
			<td style="width: 10%">
                <gw:textbox id="txtAsset" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdAsset')" />
            </td> 
			<td style="width: 5%; white-space: nowrap" align="right">
                Account
            </td>	
			<td style="width: 10%">
                <gw:textbox id="txtAccount" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdAsset')" />
            </td> 			
            <td style="width: 5%"> 
				<gw:list id="lstGridType" styles='width:80' />
            </td>
			<td style="width: 8%; white-space: nowrap" align="center">
				<gw:checkbox id="chkInOut" styles="color:red" defaultvalue="Y|N" value="N" onchange="OnChangeCheck()">In/Out</gw:checkbox>
            </td>			
            <td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnPopUp('Report')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td>
        </tr>         
        <tr style="height: 98%">
            <td colspan="15">
                <gw:grid id='grdINOUT' header='Asset CD|Asset Name|Asset Code|Asset Name|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1200|2500|1200|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
<gw:textbox id="txtBegin_01" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtEnd_01" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtBegin_02" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtEnd_02" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtBegin_03" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtEnd_03" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtBegin_04" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtEnd_04" maxlen="100" styles='width:100%;display:none' />
<gw:grid id='grdHeader' header='L_BEGIN_DAY_01|L_END_DAY_01|L_BEGIN_DAY_02|L_END_DAY_02|L_BEGIN_DAY_03|L_END_DAY_03|L_BEGIN_DAY_04|L_END_DAY_04|DAY01|DAY02|DAY03|DAY04'
    format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    styles='width:100%; height:460;display:none' />
</html>
