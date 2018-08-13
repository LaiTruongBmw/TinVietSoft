<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>W/H Stock Checking 3</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>


<script type="text/javascript">

var G_WH_NAME       = 0,
	G1_LOCATION		= 1,
    G_ITEM_CODE     = 2,
    G_ITEM_NAME     = 3,
    G_UOM           = 4,
    G_LOT_NO        = 5,
    G_BEGIN_QTY     = 6,
	G_OPEN_QTY		= 7,
    G_INCOME_QTY    = 8,
	G_PROD_IN_QTY   = 9,
	G_ASS_IN_QTY    = 10,
	G_TRANS_IN      = 11,
	G_EX_IN         = 12,
    G_IN_RETURN_QTY = 13,
	G_OTHERS_IN     = 14,
    G_OUTGO_QTY     = 15,
	G_DELI_QTY      = 16,
	G_PROD_OUT_QTY  = 17,
	G_ASS_OUT_QTY   = 18,
	G_TRANS_OUT     = 19,
	G_EX_OUT        = 20,
    G_OUT_RETURN_QTY= 21,
	G_DISCARD_QTY   = 22,
	G_OTHERS_OUT    = 23,
	G_ADJ_QTY		= 24,
    G_END_QTY       = 25,
	G_ITEM_PK		= 26,
	G_WH_PK			= 27;
    
//===========================================================================
function BodyInit()
{
    System.Translate(document); 
    //----------------
    var now = new Date(); 
    var lmonth, ldate;

    //----------------
    SetGridFormat();
    //----------------- 
    BindReportList(); 
}

//===========================================================================
function SetGridFormat()
{ 
    var ctr2 = grdStockTrans.GetGridControl();  
    ctr2.ColFormat(G_BEGIN_QTY)     = "#,###,###,###,###,###.##";
	ctr2.ColFormat(G_OPEN_QTY)      = "#,###,###,###,###,###.##";
    ctr2.ColFormat(G_INCOME_QTY)    = "#,###,###,###,###,###.##";
	ctr2.ColFormat(G_PROD_IN_QTY)   = "#,###,###,###,###,###.##";
	ctr2.ColFormat(G_ASS_IN_QTY)    = "#,###,###,###,###,###.##";
    ctr2.ColFormat(G_OUTGO_QTY)     = "#,###,###,###,###,###.##";
	ctr2.ColFormat(G_DELI_QTY)      = "#,###,###,###,###,###.##";
	ctr2.ColFormat(G_PROD_OUT_QTY)  = "#,###,###,###,###,###.##";	
	ctr2.ColFormat(G_ASS_OUT_QTY)   = "#,###,###,###,###,###.##";	
	ctr2.ColFormat(G_TRANS_IN)      = "#,###,###,###,###,###.##";
	ctr2.ColFormat(G_TRANS_OUT)     = "#,###,###,###,###,###.##";
	ctr2.ColFormat(G_EX_IN)         = "#,###,###,###,###,###.##";
	ctr2.ColFormat(G_EX_OUT)        = "#,###,###,###,###,###.##";	
	ctr2.ColFormat(G_OTHERS_IN)     = "#,###,###,###,###,###.##";
	ctr2.ColFormat(G_OTHERS_OUT)    = "#,###,###,###,###,###.##";	
    ctr2.ColFormat(G_IN_RETURN_QTY) = "#,###,###,###,###,###.##";
    ctr2.ColFormat(G_OUT_RETURN_QTY)= "#,###,###,###,###,###.##";
	ctr2.ColFormat(G_DISCARD_QTY)   = "#,###,###,###,###,###.##";
	ctr2.ColFormat(G_ADJ_QTY)       = "#,###,###,###,###,###.##";
    ctr2.ColFormat(G_END_QTY)       = "#,###,###,###,###,###.##";
    
    ctr2.MergeCells  = 2 ;	
    ctr2.MergeCol(0) = true ; 
    ctr2.MergeCol(1) = true ;
    ctr2.MergeCol(2) = true ;
    ctr2.MergeCol(3) = true ;
    ctr2.MergeCol(4) = true ; 
	
	ctr2.FrozenCols = G_ITEM_NAME ; 
	//------------------------------------------------------
	var data = ""; 
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||";
    lstWHType.SetDataText(data);
    lstWHType.value = '';
    //-----------------
    data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_IN_WAREHOUSE where del_if = 0 and use_yn='Y' order by wh_id ")%>||"; 
    lstWH.SetDataText(data);
    lstWH.value = '';
    //---------------------------
	data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";
    lstItemGroup.SetDataText(data);
    lstItemGroup.value = '';
	
	//---------------------------
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang1.SetDataText(data);      
    lstLang1.value = "<%=Session("SESSION_LANG")%>";	
   
    //-----------------          
}

