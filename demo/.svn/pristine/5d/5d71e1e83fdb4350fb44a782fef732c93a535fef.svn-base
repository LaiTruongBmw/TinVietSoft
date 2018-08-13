<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head1" runat="server">
    <title>Line Stock Checking</title>
</head>

<script> 

var G1_OrdPlan_PK	= 0,
    G1_Style_Code   = 1,
	G1_Style_PK		= 3,
    G1_PO_No        = 4;

var G2_             = 0,
	G2_COMP_PK      = 1,
    G2_COMP_ID      = 2,
    G2_COMP_NAME    = 3,
    G2_SPEC01_PK    = 4,
    G2_SPEC01_ID    = 5,
    G2_SPEC02_PK    = 6,
    G2_SPEC02_ID    = 7,
    G2_SPEC03_PK    = 8,
    G2_SPEC03_ID    = 9,
    G2_SPEC04_PK    = 10,
    G2_SPEC04_ID    = 11, 
    G2_SPEC05_PK    = 12,
    G2_SPEC05_ID    = 13,
    G2_PLAN_QTY     = 14,
    G2_REQ_QTY      = 15,
    G2_QC_QTY       = 16,
    G2_DEF_QTY      = 17,
	G2_BAL_QTY		= 18;
//===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgClose");  
        
    if  ( imgArrow.status == "collapse" )
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
	else
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
}
//===============================================================================================
 function BodyInit()
 {   
 	  BindingDataList();
	  pro_fpfo00110.Call('SELECT');
 } 
 
 //========================================================================
function BindingDataList()
{    
    var data="";    
		
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from prod.TPR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;	 	
	 	
    //-----------
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";	             
} 
//===============================================================================================
 function OnDataReceive(po_oData)
 {
    switch (po_oData.id)
    {
 		case 'data_fpfo00110' :            
            if ( grdOrdPlan.rows > 1 )
            {
                grdOrdPlan.SetCellBgColor( 1, G1_Style_Code, grdOrdPlan.rows - 1, G1_Style_Code, 0xCCFFFF );
            }                   
        break;       
	    
		case 'data_fpfo00110_1' :
		break;
				
        case 'data_fpfo00110_1' :            
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G2_IN_COMP_ID,  grdDetail.rows - 1, G2_IN_COMP_NAME, 0xCCFFFF );
                grdDetail.SetCellBgColor( 1, G2_BAL_QTY,  grdDetail.rows - 1, G2_BAL_QTY, 0xCCFFFF );
                grdDetail.SetCellBgColor( 1, G2_REQ_QTY,  grdDetail.rows - 1, G2_REQ_QTY, 0xCCFFFF );
                
                grdDetail.SetCellBold( 1, G2_IN_COMP_ID,     grdDetail.rows - 1, G2_IN_COMP_ID, true);
                grdDetail.SetCellBold( 1, G2_PLAN_QTY,    grdDetail.rows - 1, G2_BAL_QTY, true);				                		
            }                   
        break;   
		
		case 'pro_fpfo00110' :
			OnSearch('OrdPlan');
		break;          
    }
 }
//===============================================================================================
 function OnSearch(pos)
 {
        switch(pos)
        {
            case 'OrdPlan':
                data_fpfo00110.Call('SELECT');
            break;
            
            case 'Detail':
                data_fpfo00110_1.Call('SELECT');
            break;
        }        
 }

//===============================================================================================
function OnGridCellClick(obj)
{
    switch (obj.id)
    {
        case 'grdOrdPlan':
            if ( grdOrdPlan.row > 0 )
            {   
				grdOrdPlan.SetCellBold( 1, G1_Style_Code, grdOrdPlan.rows-1, G1_PO_No, false);
			 
				grdOrdPlan.SetCellBold( grdOrdPlan.row, G1_Style_Code, grdOrdPlan.row, G1_Style_Code, true);
				grdOrdPlan.SetCellBold( grdOrdPlan.row, G1_PO_No,      grdOrdPlan.row, G1_PO_No,      true);
				
				lblStylePO.text = grdOrdPlan.GetGridData( grdOrdPlan.row, G1_Style_Code ) + ' / ' + grdOrdPlan.GetGridData( grdOrdPlan.row, G1_PO_No );
				            
				txtOrdPlanPK.text = grdOrdPlan.GetGridData( grdOrdPlan.row, G1_OrdPlan_PK );
				txtStylePK.text   = grdOrdPlan.GetGridData( grdOrdPlan.row, G1_Style_PK   );
				
                OnSearch('Detail');
            }    
        break;
    }
} 

