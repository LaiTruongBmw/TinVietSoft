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
   
var G1_ASSET_TYPE_CD	= 0,
	G1_ASSET_TYPE_NM 	= 1,
	G1_ASS_ACC_CD    	= 2,
	G1_ASS_ACC_NM   	= 3,        
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
		 	  	
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'BALANCE':           
            //---------------------  			     
            data_fpma00250_1.Call('SELECT');			 
        break;  	
		
		case 'HEADER':
		    //--------------------------
			data_fpma00250.Call('SELECT');
		break;			 
    }
}
  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_fpma00250_1':            
            if ( grdINOUT.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();
				
				fg.FixedRows  = 2 ;
            	fg.MergeCells = 5 ;
				grdINOUT.SetCellBold( 1, 1, 1, G1_END_04, true);
				
				fg.MergeCol(G1_ASSET_TYPE_CD)  = true;
				fg.MergeCol(G1_ASSET_TYPE_NM)  = true;
				fg.MergeCol(G1_ASS_ACC_CD)     = true;
				fg.MergeCol(G1_ASS_ACC_NM)     = true;
				                			
				fg.MergeRow(0) = true;
				 
				fg.Cell(0, 0, G1_ASSET_TYPE_CD, 0, G1_ASSET_TYPE_NM ) = "Asset Type"; 
				fg.Cell(0, 1, G1_ASSET_TYPE_CD, 1, G1_ASSET_TYPE_CD ) = "Code";
				fg.Cell(0, 1, G1_ASSET_TYPE_NM, 1, G1_ASSET_TYPE_NM ) = "Name";			
                fg.Cell(0, 0, G1_ASS_ACC_CD, 0, G1_ASS_ACC_NM ) = "Asset Acc";
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
							    
                grdINOUT.SetCellBold( 1, G1_ASSET_TYPE_CD, grdINOUT.rows-1, G1_ASSET_TYPE_CD, true);							                
                
                grdINOUT.SetCellBgColor( 2, G1_BEGIN_01, grdINOUT.rows - 1, G1_END_01, 0xCCFFFF );			
				grdINOUT.SetCellBgColor( 2, G1_BEGIN_03, grdINOUT.rows - 1, G1_END_03, 0xCCFFFF );	
				
				grdINOUT.Subtotal( 0, 2, -1, '4!5!6!7!8!9!10!11!12!13!14!15!16!17!18!19','###,###,###.##');							
            }            
        break;    

		case 'data_fpma00250': 
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
function OnReport()
{    
     var url = System.RootURL + "/reports/bi/sc/rpt_fpma00250.aspx?p_lang="+lstLang1.value+'&p_wh_type='+lstWHType01.value+'&p_wh='+lstWH01.value+'&p_item_group='+lstItemGroup01.value;
     url = url + '&p_item='+txtItem01.text+'&p_begin_01='+txtBegin_01.text+'&p_end_01='+txtEnd_01.text+'&p_begin_02='+txtBegin_02.text+'&p_end_02='+txtEnd_02.text ;
     url = url + '&p_begin_03='+txtBegin_03.text+'&p_end_03='+txtEnd_03.text+'&p_begin_04='+txtBegin_04.text+'&p_end_04='+txtEnd_04.text+'&p_rad_type='+radType.value+'&p_month='+dtMonth01.value;
     System.OpenTargetPage(url); 
} 
//=============================================================================                       
</script>

<body>    
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpma00250_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpma00250_1"  >
                <input bind="grdINOUT" >					 
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
    <gw:data id="data_fpma00250" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpma00250"  >
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
            <td style="width: 20%; white-space: nowrap" align="left">
                <gw:datebox id="dtMonth01" lang="1" onchange="OnSearch('HEADER')" type="month" />
            </td>
            <td style="width: 20%; white-space: nowrap" align="center">
                <gw:radio id="radType" value="M" styles="width:100%" onchange="OnSearch('HEADER')"> 
				     <span value="M" id="Span01">Month</span> 
				     <span value="Q" id="Spqn02">Quater</span> 									      
				 </gw:radio>
            </td>            
            <td style="width: 53%">                 
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
                <gw:grid id='grdINOUT' header='Asset Type CD|Asset Type Name|Asset CD|Asset Name|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16'
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