//===========================================================================

function OnSearch()
{
    data_bisc00070.Call('SELECT');
}
//===========================================================================

function OnReport()
{
    var url =System.RootURL + "/standard/reports/bi/sc/" + lstReportType.value +
                              "?p_from_date=" + dtFrom.value +
                              "&p_to_date=" + dtTo.value + 
                              "&p_wh_type=" + lstWHType.value + 
                              "&p_tin_warehouse_pk=" + lstWH.value + 
                              "&p_item_group_pk=" + lstItemGroup.value + 
                              "&p_item=" + txtItem.text + 
                              "&p_in_out_yn=" + chkInOut.GetData() + 
                              "&p_lang=" + lstLang1.value + 
                              "&p_wh_name=" + lstWH.GetText();
    System.OpenTargetPage(url);
}

//==================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bisc00070':            
            if ( grdStockTrans.rows > 1 )
            {
                grdStockTrans.SetCellBold( 1, G_ITEM_CODE, grdStockTrans.rows - 1, G_ITEM_CODE, true );
                
                grdStockTrans.SetCellBold( 1, G_BEGIN_QTY, grdStockTrans.rows - 1, G_BEGIN_QTY, true );
                
                grdStockTrans.SetCellBgColor( 1, G_OPEN_QTY,  grdStockTrans.rows - 1, G_OTHERS_IN, 0xCCFFFF );
                grdStockTrans.SetCellBgColor( 1, G_OUTGO_QTY, grdStockTrans.rows - 1, G_ADJ_QTY,   0xFFFFCC );
                
                grdStockTrans.SetCellBold( 1, G_END_QTY,   grdStockTrans.rows - 1, G_END_QTY,   true );
                
                grdStockTrans.Subtotal( 0, 2, -1, '5!6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24');
            }    
        break;                
    }
}

var vITEM_PK = 0 ;
var vWH_PK   = 0 ;
var vTYPE    = '' ;
//==================================================================

function OnCellDoubleClick()
{
	if ( event.col > G_BEGIN_QTY && event.col < G_END_QTY && event.row > 0 )
	{
		var col = event.col ;
		var row = event.row ;	 
	
	    if ( col == G_OPEN_QTY )
	    {
			vTYPE = 'ADJ-IN' ;
	    }
		else if ( col == G_INCOME_QTY )
		{
			vTYPE = 'INCOME' ;
		}
		else if ( col == G_PROD_IN_QTY )
		{
			vTYPE = 'PROD-IN' ;
		}
		else if ( col == G_ASS_IN_QTY )
		{
			vTYPE = 'ASS-IN' ;
		}
		else if ( col == G_TRANS_IN )
		{
			vTYPE = 'TRANS_IN' ;
		}
		else if ( col == G_EX_IN )
		{
			vTYPE = 'EX_IN' ;
		}	
		else if ( col == G_IN_RETURN_QTY )
		{
			vTYPE = 'RETURN_IN' ;
		}
		else if ( col == G_OTHERS_IN )
		{
			vTYPE = 'OTHERS_IN' ;
		}
		else if ( col == G_OUTGO_QTY )
		{
			vTYPE = 'OUTGO' ;
		}
		else if ( col == G_DELI_QTY )
		{
			vTYPE = 'DELI' ;
		}		
		else if ( col == G_PROD_OUT_QTY )
		{
			vTYPE = 'PROD-OUT' ;
		}
		else if ( col == G_ASS_OUT_QTY )
		{
			vTYPE = 'ASS-OUT' ;
		}
		else if ( col == G_TRANS_OUT )
		{
			vTYPE = 'TRANS_OUT' ;
		}	
		else if ( col == G_EX_OUT )
		{
			vTYPE = 'EX_OUT' ;
		}
		else if ( col == G_OUT_RETURN_QTY )
		{
			vTYPE = 'RETURN_OUT' ;
		}	
		else if ( col == G_DISCARD_QTY )
		{
			vTYPE = 'DISCARD' ;
		}
		else if ( col == G_OTHERS_OUT )
		{
			vTYPE = 'OTHERS_OUT' ;
		}
		else if ( col == G_ADJ_QTY )
		{
			vTYPE = 'ADJ-OUT' ;
		}						
		
	    vWH_PK   = grdStockTrans.GetGridData( row, G_WH_PK );
		vITEM_PK = grdStockTrans.GetGridData( row, G_ITEM_PK );
			
	    var url = System.RootURL + '/standard/forms/bi/sc/bisc00071.aspx';         
		var aValue  = System.OpenModal(  url , 600, 450, 'resizable:yes;status:yes', this);	
	}	
	else if ( event.col == G_ITEM_CODE )
	{
		 var col = event.col ;
		 var row = event.row ;		
		 
	     vWH_PK   = grdStockTrans.GetGridData( row, G_WH_PK );
		 vITEM_PK = grdStockTrans.GetGridData( row, G_ITEM_PK );
			
		 var url = System.RootURL + '/standard/forms/bi/sc/bisc00072.aspx';         
		 var aValue  = System.OpenModal(  url , 650, 450, 'resizable:yes;status:yes', this);	
	}			
}