//=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'RG':
            pro_fpfo00110.Call();
        break;      
    }        
}
//===================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpfo00110" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="prod.sp_pro_fpfo00110" > 
                <input>
                    <input bind="lstFactory" /> 
                </input> 
                <output>
                    <output bind="lstRoutingGroup" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_fpfo00110" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod" parameter='0,3,6' function="PROD.sp_sel_fpfo00110" >
                <input >
					<input bind="lstFactory" />
                    <input bind="txtPOStyle" />
                </input> 
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_fpfo00110_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso type="grid" user="prod"   function="prod.sp_sel_fpfo00110_1"   >
                <input >
                    <input bind="txtOrdPlanPK" />
					<input bind="lstRoutingGroup" />					
					<input bind="txtComponent" />
					<input bind="txtSpec" />
					<input bind="chkDetail" />
					<input bind="lstLang" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 35%" id="t-left">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Fac
                        </td>
                        <td style="width: 45%">
                            <gw:list id="lstFactory" text="" styles="width:100%" onchange="OnProcess('RG')" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            P/O Style
                        </td>
                        <td style="width: 44%">
                            <gw:textbox id="txtPOStyle" styles="width:100%" onenterkey="OnSearch('OrdPlan')" />
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch2" img="search" alt="Search" onclick="OnSearch('OrdPlan')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="6">
                            <gw:grid id='grdOrdPlan' header='_PK|Style Code|Style Name|_Style_PK|P/O No' format='0|0|0|0|0'
                                aligns='0|0|0|0|0' defaults='||||' editcol='0|0|0|0|0' widths='0|1500|2500|0|1000'
                                sorting='T' styles='width:100%; height:100%' onclick="OnGridCellClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%" id="t-right">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 2%">
                            <img status="expand" id="imgClose" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td style="width: 100%; white-space: nowrap" colspan="4">
                            <gw:label id="lblStylePO" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td>
                            Lang
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstLang" styles='width:100%' onchange="OnSearch('Detail')" />
                        </td>
                        <td style="width: 20%" align="right">
                            Detail
                            <gw:checkbox id="chkDetail" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('Detail')"></gw:checkbox>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap">
                            R/G
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="center">
                            <gw:list id="lstRoutingGroup" styles="width: 100%" onchange="OnSearch('Detail')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Comp
                        </td>
                        <td style="width: 25%; white-space: nowrap" align="center">
                            <gw:textbox id="txtComponent" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>
                        <td align="right" style="width: 5%">
                            Spec
                        </td>
                        <td style="width: 25%" colspan="2">
                            <gw:textbox id="txtSpec" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('Detail')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="11">
                            <gw:grid id='grdDetail' header='|_pt_component_pk|Component ID|Component Name|_spec01_pk|Spec01 ID|_spec02_pk|Spec02 ID|_spec03_pk|Spec03 ID|_spec04_pk|Spec04 ID|_spec05_pk|Spec05 ID|Plan Qty|Req Qty|QC Qty|Def Qty|Bal Qty'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                check='||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1500|2000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtOrdPlanPK" style="display: none" />
    <gw:textbox id="txtStylePK" style="display: none" />
    <!------------------------------------------------------------------>
    <gw:grid id='grdTmp' header='D1|D2|D3|D4|D5' format='0|0|0|0|0' aligns='0|0|0|0|0'
        defaults='||||' editcol='1|1|1|1|1' widths='1000|1000|1000|1000|1000' sorting='T'
        styles='width:100%; height:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