//==================================================================
function BindReportList(){
	data = "<%=CtlLib.SetListDataSQL("select v.CHA_VALUE2,v.CODE_NM from vlg_code v where v.group_id='LGCM0050' and v.CHA_VALUE1='bisc00070' order by nvl(v.NUM_VALUE1,0)")%>";
    lstReportType.SetDataText(data);
}

function OnPopUp(pos){
    switch (pos)
    {
        case 'REPORT':
		    var url = System.RootURL + '/standard/forms/fp/ab/fpab00790.aspx?group_id=LGCM0050&cha_value2=bisc00070';
			var rtnData = System.OpenModal(  url , 500, 200, 'resizable:yes;status:yes;', this);
			lstReportType.SetDataText(rtnData);
			
		break;
    }
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
 	<!---------------------------------------------------------------->
    <gw:data id="pro_bisc00070" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_bisc00070" >
                <input>
                    <input bind="lstWHType" />
                    <input bind="lstUseYn" />
                </input>
                <output>
                    <output bind="lstWH" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bisc00070" > 
                <input> 
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="lstWHType" />
                    <input bind="lstWH" />
                    <input bind="lstUseYn" />
					<input bind="lstItemGroup" />
                    <input bind="txtItem" />
                    <input bind="chkInOut" />
                    <input bind="lstLang1" />
					<input bind="txtLocation" />
                </input> 
                <output bind="grdStockTrans" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="width: 100%; height: 0%;">
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
		</tr>
        
        <tr style="height: 1%">
            <td colspan="5" align="right">
                W/H
            </td>
			<td colspan="20">
                <gw:list id="lstWHType" styles="width:100%" onchange="pro_bisc00070.Call('SELECT')" />
            </td>
            <td colspan="25">
                <gw:list id="lstWH" styles="width:100%" />
            </td>
            <td colspan="10" align="right">
                <gw:list id="lstUseYn" styles="width: 100%;display:none" onchange="pro_bisc00070.Call('SELECT')">
					<data>ListUse|Y|In use|N|Not in use|ALL|All</data>
				</gw:list>
            </td>
			<td colspan="5" align="right">
			    Date
            </td>
            <td colspan="20" align="left">
                <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" />
                ~<gw:datebox id="dtTo" lang="<%=Application("Lang")%>" />
            </td>
            <td colspan="3" align="right">
            </td>
			<td colspan="8" style="white-space: nowrap" align="right">
               
            </td>
			<td colspan="2" >
                <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
            </td>
            <td colspan="2" >
                <gw:button id="btnReport" img="excel" alt="Report" onclick="OnReport()" />
            </td>
        </tr>
		
        <tr style="height: 1%">
			<td colspan="5" align="right">
                Item
            </td>
			<td colspan="20">
                <gw:list id="lstItemGroup" styles="width:100%" />
            </td>
            <td colspan="25">
                <gw:textbox id="txtItem" styles="width:100%;" onenterkey="OnSearch()" />
            </td>
			<td colspan="15" align="right">
				 Location
            </td>
			<td colspan="18" align="right">
			    <gw:textbox id="txtLocation" styles="width:100%;" onenterkey="OnSearch()" />
            </td>
            <td colspan="15" align="right">
                <gw:checkbox id="chkInOut" styles="color:red" defaultvalue="Y|N" value="Y">In/Out>0</gw:checkbox>
            </td>
            <td colspan="2" >
                
            </td>                  
        </tr>
				
        <tr style="height: 98%">
            <td colspan="100">
                <gw:grid id='grdStockTrans' header='Warehouse Name|Location|Item Code|Item Name|UOM|Lot No|Begin Qty|Adj In|Income Qty|Prod In|Ass In|Trans In|Ex In|Return In|Others In|Outgo Qty|Deli Qty|Prod Out|Ass Out|Trans Out|Ex Out|Return Out|Discard Qty|Others Out|Adj Out|End Qty|_Item_PK|_WH_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|1|1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|0|0'
                    check='|||||||||||||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='2000|1500|2000|3000|1000|1500|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|0|0'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnCellDoubleClick()" 
					acceptnulldate="T"/>
            </td>
        </tr>
    </table>
	<gw:list id="lstReportType" styles='width:100%;display:none' />
	 <gw:list id="lstLang1" styles='width:80%;display:none' />
</body>
<!------------------------------------------------------->
</html>
